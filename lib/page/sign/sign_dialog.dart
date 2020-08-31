import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:taodan/common/widgets/ad_dialog.dart';

class SignDialog extends AdDialog {
  @override
  buildDialogContent() {
    return Container(
      child: Column(
          children: [
          _buildDialogHead(),
      ],
    ),);
  }

  _buildDialogHead() {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          height: 200,
          width: 200,
          color: Colors.red,
        ),
        // Positioned(
        //   left: 10,
        //   right: 10,
        //   bottom: 10,
        //   top: 10,
        //   child: Container(
        //     color: Colors.green,
        //   ),
        // )
      ],
    );
  }
}
