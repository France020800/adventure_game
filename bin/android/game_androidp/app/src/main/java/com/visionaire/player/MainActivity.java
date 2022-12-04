package com.visionaire.player;

import android.app.Activity;
import android.content.ActivityNotFoundException;
import android.content.Intent;
import android.content.pm.ApplicationInfo;
import android.content.pm.PackageManager;
import android.content.pm.PackageManager.NameNotFoundException;
import android.net.Uri;
import android.os.Bundle;
import android.widget.Toast;

import org.libsdl.app.SDLActivity;

public class MainActivity extends Activity {
	public static MainActivity instance;
	public static String ApkPath, SavePath;

	protected void onCreate(Bundle savedInstanceState) {
		instance = this;
		super.onCreate(savedInstanceState);
		Intent myIntent = new Intent(MainActivity.this, SDLActivity.class);
		myIntent.setFlags(Intent.FLAG_ACTIVITY_NEW_TASK | Intent.FLAG_ACTIVITY_TASK_ON_HOME);
		startActivity(myIntent);
	}

	@Override
	protected void onRestart() {
		super.onRestart();
		Intent myIntent = new Intent(MainActivity.this, SDLActivity.class);
		myIntent.setFlags(Intent.FLAG_ACTIVITY_NEW_TASK | Intent.FLAG_ACTIVITY_TASK_ON_HOME);
		startActivity(myIntent);
	}

	public String getApk()
	{
		PackageManager pm = getPackageManager();
	    try {
	        ApplicationInfo ai = pm.getApplicationInfo(getPackageName(), 0);
			return ai.publicSourceDir;
	    } catch (NameNotFoundException e) {
	        e.printStackTrace();
	    }
	    return "";
	}
	public String getSaveDir()
	{
		return SDLActivity.getContext().getFilesDir().getAbsolutePath();
	}

	public static void startBrowser(String download_link)
	{
		try {
		    Intent myIntent = new Intent(Intent.ACTION_VIEW, Uri.parse(download_link));
		    SDLActivity.mSingleton.startActivity(myIntent);
		} catch (ActivityNotFoundException e) {
		    Toast.makeText(SDLActivity.mSingleton, "No application can handle this request."
		        + " Please install a webbrowser",  Toast.LENGTH_LONG).show();
		} catch (Exception e)
		{
			e.printStackTrace();
		}
	}

	public native void initEnv();	
	public void _initEnv()
	{
		if(ApkPath == null || ApkPath=="")
			ApkPath=getApk();
		SavePath=getSaveDir();		
		initEnv();
	}
}
