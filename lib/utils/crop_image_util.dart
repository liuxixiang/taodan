import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

class CropImageUtil {
  /// 裁剪
  static Future<File> cropImage(
      BuildContext context, PickedFile imageFile) async {
    if (imageFile != null) {
      File croppedFile = await ImageCropper.cropImage(
        /// 图像文件的绝对路径。
        sourcePath: imageFile.path,

        /// 最大裁剪的图像宽度
        maxWidth: 256,

        /// 最大裁剪的图像高度
        maxHeight: 256,

        /// 控制裁剪菜单视图中纵横比的列表。在Android中，您可以通过设置的值来设置启动裁切器时的初始化纵横比AndroidUiSettings.initAspectRatio
        aspectRatioPresets: [CropAspectRatioPreset.square],

        /// 控制裁剪边界的样式，可以是矩形或圆形样式
        cropStyle: CropStyle.circle,

        /// 结果图像的格式，png或jpg
        compressFormat: ImageCompressFormat.jpg,

        /// 用于控制图像压缩的质量，取值范围[1-100]
        compressQuality: 100,
        androidUiSettings: AndroidUiSettings(
          toolbarTitle: "裁剪",
          toolbarColor: Theme.of(context).accentColor,
          statusBarColor: Theme.of(context).accentColor,
          toolbarWidgetColor: Colors.white,
        ),
        iosUiSettings: IOSUiSettings(
          minimumAspectRatio: 1.0,
          doneButtonTitle: '确定',
          cancelButtonTitle: '取消',
        ),
      );
      return croppedFile;
    }
    return null;
  }
}
