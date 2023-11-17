package br.jus.tre_mt.caixa1;

import android.content.Context;
import android.content.CursorLoader;
import android.content.Intent;
import android.database.Cursor;
import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.net.Uri;
import android.os.Bundle;
import android.os.Environment;
import android.provider.MediaStore;
import android.support.v7.app.AppCompatActivity;
import android.support.v7.widget.Toolbar;
import android.view.View;
import android.widget.ImageView;
import android.widget.Toast;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.IOException;

import dao.DBAdapter;

public class ActFoto extends AppCompatActivity {

    static final int REQUEST_IMAGE_CAPTURE = 1;
    static final int REQUEST_VIDEO_CAPTURE = 2;
    static final int REQUEST_MIDIA_CAPTURE = 3;

    final Context ctx = this;

    String tipo_midia;
    static File imageFile = null;

    private Long id;
    private int v, targetW, targetH;
    private ImageView imgFoto;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.act_foto);
        Toolbar toolbar = (Toolbar) findViewById(R.id.toolbar);
        setSupportActionBar(toolbar);

        Bundle b = getIntent().getExtras();
        id = b.getLong("id");
        v = b.getInt("v");

        imgFoto = (ImageView) findViewById(R.id.imgFoto);
        if (imageFile != null) {
            setPic();
        }
        targetW = imgFoto.getWidth();
        targetH = imgFoto.getHeight();
    }

    public void usar(View v) {
        if (imageFile != null) {
            DBAdapter db = new DBAdapter(ctx);
            db.open();
            db.salvaMidia(id, imageFile.getPath());
            db.close();
            imageFile = null;
            finish();
        }else
            Toast.makeText(ctx, "Selecione um arquivo ou tire uma foto!", Toast.LENGTH_LONG).show();
    }

    private File createImageFile() throws IOException {
        // Create an image file name
        String imageName = "btv_f_" + id + "_" + v + ".png";
        File storageDir = Environment.getExternalStoragePublicDirectory(Environment.DIRECTORY_PICTURES);
        storageDir.mkdirs();
        File image = new File(storageDir, imageName);
        return image;
    }

    public void galeria(View v) {
        tipo_midia = MediaStore.Images.Media.DATA;
        Intent takeMidiaIntent = new Intent(Intent.ACTION_GET_CONTENT);
        startActivityForResult(Intent.createChooser(takeMidiaIntent.setType("image/*"),
                "Selecione uma imagem"), REQUEST_MIDIA_CAPTURE);
    }

    public void foto(View v) {
        Intent takePictureIntent = new Intent(MediaStore.ACTION_IMAGE_CAPTURE);
        if (takePictureIntent.resolveActivity(getPackageManager()) != null) {
            imageFile = null;
            try {
                imageFile = createImageFile();
            } catch (IOException ex) {
            }
            if (imageFile != null) {
                Uri photoURI = Uri.fromFile(imageFile);
                takePictureIntent.putExtra(MediaStore.EXTRA_OUTPUT, photoURI);
                startActivityForResult(takePictureIntent, REQUEST_IMAGE_CAPTURE);
            }
        }
    }

    @Override
    protected void onActivityResult(int requestCode, int resultCode, Intent data) {
        super.onActivityResult(requestCode, resultCode, data);
        if (requestCode == REQUEST_IMAGE_CAPTURE && resultCode == RESULT_OK) {
            //midias.add(new Midia(gasto, imageFile.getPath(), 1));
            //salvaMidias();
            setPic();

        } else if (requestCode == REQUEST_MIDIA_CAPTURE && resultCode == RESULT_OK) {
            try {
                Uri uri = data.getData();
                String path = _getRealPathFromURI(getApplicationContext(), uri, tipo_midia);
                imageFile = new File(path);
                //midias.add(new Midia(gasto, path, 1));
                setPic();

            } catch (FileNotFoundException e) {
            } catch (Exception e) {
            }
        }
    }

    private String _getRealPathFromURI(Context context, Uri contentUri, String tipo) throws FileNotFoundException {
        String[] proj = {tipo};
        CursorLoader loader = new CursorLoader(context, contentUri, proj, null, null, null);
        Cursor cursor = loader.loadInBackground();
        int column_index = cursor.getColumnIndexOrThrow(tipo);
        cursor.moveToFirst();
        //return cursor.getString(column_index);

        return String.valueOf(context.getContentResolver().openInputStream(contentUri));
    }

    private void setPic() {
        BitmapFactory.Options bmOptions = new BitmapFactory.Options();
        bmOptions.inJustDecodeBounds = true;
        BitmapFactory.decodeFile(imageFile.getPath(), bmOptions);
        int photoW = bmOptions.outWidth;
        int photoH = bmOptions.outHeight;

        if (targetH == 0) {
            targetH = 200;
        }
        if (targetW == 0) {
            targetW = 200;
        }
        int scaleFactor = Math.min(photoW / targetW, photoH / targetH);

        // Decode the image file into a Bitmap sized to fill the View
        bmOptions.inJustDecodeBounds = false;
        bmOptions.inSampleSize = scaleFactor;
        bmOptions.inPurgeable = true;

        Bitmap bitmap = BitmapFactory.decodeFile(imageFile.getPath(), bmOptions);
        imgFoto.setImageBitmap(bitmap);
    }

}
