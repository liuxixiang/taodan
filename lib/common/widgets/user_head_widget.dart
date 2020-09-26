import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:taodan/common/values/colors.dart';
import 'package:taodan/state/user_state.dart';
import 'package:taodan/utils/assets_util.dart';
import 'package:taodan/utils/object_utils.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UserHeadWidget extends StatelessWidget {
  final double imageRadius;
  final double width;
  final double height;

  const UserHeadWidget(
      {Key key, this.imageRadius = 25, this.width = 50, this.height = 50})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    String avatarImage = Provider.of<UserState>(context).userInfo?.avatarImage;
    bool isLogin = Provider.of<UserState>(context).isLogin;
    return Container(
      decoration: BoxDecoration(
          border: Border.all(color: AppColors.gray_97, width: 1),
          borderRadius: BorderRadius.circular(42)),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(imageRadius.w),
        child: (isLogin && ObjectUtils.isNotEmpty(avatarImage))
            ? CachedNetworkImage(
                width: width.w,
                height: height.w,
                imageUrl: avatarImage,
                placeholder: (context, url) => CircularProgressIndicator(),
                errorWidget: (context, url, error) =>
                    Image.asset(AssetsUtil.mine.head),
              )
            : Image.asset(AssetsUtil.mine.head),
      ),
    );
  }
}
