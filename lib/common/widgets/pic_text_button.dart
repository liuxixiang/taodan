import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PicTextButton extends StatefulWidget {
  Text text;
  String imgPath;
  VoidCallback f;
  num width;

  PicTextButton(this.text, this.imgPath, this.f, this.width);

  @override
  _PicTextButtonState createState() => _PicTextButtonState();
}

class _PicTextButtonState extends State<PicTextButton> {
  @override
  Widget build(BuildContext context) {
    print("wendjia " + widget.width.toString());
    return Container(
      width: widget.width.w,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(widget.imgPath),
        ),
      ),
      child: FlatButton(
        onPressed: widget.f,
        child: widget.text,
      ),
    );
  }
}
