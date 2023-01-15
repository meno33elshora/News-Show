import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewNet extends StatelessWidget {
  final String  url;
  const WebViewNet( {Key? key ,required this.url, }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(),
        body: Padding(
          padding: const EdgeInsets.only(top: 20.0),
          child: WebView(
            initialUrl: url,
            zoomEnabled: true,
            debuggingEnabled: true,
            gestureNavigationEnabled: true,
            allowsInlineMediaPlayback: true,
            javascriptMode: JavascriptMode.unrestricted,
            initialMediaPlaybackPolicy: AutoMediaPlaybackPolicy.always_allow,
          ),
        ),
    );
  }
}
