import 'package:flutter/material.dart';
import 'package:flutter_application_news_app/models/Article_Model.dart';
import 'package:webview_flutter/webview_flutter.dart';

class ArticleView extends StatefulWidget {
  const ArticleView({super.key, required this.article});

  final ArticleModel article;

  @override
  State<ArticleView> createState() => _ArticleViewState();
}

class _ArticleViewState extends State<ArticleView> {
  late final WebViewController _controller;
  var _loading = true;

  @override
  void initState() {
    super.initState();
    final url = widget.article.url;
    _controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setNavigationDelegate(
        NavigationDelegate(
          onPageFinished: (_) {
            if (mounted) setState(() => _loading = false);
          },
        ),
      );

    if (url != null && url.isNotEmpty) {
      _controller.loadRequest(Uri.parse(url));
    } else {
      _loading = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    final url = widget.article.url;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.article.title,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
      ),
      body: url == null || url.isEmpty
          ? Center(
              child: Padding(
                padding: const EdgeInsets.all(24),
                child: Text(
                  widget.article.subTitle ??
                      'This article has no link. Open the source from the publisher’s app or site.',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.grey[700]),
                ),
              ),
            )
          : Stack(
              children: [
                WebViewWidget(controller: _controller),
                if (_loading)
                  const Positioned(
                    top: 0,
                    left: 0,
                    right: 0,
                    child: LinearProgressIndicator(minHeight: 2),
                  ),
              ],
            ),
    );
  }
}
