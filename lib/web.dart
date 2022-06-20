import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:webview_flutter_plus/webview_flutter_plus.dart';

import 'login.dart';

class Web extends StatefulWidget {
  const Web({Key? key}) : super(key: key);

  @override
  State<Web> createState() => _WebState();
}

class _WebState extends State<Web> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: WebViewPlus(
        javascriptMode: JavascriptMode.unrestricted,
        onWebViewCreated: (controller){
          controller.loadUrl("assets/webpages/index.html");
        },
        javascriptChannels: {
          JavascriptChannel(name: 'Captcha', onMessageReceived: (JavascriptMessage message){
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) =>Login()));
          })
        },
      ));
  }
}
