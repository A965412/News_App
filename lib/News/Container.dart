import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news_application/News/AllArticle.dart';
import 'package:news_application/Models/EveryResponse.dart';

class Custom_container extends StatelessWidget {
  Custom_container({super.key, required this.article});

  Article article;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(25),
            child: CachedNetworkImage(
              imageUrl: article.urlToImage ?? '',
              width: double.infinity,
              fit: BoxFit.fill,
              height: MediaQuery.of(context).size.height * 0.3,
              placeholder: (context, url) =>
                  const Center(child: CircularProgressIndicator()),
              errorWidget: (context, url, error) => const Icon(Icons.error),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            article.author ?? "",
            style: Theme.of(context)
                .textTheme
                .titleSmall
                ?.copyWith(color: Colors.grey),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(article.title ?? "",
              style: Theme.of(context)
                  .textTheme
                  .titleMedium
                  ?.copyWith(color: Colors.black, fontSize: 18)),
          const SizedBox(
            height: 10,
          ),
          Text(
            article.publishedAt ?? "",
            style: Theme.of(context)
                .textTheme
                .titleSmall
                ?.copyWith(color: Colors.grey),
            textAlign: TextAlign.end,
          )
        ],
      ),
    );
  }
}
