import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:taodan/utils/object_utils.dart';

class TdCacheNetworkImage extends StatelessWidget {
  final String url;
  final String errPath;
  final Widget placeholder;

  TdCacheNetworkImage(
      {Key key, @required this.url, this.errPath, this.placeholder})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ObjectUtils.isNotEmpty(url)
        ? CachedNetworkImage(
            fit: BoxFit.cover,
            imageUrl: url,
            errorWidget: (context, url, error) => Image.asset(
              errPath,
              fit: BoxFit.cover,
            ),
            placeholder: (context, url) => placeholder ?? Container(),
          )
        : Image.asset(
            errPath,
            fit: BoxFit.cover,
          );
  }
}
