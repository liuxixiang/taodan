package com.wenshan.taodan;

import android.app.Activity;
import android.content.Intent;
import android.os.Bundle;

import androidx.annotation.NonNull;
import androidx.annotation.Nullable;

import com.linkin.adsdk.AdConfig;
import com.linkin.adsdk.AdSdk;

import io.flutter.app.FlutterApplication;

public class TaoDanApplication extends FlutterApplication {

    private static final String APP_ID = "ba0063bfbc1a5ad878"; // 请替换成分配到的 appId
    private static final long MIN_SPLASH_INTERVAL = 3 * 60 * 1000L;

    @Override
    public void onCreate() {
        super.onCreate();

        AdSdk.getInstance().init(getApplicationContext(),
                new AdConfig.Builder()
                        .appId(APP_ID)
                        // .userId("uid") // 未登录可不设置 userId，登录时再设置
                        .multiProcess(false)
                        .debug(BuildConfig.DEBUG)
                        .build(),
                null);

        setMinSplashInterval(MIN_SPLASH_INTERVAL);
    }

    /** 设置最短开屏间隔时间，如果切到后台超出此间隔时间，回到前台任意页面都会显示开屏，以提升开屏广告的曝光量 */
    private void setMinSplashInterval(final long minSplashInterval) {
        registerActivityLifecycleCallbacks(new ActivityLifecycleCallbacks() {
            private int activityCount = 0;
            private long leaveTime = 0;

            @Override
            public void onActivityCreated(@NonNull Activity activity, @Nullable Bundle savedInstanceState) {
            }

            @Override
            public void onActivityStarted(@NonNull Activity activity) {
                if (0 == activityCount++) {
                    // App 回到前台
                    if (System.currentTimeMillis() - leaveTime >= minSplashInterval) {
                        if (!(activity instanceof SplashActivity)) {
                            Intent intent = new Intent(activity, SplashActivity.class);
                            intent.addFlags(Intent.FLAG_ACTIVITY_NO_ANIMATION); // 无动画
                            activity.startActivity(intent);
                        }
                    }
                }
            }

            @Override
            public void onActivityResumed(@NonNull Activity activity) {
            }

            @Override
            public void onActivityPaused(@NonNull Activity activity) {
            }

            @Override
            public void onActivityStopped(@NonNull Activity activity) {
                if (0 == --activityCount) {
                    // App 切到后台
                    leaveTime = System.currentTimeMillis();
                }
            }

            @Override
            public void onActivitySaveInstanceState(@NonNull Activity activity, @NonNull Bundle outState) {
            }

            @Override
            public void onActivityDestroyed(@NonNull Activity activity) {
            }
        });
    }
}
