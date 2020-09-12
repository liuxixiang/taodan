import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';
import 'package:taodan/utils/crop_image_util.dart';

typedef ImagePickCallBack = Function(File file, ImagePicker imagePicker);

class ImagePickUtil {
  static openImageSheet(
      BuildContext context, ImagePickCallBack imagePickCallBack) {
    showCupertinoModalPopup<String>(
        context: context,
        builder: (context) => CupertinoActionSheet(
//            title: const Text('Favorite Dessert'),
//            message: Text(
//                'Please select the best dessert from the options below.',),
                actions: <Widget>[
                  CupertinoActionSheetAction(
                    child: const Text('图库'),
                    onPressed: () async {
                      _getImage(ImageSource.gallery, imagePickCallBack);
                      Navigator.of(context).pop();
                    },
                  ),
                  CupertinoActionSheetAction(
                    child: const Text('拍照'),
                    onPressed: () async {
                      _getImage(ImageSource.camera, imagePickCallBack);
                      Navigator.of(context).pop();
                    },
                  ),
                ],
                cancelButton: CupertinoActionSheetAction(
                  child: const Text('取消'),
                  isDefaultAction: true,
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                )));
  }

  static _getImage(
      ImageSource source, ImagePickCallBack imagePickCallBack) async {
    ImagePicker imagePicker = ImagePicker();
    var image = await imagePicker.getImage(source: source);
    if (image != null && (image.path ?? "").isNotEmpty) {
      File file = await CropImageUtil.cropImage(image.path);
      if (file != null && imagePickCallBack != null) {
        imagePickCallBack(file, imagePicker);
      }
    }
  }
}
