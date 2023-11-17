package br.jus.tre_mt.caixa1;


import android.webkit.MimeTypeMap;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;

import okhttp3.MediaType;
import okhttp3.OkHttpClient;
import okhttp3.Request;
import okhttp3.RequestBody;
import okhttp3.Response;

/**
 * Created by jorgebublitz on 21/08/16.
 */

public class EnviarGasto {

    public static final MediaType JSON
            = MediaType.parse("application/json; charset=utf-8");

    public static String requestGasto(String URL, String chave, String jsonObjSend) {

        OkHttpClient client = new OkHttpClient();

        RequestBody body = RequestBody.create(JSON, jsonObjSend);

        Request request = new Request.Builder()
                .url(URL)
                .addHeader("Accept", "application/json")
                .addHeader("Content-type", "application/json;charset=UTF-8;")
                .addHeader("X-CAIXA-1-TOKEN", chave)
                .post(body)
                .build();
        Response response = null;
        try {
            response = client.newCall(request).execute();
            return response.body().string();
        } catch (IOException e) {
        }
        return "\"motivo\":\"Erro ao enviar dados! Tente novamente mais tarde!\"";
    }


    public static String requestMidia(String URL, String protocolo, String chave, String token, String file) {
        String ret = "";
        File file1 = null;
        InputStream imagem = null;
        // testar tamanho
        try {
            file1 = new File(file);
            //if (file1.length() <= 50*1024*1024) {
            //imagem = new FileInputStream(file);
            //MyByteArrayOutputStream buffer = new MyByteArrayOutputStream();
            //int nRead;
            //byte[] data = new byte[1024];
            //while ((nRead = imagem.read(data, 0, data.length)) != -1) {
            //    buffer.write(data, 0, nRead);
            //}
            //imagem.close();
            //buffer.flush();
            //byte[] byteArray = buffer.toByteArray();

            String ext = file.substring(file.lastIndexOf(".") + 1);
            String ftipo = MimeTypeMap.getSingleton().getMimeTypeFromExtension(ext);
            MediaType tipo = MediaType.parse(ftipo);

            OkHttpClient client = new OkHttpClient();

            RequestBody body = RequestBody.create(tipo, file1);
            String realUrl = URL + "/api/gasto/" + protocolo + "/midia/";
            Request request = new Request.Builder()
                    .url(realUrl)
                    .addHeader("X-CAIXA-1-TOKEN", chave)
                    .addHeader("X-CAIXA-1-MEDIA-KEY", token)
                    .post(body)
                    .build();
            Response response = client.newCall(request).execute();
            ret = response.body().string();
            //} else { ret = "\"motivo\":\"Erro ao enviar: Arquivo muito grande!\""; }
        } catch (Exception e) {
            return "\"motivo\":\"Erro ao enviar: Arquivo muito grande! Selecione um arquivo com menos de 30 MiB!\"";
        }
        return ret;
    }

}
