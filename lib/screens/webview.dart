import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';


class WebViewGen extends StatefulWidget {
  const WebViewGen({required this.url});
  final String url;

  @override
  State<WebViewGen> createState() => _WebViewState();
}

class _WebViewState extends State<WebViewGen> {
  String get url => widget.url;
  late final WebViewController _controller;
  bool isLoading = true;

  void loadUrl() {
    _controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0x00000000))
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {
            // Update loading bar if needed.
          },
          onPageStarted: (String url) {
            setState(() {
              isLoading = true;
            });
          },
          onPageFinished: (String url) {
            setState(() {
              isLoading = false;
            });
          },
          onWebResourceError: (WebResourceError error) {
            // Handle web resource error, such as SSL errors.
            print('Web resource error: $error');
          },
         
        ),
      )
      ..loadRequest(Uri.parse(widget.url));
  }

  @override
  void initState() {
    super.initState();
    loadUrl();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Stack(
          children: [
            WebViewWidget(controller: _controller),
            if (isLoading)
              Center(
                child: CircularProgressIndicator(),
              ),
          ],
        ),
      ),
    );
  }
}
