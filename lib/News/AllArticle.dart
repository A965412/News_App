import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_application/News/webview.dart';
import 'package:news_application/Models/EveryResponse.dart';
import 'package:url_launcher/url_launcher.dart';

class News_Details extends StatelessWidget {
  News_Details({super.key, required this.article});

  Article article;

  //final String _url = Uri.parse(article.url);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "NewsApp",
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(25),
              child: Image.network(article.urlToImage ?? ""),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              article.author ?? "",
              maxLines: 1,
              style: Theme.of(context)
                  .textTheme
                  .titleSmall
                  ?.copyWith(color: Colors.grey),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(article.title ?? "",
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.w500)),
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
            ),
            const SizedBox(
              height: 22,
            ),
            Text(article.description ?? "",
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.w400)),
            const SizedBox(
              height: 20,
            ),
            InkWell(
              onTap: () async {
                final url = article.url;

                if (url != null && await canLaunch(url)) {
                  await launch(url);
                } else {}
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    "View Full Article",
                    style: Theme.of(context).textTheme.titleSmall?.copyWith(
                          color: Colors.black,
                        ),
                    textAlign: TextAlign.end,
                  ),
                  const SizedBox(
                    width: 4,
                  ),
                  const Icon(
                    Icons.arrow_right,
                    size: 30,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
