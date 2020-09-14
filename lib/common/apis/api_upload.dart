import 'package:taodan/api/http_utils.dart';
import 'package:taodan/model/image_entity.dart';

import 'api_path.dart';
import 'apis.dart';

class UploadAPI {
  static upload(
    String filePath,
    String fileName,
    OnNetSuccess<ImageEntity> onNetSuccess,
  ) {
    HttpUtils.instance.uploadFile(
      ApiPath.common.upload,
      filePath,
      filename: fileName,
      onSuccess: (code, msg, data) {
        if (onNetSuccess != null) {
          onNetSuccess(ImageEntity.fromJson(data));
        }
      },
    );
  }
}
