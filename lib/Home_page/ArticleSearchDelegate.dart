import 'package:flutter/material.dart';
import 'package:news_application/APi/Api_Manager.dart';
import 'package:news_application/Models/EveryResponse.dart';
import 'package:news_application/News/Container.dart';
import 'package:news_application/Theme.dart';

class NewsSearch extends SearchDelegate {
  @override
  ThemeData appBarTheme(BuildContext context) {
    return ThemeData(
      appBarTheme: AppBarTheme(
        color: Mytheme.primarycolor,
      ),
      inputDecorationTheme: const InputDecorationTheme(
        border: InputBorder.none,
      ),
    );
  }

  late Future<EveryResponse> getNewsDataModel;

  NewsSearch() {
    getNewsDataModel = Apimanager.getNewsByIdforsearch(query: "");
  }

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          showResults(context);
        },
        icon: const Icon(Icons.search),
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        Navigator.pop(context);
      },
      icon: const Icon(
        Icons.clear,
        size: 32,
      ),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return FutureBuilder(
      future: Apimanager.getNewsByIdforsearch(query: query),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }
        if (snapshot.hasError) {
          return const Center(child: Text("Something went wrong"));
        }
        var articles = snapshot.data?.articles ?? [];
        return Expanded(
          child: ListView.builder(
            itemBuilder: (context, index) {
              var newsItem = articles[index];
              return Custom_container(
                article: newsItem,
              );
            },
            itemCount: articles.length,
          ),
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return const Center(
      child: Text(
        'Search',
        style: TextStyle(color: Colors.black),
      ),
    );
  }
}
