import 'dart:io';

import 'package:flutter/material.dart';
import 'package:webview_windows/webview_windows.dart';

class WebViewPage extends StatefulWidget {
  String? url;
  String? title;

  WebViewPage({Key? key, this.url, this.title}) : super(key: key);

  @override
  WebViewPageState createState() => WebViewPageState();
}

class WebViewPageState extends State<WebViewPage> {
  late WebviewController _controller;

  @override
  void initState() {
    super.initState();

    initPlatformState();
  }

  Future<void> initPlatformState() async {
    _controller = WebviewController();

    await _controller.initialize();
    // _controller.url.listen((url) {
    //   textController.text = url;
    // });
    await _controller.loadUrl(widget.url ?? '');

    if (!mounted) return;

    setState(() {});
  }

  // String js =
  //     "document.querySelector('meta[name=\"viewport\"]').setAttribute('content', 'width=1024px, initial-scale=' + (document.documentElement.clientWidth / 1024));";

  @override
  Widget build(BuildContext context) {
    String url = '${widget.url}';
    // if (Global.userInfo != null && !url.contains('emic.vn')) {
    //   url +=
    //       '?key=${Global.userInfo.AccountSerial}&id=${Global.userInfo.AccessToken}';
    // }
    // print(url);
    return Scaffold(
      appBar: widget.title != null
          ? AppBar(
              title: Text(widget.title ?? ""),
            )
          : null,
      body: Column(
        children: [
          // TextField(
          //   controller: TextEditingController(text: widget.url),
          // ),
          Expanded(
            flex: 1,
            child: SizedBox(
              width: MediaQuery.of(context).size.width * 2,
              height: MediaQuery.of(context).size.height * 2,
              child: Webview(_controller),
            ),
          ),
          // Expanded(
          //     child: WebviewScaffold(
          //   url: url,
          //   withJavascript: true,
          //   withLocalStorage: true,
          //   withZoom: true,
          //   // displayZoomControls: true,
          //   // withOverviewMode: true,
          //   // useWideViewPort: true,
          // ))
        ],
      ),
    );
  }
}
