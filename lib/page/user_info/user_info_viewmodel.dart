import 'package:flutter/cupertino.dart';
import 'package:stacked/stacked.dart';
import 'package:taodan/api/http_utils.dart';
import 'package:taodan/common/apis/api_upload.dart';
import 'package:taodan/common/apis/api_user.dart';
import 'package:taodan/utils/object_utils.dart';
import 'package:taodan/utils/toast_utils.dart';

class UserInfoViewModel extends BaseViewModel {
  String _avatarImage;

  String get avatarImage => _avatarImage;

  uploadHead(String filePath, String fileName)  {
    UploadAPI.upload(filePath, fileName, (data)  {
      if (data != null) {
        _avatarImage =
            ObjectUtils.isNotEmpty(data.thumbnail) ? data.thumbnail : data.img;
        if (ObjectUtils.isNotEmpty(_avatarImage)) {
          UserAPI.updateUserInfo((message) {
            ToastUtils.showCenterToast(message);
          }, avatarImage: _avatarImage);
        }
      }
    });
  }
}
