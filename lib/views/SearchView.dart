import 'package:flutter/material.dart';
import 'package:flutter_application_news_app/widgets/news_List_View_builder.dart';

class SearchView extends StatefulWidget {
  const SearchView({super.key});
  @override
  State<SearchView> createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  String? searchQuery; 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Search News"),
        centerTitle: true,
      ),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                onSubmitted: (value) {
                  setState(() {
                    searchQuery = value; 
                  });
                },
                decoration: InputDecoration(
                  hintText: "Search for topics (business,science,technology,sports,health,entertaiment)...",
                  suffixIcon: const Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
            ),
          ),
          if (searchQuery != null)
            NewsListViewBuilder(category: searchQuery!)
          else
            const SliverFillRemaining(
              hasScrollBody: false,
              child: Center(child: Text("Type something to search for news")),
            ),
        ],
      ),
    );
  }
}