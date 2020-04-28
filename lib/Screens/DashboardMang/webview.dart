import 'package:webview_flutter/webview_flutter.dart';
import 'package:flutter/material.dart';

class AarviWebView extends StatefulWidget {
  @override
  _AarviWebViewState createState() => _AarviWebViewState();
}

class _AarviWebViewState extends State<AarviWebView> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: SafeArea(
        child: const WebView(
          initialUrl: 'https://aarvitextiles-4cbc8.firebaseapp.com/',
          javascriptMode: JavascriptMode.unrestricted,
        ),
      ),
    );
  }
}