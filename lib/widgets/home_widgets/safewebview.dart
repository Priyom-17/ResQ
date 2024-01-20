import 'package:flutter/material.dart';
import 'package:webview_flutter/src/webview.dart';

class SafeWebView extends StatelessWidget {
  final String? url;
  SafeWebView({this.url});
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: WebView(
        initialUrl: url,
      ),
    );
  }
}