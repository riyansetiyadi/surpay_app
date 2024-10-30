import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:surpay_app/utils/webview_helper.dart';
import 'package:surpay_app/widgets/navigation_bar/main_bottom_bar.dart';
import 'package:surpay_app/widgets/navigation_bar/webview_app_bar.dart';
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
  String _title = '';

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
      onTitleChanged: (title) {
        setState(() {
          _title = title ?? '';
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: WebviewAppBar(title: _title),
        bottomNavigationBar: const MainBottomBar(
          initiateIndex: 1,
        ),
        body: Container(
          color: Colors.white,
          child: Stack(
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
        ),
      ),
    );
  }
}
