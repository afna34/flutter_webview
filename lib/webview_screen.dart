import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

class WebViewScreen extends StatefulWidget {
  const WebViewScreen({super.key});

  @override
  State<WebViewScreen> createState() => _WebViewScreenState();
}

class _WebViewScreenState extends State<WebViewScreen> {
  InAppWebViewController? webViewController;
  late var url;
  var initialUrl = "https://www.pub.dev/";
  var urlController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
              child: InAppWebView(
            onLoadStart: (controller, url) {
              var v = url.toString();
              setState(() {
                urlController.text = v;
              });
            },
            onWebViewCreated: (controller) => webViewController = controller,
            initialUrlRequest: URLRequest(url: Uri.parse(initialUrl)),
          )),
        ],
      ),
    );
  }
}
