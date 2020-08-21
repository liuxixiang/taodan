import 'package:flutter/material.dart';
import 'package:taodan/utils/yy_screen_util.dart';

class ProgressWidget extends StatefulWidget {
  int progress;
  int max;
  double width;
  double height;
  double radius;
  double borderWidth;
  Color borderColor;
  Color bgColor;
  Color progressColor;

  ProgressWidget(this.progress,
      {Key key,
      int max = 100,
      this.radius,
      this.width,
      this.height,
      this.progressColor,
      Color bgColor = Colors.white,
      this.borderColor}) {
    this.max = max;
    this.progressColor = progressColor;
    this.bgColor = bgColor;
    this.radius =
        radius == null ? YYScreenUtil.setHeight(10).toDouble() : radius;
    this.width = width == null ? YYScreenUtil.setHeight(57).toDouble() : width;
    this.height =
        height == null ? YYScreenUtil.setHeight(18).toDouble() : height;
    this.progressColor =
        progressColor == null ? Color(0xFFFB8E92) : progressColor;
    this.borderColor = borderColor == null ? Color(0xffB12A2E) : borderColor;
    this.borderWidth = YYScreenUtil.setWidth(2);
  }
  @override
  _ProgressWidgetState createState() => _ProgressWidgetState();
}

class _ProgressWidgetState extends State<ProgressWidget> {
  _ProgressWidgetState();
  double innerWidth;
  num progress;
  @override
  void initState() {
    innerWidth =
        widget.progress / widget.max * (widget.width - widget.borderWidth * 2);
    progress = 100.toDouble() * widget.progress / widget.max;
    if (progress > 100) {
      progress = 100;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.width,
      height: widget.height,
      child: ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(widget.radius)),
          child: Stack(
            children: <Widget>[
              Container(
                decoration: BoxDecoration(
                  color: widget.bgColor,
                  border: Border.all(
                    color: widget.borderColor,
                    width: widget.borderWidth,
                  ),
                  borderRadius:
                      BorderRadius.all(Radius.circular(widget.radius)),
                ),
              ),
              Positioned(
                left: widget.borderWidth,
                top: widget.borderWidth,
                child: ClipRRect(
                  borderRadius:
                      BorderRadius.all(Radius.circular(widget.radius)),
                  child: Container(
                    width: innerWidth,
                    height: widget.height - widget.borderWidth * 2,
                    decoration: BoxDecoration(color: widget.progressColor),
                    child: Center(
                      child: Text(progress.toString() + "%",
                          style: TextStyle(
                              fontSize: YYScreenUtil.setSp(9),
                              color: Colors.white)),
                    ),
                  ),
                ),
              )
            ],
          )),
    );
  }
}
