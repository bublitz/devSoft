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

import static android.media.ThumbnailUtils.createVideoThumbnail;

public class ActVideo extends AppCompatActivity {

    static final int REQUEST_IMAGE_CAPTURE = 1;
    static final int REQUEST_VIDEO_CAPTURE = 2;
    static final int REQUEST_MIDIA_CAPTURE = 3;

    final Context ctx = this;

    String tipo_midia;
    static File videoFile;

    private Long id;
    private int v, targetW, targetH;
    private ImageView imgFoto;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.act_video);
        Toolbar toolbar = (Toolbar) findViewById(R.id.toolbar);
        setSupportActionBar(toolbar);

        Bundle b = getIntent().getExtras();
        id = b.getLong("id");
        v = b.getInt("v");

        imgFoto = (ImageView) findViewById(R.id.imgFoto);
        if (videoFile != null) {
            setPic();
        }
        targetW = imgFoto.getWidth();
        targetH = imgFoto.getHeight();
    }


    public void usar(View v) {
        if (videoFile != null ) {
            DBAdapter db = new DBAdapter(ctx);
            db.open();
            db.salvaMidia(id, videoFile.getPath());
            db.close();
            videoFile = null;
            finish();
        } else
            Toast.makeText(ctx, "Selecione um arquivo ou grave um vídeo!", Toast.LENGTH_LONG).show();
    }

    private File createVideoFile() throws IOException {
        // Create an image file name
        String imageName = "btv_v_" + id + "_" + v + ".mp4";
        File storageDir = Environment.getExternalStoragePublicDirectory(Environment.DIRECTORY_MOVIES);
        storageDir.mkdirs();
        File video = new File(storageDir, imageName);
        return video;
    }

    public void galeria(View v) {
        tipo_midia = MediaStore.Video.Media.DATA;
        Intent takeMidiaIntent = new Intent(Intent.ACTION_GET_CONTENT);
        startActivityForResult(Intent.createChooser(takeMidiaIntent.setType("video/*"),
                "Selecione um vídeo"), REQUEST_MIDIA_CAPTURE);
    }

    public void foto(View v) {
        Intent takeVideoIntent = new Intent(MediaStore.ACTION_VIDEO_CAPTURE);
        if (takeVideoIntent.resolveActivity(getPackageManager()) != null) {
            videoFile = null;
            try {
                videoFile = createVideoFile();
            } catch (IOException ex) {
            }
            if (videoFile != null) {
                Uri videoURI = Uri.fromFile(videoFile);
                //takeVideoIntent.putExtra(MediaStore.EXTRA_VIDEO_QUALITY, 0);
//                takeVideoIntent.putExtra(MediaStore.EXTRA_SIZE_LIMIT, 30*1024*1024);
                takeVideoIntent.putExtra(MediaStore.EXTRA_DURATION_LIMIT, 20);
                takeVideoIntent.putExtra(MediaStore.EXTRA_OUTPUT, videoURI);
                startActivityForResult(takeVideoIntent, REQUEST_VIDEO_CAPTURE);
            }
        }
    }

    @Override
    protected void onActivityResult(int requestCode, int resultCode, Intent data) {
        super.onActivityResult(requestCode, resultCode, data);
        if (requestCode == REQUEST_VIDEO_CAPTURE && resultCode == RESULT_OK) {
            if ((videoFile != null ) && (videoFile.length() > 50*1024*1024)) {
                videoFile = null;
                Toast.makeText(ctx, "Arquivo muito grande!", Toast.LENGTH_LONG).show();
            }
            setPic();

        } else if (requestCode == REQUEST_MIDIA_CAPTURE && resultCode == RESULT_OK) {
            try {
                Uri uri = data.getData();
                String path = _getRealPathFromURI(getApplicationContext(), uri, tipo_midia);
                videoFile = new File(path);
                if ((videoFile != null ) && (videoFile.length() > 30*1024*1024)) {
                    videoFile = null;
                    Toast.makeText(ctx, "Arquivo muito grande!", Toast.LENGTH_LONG).show();
                }
                setPic();
            } catch (FileNotFoundException e) {
                videoFile = null;
                setPic();
            } catch (Exception e) {
                videoFile = null;
                setPic();
            }
        }
    }

    private String _getRealPathFromURI(Context context, Uri contentUri, String tipo) throws FileNotFoundException {
        String[] proj = {tipo};
        CursorLoader loader = new CursorLoader(context, contentUri, proj, null, null, null);
        Cursor cursor = loader.loadInBackground();
        int column_index = cursor.getColumnIndexOrThrow(tipo);
        cursor.moveToFirst();
        return cursor.getString(column_index);

        //return String.valueOf(context.getContentResolver().openInputStream(contentUri));
    }

    private void setPic() {
        if (videoFile != null) {
            Bitmap bitmap = createVideoThumbnail(videoFile.getPath(),
                    MediaStore.Video.Thumbnails.FULL_SCREEN_KIND);
            imgFoto.setImageBitmap(bitmap);
        } else imgFoto.setImageResource(android.R.color.transparent);
    }

}
