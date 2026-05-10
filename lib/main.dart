import 'package:flutter/material.dart';
import 'package:flutter_application_news_app/views/home_view.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

void main() async {

  WidgetsFlutterBinding.ensureInitialized();

  await dotenv.load(fileName: ".env");
  
  runApp(const NewsApp());
}

class NewsApp extends StatelessWidget {
  const NewsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false, 
      home: HomeView(),
    );
  }
}