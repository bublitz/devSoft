package br.jus.tre_mt.caixa1;


import android.Manifest;
import android.app.Activity;
import android.app.Dialog;
import android.app.ProgressDialog;
import android.content.Context;
import android.content.Intent;
import android.content.pm.PackageManager;
import android.os.AsyncTask;
import android.os.Bundle;
import android.support.design.widget.NavigationView;
import android.support.v4.app.ActivityCompat;
import android.support.v4.view.GravityCompat;
import android.support.v4.widget.DrawerLayout;
import android.support.v7.app.ActionBarDrawerToggle;
import android.support.v7.app.AppCompatActivity;
import android.support.v7.widget.Toolbar;
import android.telephony.TelephonyManager;
import android.text.Html;
import android.text.Spanned;
import android.view.Menu;
import android.view.MenuItem;
import android.view.View;
import android.widget.ImageButton;
import android.widget.TextView;
import android.widget.Toast;

import org.json.JSONObject;

import java.sql.Timestamp;
import java.util.Date;
import java.util.List;

import dao.DBAdapter;
import dao.Gasto;
import dao.GastoComp;
import dao.Informante;
import dao.Midia;
import dao.RespGasto;

public class MainActivity extends AppCompatActivity
        implements NavigationView.OnNavigationItemSelectedListener {

    final Context ctx = this;
    static List<GastoComp> listaGasto;
    static List<Midia> listaMidia;
    static DBAdapter db;
    static int enviadas, aEnviar;
    ProgressDialog mDialog;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        Toolbar toolbar = (Toolbar) findViewById(R.id.toolbar);
        setSupportActionBar(toolbar);

        DrawerLayout drawer = (DrawerLayout) findViewById(R.id.drawer_layout);
        ActionBarDrawerToggle toggle = new ActionBarDrawerToggle(
                this, drawer, toolbar, R.string.navigation_drawer_open, R.string.navigation_drawer_close);
        drawer.setDrawerListener(toggle);
        toggle.syncState();

        NavigationView navigationView = (NavigationView) findViewById(R.id.nav_view);
        navigationView.setNavigationItemSelectedListener(this);

        verifyStoragePermissions(this);

        //TelephonyManager tm = (TelephonyManager) getSystemService(Context.TELEPHONY_SERVICE);
        //String num = tm.getLine1Number();
        //Toast.makeText(ctx, num, Toast.LENGTH_LONG).show();
    }


    @Override
    public boolean onCreateOptionsMenu(Menu menu) {
        // Inflate the menu; this adds items to the action bar if it is present.
        getMenuInflater().inflate(R.menu.main, menu);
        return true;
    }

    @Override
    public boolean onOptionsItemSelected(MenuItem item) {
        // Handle action bar item clicks here. The action bar will
        // automatically handle clicks on the Home/Up button, so long
        // as you specify a parent activity in AndroidManifest.xml.
        int id = item.getItemId();

        //noinspection SimplifiableIfStatement
        if (id == R.id.action_settings) {
            final Dialog dialog = new Dialog(ctx);

            dialog.setContentView(R.layout.info);
            dialog.setTitle(getResources().getString(R.string.app_name));
            dialog.setCanceledOnTouchOutside(true);
            String formattedText1 = null;
            String formattedText2 = null;

            formattedText1 = getString(R.string.txt_info1_mt);
            formattedText2 = getString(R.string.txt_info2_mt);

            TextView txtInfo1 = (TextView) dialog
                    .findViewById(R.id.txtInfo1);
            Spanned result = Html.fromHtml(formattedText1);
            txtInfo1.setText(result);

            TextView txtInfo2 = (TextView) dialog
                    .findViewById(R.id.txtInfo2);
            result = Html.fromHtml(formattedText2);
            txtInfo2.setText(result);

            ImageButton btnOK = (ImageButton) dialog
                    .findViewById(R.id.btnOK);
            btnOK.setOnClickListener(new View.OnClickListener() {
                @Override
                public void onClick(View v) {
                    dialog.dismiss();
                }
            });
            btnOK.setOnLongClickListener(new View.OnLongClickListener() {
                @Override
                public boolean onLongClick(View v) {
                    Spanned result = Html.fromHtml(getString(R.string.txt_info3_mt));
                    TextView txtInfo2 = (TextView) dialog
                            .findViewById(R.id.txtInfo2);
                    txtInfo2.setText(result);
                    return false;
                }
            });
            dialog.show();
            return false;
        }

        return super.onOptionsItemSelected(item);
    }

    @SuppressWarnings("StatementWithEmptyBody")
    @Override
    public boolean onNavigationItemSelected(MenuItem item) {
        // Handle navigation view item clicks here.
        int id = item.getItemId();

        if (id == R.id.nav_gallery) {
            // Handle the camera action
            enviaGravadas();

        } else if (id == R.id.nav_slideshow) {
            Intent i = new Intent(this, ActProtocolo.class);
            startActivity(i);
        }

        DrawerLayout drawer = (DrawerLayout) findViewById(R.id.drawer_layout);
        drawer.closeDrawer(GravityCompat.START);
        return true;
    }

    public void clkGasto(View v) {
        Intent i = new Intent(this, ActGasto.class);
        startActivity(i);
    }

    public void clkLimite(View v) {
        Intent i = new Intent(this, ActLimite.class);
        startActivity(i);
    }

    public void clkConsulta(View v) {
        Intent i = new Intent(this, ActConsulta.class);
        Bundle b = new Bundle();
        b.putLong("id", 0L);
        i.putExtras(b);
        startActivity(i);
    }

    public void enviaGravadas() {
        try {
            db = new DBAdapter(getApplicationContext());
            db.open();
            listaGasto = db.getGastos(true, false); //comMidias, enviada
            aEnviar = listaGasto.size();

            if (aEnviar > 0) {
                new AsyncTask<String, Void, String>() {
                    @Override
                    protected void onPreExecute() {
                        mDialog = ProgressDialog.show(MainActivity.this,
                                "Enviando gastos gravados!", "Aguarde...", true, true);
                        mDialog.setCancelable(false);
                    }

                    @Override
                    protected String doInBackground(String... params) {
                        EnviarGasto envio = new EnviarGasto();
                        RespGasto rgasto = null;
                        List<Midia> midias = null;
                        String res = null;
                        String ret = "";
                        String chave = "#TOKEN$DE$TESTE#";

                        outerloop:
                        for (int i = 0; i < listaGasto.size(); i++) {
                            ret = db.getUrlCandidato(listaGasto.get(i).getNumero());
                            if (ret != "") {
                                try {
                                    String realUrl = "http://apps.tre-mt.jus.br/caixa1/api/gasto/candidato/" +
                                            ret;
                                    JSONObject json = new JSONObject();
                                    Gasto gasto = new Gasto();
                                    gasto.setId(listaGasto.get(i).getId());
                                    gasto.setDescricao(listaGasto.get(i).getDescricao());
                                    gasto.setCriadoEm(listaGasto.get(i).getDh_criacao());
                                    gasto.setTipoDeGasto(listaGasto.get(i).getCod_tipo());
                                    if (listaGasto.get(i).getCpf() != null) {
                                        gasto.setInformante(new Informante(listaGasto.get(i).getCpf()));
                                    }

                                    json.put("descricao", listaGasto.get(i).getDescricao());
                                    json.put("criadoEm", System.currentTimeMillis());
                                    json.put("tipoDeGasto", listaGasto.get(i).getCod_tipo());
                                    String sjson = json.toString();
                                    if (listaGasto.get(i).getCpf() != null) {
                                        sjson = sjson.substring(0, sjson.lastIndexOf("}"));
                                        sjson += ",\"informante\":{\"cpf\": \"" + listaGasto.get(i).getCpf() + "\"}}";
                                    }
                                    res = envio.requestGasto(realUrl, chave, sjson);

                                    if (res.indexOf("motivo") == -1 ) {
                                        JSONObject rjson = new JSONObject(res);
                                        res = "";
                                        String protocolo = rjson.getString("protocolo");
                                        Long recebidoEm = rjson.getLong("recebidoEm");
                                        String token = rjson.getString("chaveParaEnvioDeMidia");
                                        Date dt = new Timestamp(recebidoEm);
                                        rgasto = new RespGasto(Long.valueOf(protocolo), dt, token);
                                        String midiaUrl = "http://apps.tre-mt.jus.br/caixa1";
                                        midias = db.getMidias(listaGasto.get(i).getId());
                                        for (int t = 0; t < midias.size(); t++) {
                                            res = envio.requestMidia(midiaUrl, protocolo, chave,
                                                    token, midias.get(t).getFilename());
                                            if (res.indexOf("motivo") == -1) {
                                                JSONObject jmidia = new JSONObject(res);
                                                token = jmidia.getString("chaveParaEnvioDeMidia");
                                                midias.get(t).setToken(token);
                                                midias.get(t).setDh_envio(new Timestamp(jmidia.getLong("recebidoEm")));
                                            } else {
                                                ret = res;
                                                break outerloop;
                                            }
                                        }
                                        db.saveGasto(gasto, (long) listaGasto.get(i).getNumero(), rgasto);
                                        db.salvaMidias(gasto, midias);
                                        aEnviar--;
                                    } else {
                                        ret = res;
                                        break outerloop;
                                    }
                                } catch (Exception e) {
                                    ret = "\"motivo\":\"Erro ao enviar: Tente novamente!\"";
                                }
                            }
                        }
                        return ret;
                    }

                    @Override
                    protected void onPostExecute(String res) {
                        mDialog.dismiss();
                        if (aEnviar == 0) {
                            Toast.makeText(ctx, "Dados enviados com sucesso!!!", Toast.LENGTH_LONG).show();
                            db.atualiza();
                        } else {
                            String msg = res.substring(res.indexOf("motivo")+9);
                            Toast.makeText(ctx, msg.substring(0, msg.indexOf("\"")), Toast.LENGTH_LONG).show();
                        }
                        db.close();
                    }
                }.executeOnExecutor(AsyncTask.THREAD_POOL_EXECUTOR);
            } else {
                Toast.makeText(ctx, "Não há informações a enviar!!!", Toast.LENGTH_LONG).show();
            }
        } catch (Exception e){
        }
    }

    private static final int REQUEST_EXTERNAL_STORAGE = 1;
    private static String[] PERMISSIONS_STORAGE = {
            Manifest.permission.READ_EXTERNAL_STORAGE,
            Manifest.permission.WRITE_EXTERNAL_STORAGE
    };

    /**
     * Checks if the app has permission to write to device storage
     * <p/>
     * If the app does not has permission then the user will be prompted to grant permissions
     *
     * @param activity
     */
    public static void verifyStoragePermissions(Activity activity) {
        // Check if we have write permission
        int permission = ActivityCompat.checkSelfPermission(activity, Manifest.permission.WRITE_EXTERNAL_STORAGE);

        if (permission != PackageManager.PERMISSION_GRANTED) {
            // We don't have permission so prompt the user
            ActivityCompat.requestPermissions(
                    activity,
                    PERMISSIONS_STORAGE,
                    REQUEST_EXTERNAL_STORAGE
            );
        }
    }
}
