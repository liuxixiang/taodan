import 'package:bloom_ad/banner_ad_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

abstract class AdDialog extends Dialog {
  @override
  Widget build(BuildContext context) {
    return new Material(
        type: MaterialType.transparency,
        child: Container(
          child: Column(
            children: [buildDialogContent(), _buildAdBanner()],
          ),
        ));
  }

  buildDialogContent();

  _buildAdBanner() {
    BannerAdView(
      unitId: "b1",
      width: 300,
      height: 300 / 6.4,
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
