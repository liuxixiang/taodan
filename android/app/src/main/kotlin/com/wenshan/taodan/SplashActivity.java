package com.wenshan.taodan;

import android.Manifest;
import android.app.Activity;
import android.content.Intent;
import android.content.pm.PackageManager;
import android.os.Build;
import android.os.Bundle;
import android.util.Log;
import android.view.KeyEvent;
import android.widget.FrameLayout;
import android.widget.Toast;

import com.linkin.adsdk.AdSdk;

import java.util.ArrayList;
import java.util.List;

public class SplashActivity extends Activity {

    private static final String TAG = SplashActivity.class.getSimpleName();
    private static final int SPLASH_LOAD_TIMEOUT = 5000;
    private static final int PERMISSIONS_REQUEST_CODE = 1024;

    private FrameLayout mContainer;
    private boolean mPaused;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_splash);

        mContainer = findViewById(R.id.container);

        // 检查、申请必要权限
        if (checkAndRequestPermission()) {
            loadSplashAd();
        }
    }

    @Override
    protected void onResume() {
        super.onResume();
        if (mPaused) {
            next();
        }
        mPaused = false;
    }

    @Override
    protected void onPause() {
        super.onPause();
        mPaused = true;
    }

    /** 开屏页一定要禁止用户对返回按钮的控制，否则将可能导致用户手动退出了 App 而广告无法正常曝光和计费 */
    @Override
    public boolean onKeyDown(int keyCode, KeyEvent event) {
        if (keyCode == KeyEvent.KEYCODE_BACK || keyCode == KeyEvent.KEYCODE_HOME) {
            return true;
        }
        return super.onKeyDown(keyCode, event);
    }

    @Override
    public void onRequestPermissionsResult(int requestCode, String[] permissions, int[] grantResults) {
        super.onRequestPermissionsResult(requestCode, permissions, grantResults);
        if (requestCode == PERMISSIONS_REQUEST_CODE) {
            mPaused = false;
            loadSplashAd();
        }
    }

    private void loadSplashAd() {
        AdSdk.getInstance().loadSplashAd(this, "s1", mContainer, SPLASH_LOAD_TIMEOUT,
                new AdSdk.SplashAdListener() {
                    @Override
                    public void onAdShow(String id) {
                        Log.d(TAG, "SplashAd onAdShow");
                    }

                    @Override
                    public void onAdClick(String id) {
                        Log.d(TAG, "SplashAd onAdClick");
                    }

                    @Override
                    public void onAdDismiss(String id) {
                        Log.d(TAG, "SplashAd onAdDismiss");
                        if (!mPaused) {
                            next();
                        }
                    }

                    @Override
                    public void onError(String id, int code, String message) {
                        Log.d(TAG, "SplashAd onError: code=" + code + ", message=" + message);
                        Toast.makeText(SplashActivity.this, "【" + code + "】" + message, Toast.LENGTH_LONG).show();
                        next();
                    }
                });
    }

    /**
     * 【非常重要】READ_PHONE_STATE 权限用于允许 SDK 获取用户标识，
     * 允许获取权限的，投放定向广告；不允许获取权限的用户，投放通投广告，会导致广告填充和 eCPM 单价下降。
     */
    private boolean checkAndRequestPermission() {
        if (Build.VERSION.SDK_INT < Build.VERSION_CODES.M) {
            return true;
        }

        List<String> lackedPermission = new ArrayList<>();
        if (!(checkSelfPermission(Manifest.permission.READ_PHONE_STATE) == PackageManager.PERMISSION_GRANTED)) {
            lackedPermission.add(Manifest.permission.READ_PHONE_STATE);
        }

        if (!(checkSelfPermission(Manifest.permission.ACCESS_FINE_LOCATION) == PackageManager.PERMISSION_GRANTED)) {
            lackedPermission.add(Manifest.permission.ACCESS_FINE_LOCATION);
        }

        if (!(checkSelfPermission(Manifest.permission.WRITE_EXTERNAL_STORAGE) == PackageManager.PERMISSION_GRANTED)) {
            lackedPermission.add(Manifest.permission.WRITE_EXTERNAL_STORAGE);
        }

        if (lackedPermission.isEmpty()) {
            return true;
        }

        // 请求缺少的权限，在 onRequestPermissionsResult 中返回是否获得权限
        String[] requestPermissions = new String[lackedPermission.size()];
        lackedPermission.toArray(requestPermissions);
        requestPermissions(requestPermissions, PERMISSIONS_REQUEST_CODE);
        return false;
    }

    private void next() {
        // 是启动页，则启动 MainActivity；否则直接 finish
        if (isLauncher()) {
            Intent intent = new Intent(SplashActivity.this, MainActivity.class);
            startActivity(intent);
        }

        finish();
        overridePendingTransition(0, 0); // 无动画
    }

    private boolean isLauncher() {
        Intent intent = getIntent();
        if (null != intent) {
            return intent.hasCategory(Intent.CATEGORY_LAUNCHER)
                    && Intent.ACTION_MAIN.equals(intent.getAction());
        }

        return false;
    }
}
