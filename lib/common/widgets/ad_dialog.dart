import 'package:bloom_ad/banner_ad_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:taodan/common/values/dimens.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

abstract class AdDialog extends Dialog {
  final double width;

  AdDialog({Key key, double width = AppDimens.dpDialogWidth})
      : width = width.w,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
        type: MaterialType.transparency,
        child: Container(
          //卡片大小
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: width,
                child: buildDialogContent(),
              ),
              SizedBox(
                height: 8.h,
              ),
              _buildAdBanner()],
          ),
        ));
  }

  Widget buildDialogContent();

  _buildAdBanner() {
    return BannerAdView(
      unitId: "b1",
      width: width,
      height: width / 6.4,
      onAdLoad: (String id) {
        print("BannerAd onAdLoad");
      },
      onAdShow: (String id) {
        print("BannerAd onAdShow");
      },
      onAdClick: (String id) {
        print("BannerAd onAdClick");
      },
      onAdClose: (String id) {
        print("BannerAd onAdClose");
      },
      onError: (String id, int code, String message) {
        print("BannerAd onError");
      },
    );
  }
}
