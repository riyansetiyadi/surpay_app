import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:surpay_app/utils/webview_helper.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebviewScreen extends StatefulWidget {
  final String url;
  const WebviewScreen({
    super.key,
    required this.url,
  });

  @override
  State<WebviewScreen> createState() => _WebviewScreenState();
}

class _WebviewScreenState extends State<WebviewScreen> {
  final WebviewHelper webviewHelper = WebviewHelper();
  late final WebViewController _controller;
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();

    _controller = webviewHelper.initWebview(
      mainUrl: widget.url,
      onLoadingChanged: (isLoading) {
        setState(() {
          _isLoading = isLoading;
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Surpay App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Stack(
        children: [
          PopScope(
            canPop: false,
            onPopInvokedWithResult: (didPop, result) async {
              if (await _controller.canGoBack()) {
                await _controller.goBack();
              } else {
                if (context.mounted) {
                  context.go('/home');
                }
              }
            },
            child: WebViewWidget(
              controller: _controller,
            ),
          ),
          if (_isLoading)
            Container(
              color: Colors.black.withOpacity(0.5),
              child: const Center(
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.green),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
