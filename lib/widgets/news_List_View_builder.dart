import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import '../models/Article_Model.dart';
import '../services/News_services.dart';
import 'news_list_view.dart';

class NewsListViewBuilder extends StatefulWidget {
  final String category;

  const NewsListViewBuilder({
    super.key,
    required this.category,
  });

  @override
  State<NewsListViewBuilder> createState() => _NewsListViewBuilderState();
}

class _NewsListViewBuilderState extends State<NewsListViewBuilder> {

  late Future<List<ArticleModel>> future;

  @override
  void initState() {
    super.initState();
      
    future = NewsServices(Dio()).getNews(category: widget.category);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<ArticleModel>>(
      future: future,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return NewsListView(
            articles: snapshot.data!,
          );
        }  
        else if (snapshot.hasError) {
          return const SliverFillRemaining(
            hasScrollBody: false,
            child: Center(
              child: Text("oops there was an error, please try later"),
            ),
          );
        }
         else {
          return const SliverFillRemaining(
            hasScrollBody: false,
            child: Center(
              child: CircularProgressIndicator(
                color: Colors.blue,
              ),
            ),
          ); 
        }
      },
    );
  }
}