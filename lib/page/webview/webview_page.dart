import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebviewWidget extends StatefulWidget {
  String url;
  WebviewWidget(this.url);
  @override
  _WebviewWidgetState createState() => _WebviewWidgetState();
}

class _WebviewWidgetState extends State<WebviewWidget> {
  bool _loading;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("淘蛋蛋"),
      ),
      body: WebView(
        initialUrl: widget.url,

        ///初始化url
        javascriptMode: JavascriptMode.unrestricted,

        ///JS执行模式
        onWebViewCreated: (WebViewController webViewController) {
          ///在WebView创建完成后调用，只会被调用一次
          //
          //
          // _controller.complete(webViewController);
        },
        javascriptChannels: <JavascriptChannel>[
          ///JS和Flutter通信的Channel；
          // _alertJavascriptChannel(context),
        ].toSet(),
        navigationDelegate: (NavigationRequest request) {
          //路由委托（可以通过在此处拦截url实现JS调用Flutter部分）；
          ///通过拦截url来实现js与flutter交互
          if (request.url.startsWith('js://webview')) {
            // Fluttertoast.showToast(msg: 'JS调用了Flutter By navigationDelegate');
            print('blocking navigation to $request}');
            return NavigationDecision.prevent;

            ///阻止路由替换，不能跳转，因为这是js交互给我们发送的消息
          }
          if (request.url.startsWith("https://wx.tenpay.com")) {}

          return NavigationDecision.navigate;

          ///允许路由替换
        },
        onPageFinished: (String url) {
          ///页面加载完成回调
          setState(() {
            _loading = false;
          });
          print('Page finished loading: $url');
        },
      ),
    );
  }
}
