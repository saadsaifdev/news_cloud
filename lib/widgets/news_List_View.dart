import 'package:flutter/material.dart';
import 'package:flutter_application_news_app/models/Article_Model.dart';
import 'package:flutter_application_news_app/widgets/News_tile.dart';

class NewsListView extends StatelessWidget {
  final List<ArticleModel> articles;

  const NewsListView({super.key, required this.articles});

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(childCount: articles.length, (
        context,
        index,
      ) {
        return Padding(
          padding: const EdgeInsets.all(8),
          child: NewsTile(articleModel: articles[index]),
        );
      }),
    );
  }
}
