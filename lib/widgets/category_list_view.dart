import 'package:flutter/material.dart';
import 'package:flutter_application_news_app/models/category_model.dart';
import 'package:flutter_application_news_app/widgets/category_card.dart';
class CategoriesListView extends StatelessWidget {
  const CategoriesListView({super.key});
  final List<CategoryModel> categories = const [
    CategoryModel(image: 'assets/business.avif', categoryName: 'Business'),
    CategoryModel(image: 'assets/science.avif', categoryName: 'Science'),
    CategoryModel(image: 'assets/technology.jpeg', categoryName: 'Technology'),
    CategoryModel(image: 'assets/sports.avif', categoryName: 'Sports'),
    CategoryModel(
      image: 'assets/entertaiment.avif',
      categoryName: 'Entertainment',
    ),
    CategoryModel(image: 'assets/general.avif', categoryName: 'General'),
    CategoryModel(image: 'assets/health.avif', categoryName: 'Health'),
  ];
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 120,
      child: ListView.builder(
        padding: EdgeInsets.only(left: 7),
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        itemBuilder: (context, index) {
          return CategoryCard(category: categories[index]);
        },
      ),
    );
  }
}
