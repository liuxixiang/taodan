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
                      if (imagePickCallBack != null) {
                        ImagePicker imagePicker = ImagePicker();
                        imagePickCallBack(
                            await _fromGallery(context, imagePicker),
                            imagePicker);
                      }
                    },
                  ),
                  CupertinoActionSheetAction(
                    child: const Text('拍照'),
                    onPressed: () async {
                      ImagePicker imagePicker = ImagePicker();
                      imagePickCallBack(
                          await _fromCamera(context, imagePicker), imagePicker);
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

  /// 从相机
  static Future<File> _fromCamera(BuildContext context,ImagePicker imagePicker) async {
    Navigator.of(context).pop();
    try {
      var image = await imagePicker.getImage(source: ImageSource.camera);
      File file = await CropImageUtil.cropImage(context, image);
      return file;
    } catch (e) {
      print(e);
    }
    return null;
  }

  /// 从相册
  // ignore: missing_return
  static Future<File> _fromGallery(
      BuildContext context, ImagePicker imagePicker) async {
    Navigator.of(context).pop();
    try {
      var image = await imagePicker.getImage(source: ImageSource.gallery);
      File file = await CropImageUtil.cropImage(context, image);
      return file;
    } catch (e) {
      print(e);
    }
    return null;
  }
}
