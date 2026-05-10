import 'package:flutter/material.dart';
import 'package:flutter_application_news_app/views/SearchView.dart';
import 'package:flutter_application_news_app/widgets/news_List_View_builder.dart';
import '../widgets/category_list_view.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: const Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text("News", style: TextStyle(color: Colors.black)),
            Text("Cloud", style: TextStyle(color: Colors.orangeAccent)),
          ],
        ),
         
        actions: [
          IconButton(
            icon: const Icon(Icons.search, color: Colors.black),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const SearchView()),
              );
            },
          ),
        ],
      ),
      body: const CustomScrollView(
        physics: BouncingScrollPhysics(),
        slivers: [
          SliverToBoxAdapter(child: CategoriesListView()),

          SliverToBoxAdapter(child: SizedBox(height: 10)),

          NewsListViewBuilder(category: 'general'),
        ],
      ),
    );
  }
}
