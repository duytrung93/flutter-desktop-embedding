import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'web_view_page.dart';

class TestWeb extends StatefulWidget {
  TestWeb({Key? key}) : super(key: key);

  @override
  _TestWebState createState() => _TestWebState();
}

class _TestWebState extends State<TestWeb> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: WebViewPage(
        title: "test",
        url: "http://14.162.40.198:8097",
      ),
    );
  }
}
