import 'package:flutter/material.dart';
import 'package:games_hub/utils/fuctions.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebviewScreen extends StatefulWidget {
  const WebviewScreen({super.key});

  @override
  State<WebviewScreen> createState() => _WebviewScreenState();
}

class _WebviewScreenState extends State<WebviewScreen> {
  late WebViewController _controller;
  String currentWebPage = 'IGN';
  String currentWebPageUrl = 'https://in.ign.com/';
  double webProgress = 0;
  @override
  void initState() {
    super.initState();
    _controller = WebViewController()
      ..loadRequest(Uri.parse(currentWebPageUrl))
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {
            setState(() {
              webProgress = progress / 100;
            });
          },
          onHttpError: (HttpResponseError error) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                backgroundColor: theme.colorScheme.secondary,
                content: Text('Error: ${error.response}',
                    style: theme.textTheme.labelSmall!
                        .copyWith(color: Colors.white)),
              ),
            );
            _controller.reload();
          },
          onWebResourceError: (WebResourceError error) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                backgroundColor: theme.colorScheme.secondary,
                content: Text('Error: ${error.description}',
                    style: theme.textTheme.labelSmall!
                        .copyWith(color: Colors.white)),
              ),
            );
            _controller.reload();
          },
          onNavigationRequest: (NavigationRequest request) {
            return NavigationDecision.navigate;
          },
        ),
      );
  }

  // //!Change Web Page-
  // void _changeWebPage(String url, String webSiteName) {
  //   setState(() {
  //     currentWebPage = webSiteName;
  //     currentWebPageUrl = url;
  //     _controller.loadRequest(Uri.parse(currentWebPageUrl));
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: true,
      child: PopScope(
        canPop: false,
        onPopInvokedWithResult: (didPop, _) async {
          if (didPop) return;
          final canGoBack = await _controller.canGoBack();
          if (canGoBack) {
            _controller.goBack();
          }
        },
        child: Stack(
          alignment: Alignment.topCenter,
          children: [
            WebViewWidget(controller: _controller),
            if (webProgress < 1)
              SizedBox(
                height: 5,
                child: LinearProgressIndicator(
                  value: webProgress,
                  color: theme.colorScheme.primary,
                  backgroundColor: Colors.white,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
