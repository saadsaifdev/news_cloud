import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import '../models/Article_Model.dart';

const Set<String> _newsApiCategories = {
  'business',
  'entertainment',
  'general',
  'health',
  'science',
  'sports',
  'technology',
};

String normalizeNewsApiCategory(String raw) {
  final slug = raw.trim().replaceAll(RegExp(r'\\s+'), '').toLowerCase();
  if (_newsApiCategories.contains(slug)) return slug;
  return 'general';
}

class NewsServices {
  final Dio dio;

  NewsServices(this.dio);

  Future<List<ArticleModel>> getNews({required String category}) async {
    final categoryParam = normalizeNewsApiCategory(category);
    try {
      final response = await dio.get(
        "https://newsapi.org/v2/top-headlines",
        queryParameters: {
          "country": "us",
          "apiKey": dotenv.env['NEWS_API_KEY'],
          "category": categoryParam,
        },
      );

      print('Response Status: ${response.statusCode}');
      print('Data: ${response.data}');

      Map<String, dynamic> jsonData = response.data;
      List<dynamic> articles = jsonData["articles"];

      List<ArticleModel> articlesList = [];

      for (var article in articles) {
        final ArticleModel articleModel = ArticleModel.fromJson(article);
        articlesList.add(articleModel);
      }
      return articlesList;
    } catch (e) {
      print('An error occurred while fetching the news: ${e.toString()}');
      return [];
    }
  }
}
