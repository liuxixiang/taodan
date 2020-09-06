import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:taodan/common/values/colors.dart';
import 'package:taodan/common/values/styles.dart';

class ItemWidget extends StatelessWidget {
  final String leftIcon;
  final String itemName;
  final TextStyle itemNameStyle;
  final String itemRightText;
  final TextStyle itemRightTextStyle;
  Widget _rightWidget;

  ItemWidget(
      {Key key,
      @required this.itemName,
      this.leftIcon,
      Widget rightWidget,
      this.itemNameStyle,
      this.itemRightText,
      this.itemRightTextStyle})
      : _rightWidget = rightWidget ?? Icon(Icons.keyboard_arrow_right),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Image.asset(leftIcon),
          Text(
            itemName,
            style: itemNameStyle ?? AppStyles.textSize15_black_33,
          ),
          Text(
            itemRightText + '',
            style: itemNameStyle ?? AppStyles.textSize15_99,
          ),
          _rightWidget,
        ],
      ),
    );
  }
}
