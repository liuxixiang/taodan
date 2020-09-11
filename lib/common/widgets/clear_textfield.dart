import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:taodan/common/values/colors.dart';
import 'package:taodan/common/values/styles.dart';

typedef TextChanged = void Function(String value);

class ClearTextField extends StatefulWidget {
  const ClearTextField(
      {Key key,
      @required this.onChanged,
      this.hintText,
      this.maxLength,
      this.controller,
      this.hintStyle,
      this.style})
      : super(key: key);

  final TextChanged onChanged;
  final int maxLength;
  final TextEditingController controller;
  final String hintText;
  final TextStyle hintStyle;
  final TextStyle style;

  @override
  State<StatefulWidget> createState() {
    return _ClearTextFieldState();
  }
}

class _ClearTextFieldState extends State<ClearTextField> {
  TextEditingController _controller;
  String inputText = '';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = widget.controller ?? TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
      children: <Widget>[
        TextField(
          //不使用maxLength 右下角会出现1/8
          inputFormatters: [LengthLimitingTextInputFormatter(widget.maxLength)],
          controller: widget.controller ?? _controller,
          style: widget.style ?? AppStyles.textSize16_black_33,
          //输入文本的样式
          onChanged: (inputText) {
            setState(() {
              this.inputText = inputText;
            });
            widget.onChanged(inputText);
          },
          decoration: InputDecoration(
            // border: InputBorder.none,
            // border: new UnderlineInputBorder(
            //   borderSide: BorderSide(color: Colors.red, width: 1.0, style: BorderStyle.none )),
            //去掉输入框的下滑线
            fillColor: Colors.white,
            filled: true,
            suffixIcon: hidingIcon(),
            hintText: widget.hintText ?? '',
            hintStyle: widget.hintStyle ?? AppStyles.textSize16_black_33,
          ),
        ),
      ],
    ));
  }

  Widget hidingIcon() {
    if (inputText.length > 0) {
      return IconButton(
          icon: Icon(
            Icons.clear,
            color: Colors.red,
          ),
          splashColor: Colors.redAccent,
          onPressed: () {
            setState(() {
              inputText = '';
              _controller.clear();
            });
          });
    } else {
      return null;
    }
  }

  @override
  dispose() {
    super.dispose();
    _controller.dispose();
  }
}
