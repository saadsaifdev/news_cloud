import 'package:flutter/material.dart';
import 'package:flutter_application_news_app/widgets/news_list_view_builder.dart';

class CategoryView extends StatelessWidget {
  const CategoryView({super.key, required this.category});
  final String category;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text( category)),
      body: CustomScrollView(
        slivers: [
          NewsListViewBuilder(category: category),
        ],  
      ),
    );
  }
}