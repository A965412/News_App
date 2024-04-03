import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_application/News/AllArticle.dart';
import 'package:news_application/News/Container.dart';

import 'package:news_application/Models/SourceResponse.dart';
import 'package:news_application/News/cubit/news_cubit_cubit.dart';
import 'package:news_application/Theme.dart';

class NewsWidget extends StatefulWidget {
  NewsWidget({super.key, required this.source});

  Source source;

  @override
  State<NewsWidget> createState() => _NewsWidgetState();
}

class _NewsWidgetState extends State<NewsWidget> {
  NewsCubitCubit newmodel = NewsCubitCubit();

  @override
  void initState() {
    // TODO: implement initState

    newmodel.NegetNews(widget.source.id ?? "");
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
        bloc: newmodel,
        builder: (context, state) {
          if (state is NewsLoadingState) {
            return Center(
              child: CircularProgressIndicator(
                color: Mytheme.primarycolor,
              ),
            );
          } else if (state is NewsErrorState) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: AlertDialog(
                    content: Text(
                      state.errormassage!,
                      style: TextStyle(color: Mytheme.primarycolor),
                    ),
                    actions: [
                      TextButton(
                          onPressed: () {
                            newmodel.NegetNews(widget.source.id ?? "");
                          },
                          child: Text(
                            "Try Again",
                            style: TextStyle(color: Mytheme.primarycolor),
                          ))
                    ],
                  ),
                ),
              ],
            );
          } else if (state is NewsSuccessState) {
            return ListView.builder(
              itemBuilder: (context, index) {
                return InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              News_Details(article: state.articleList[index]),
                        ),
                      );
                    },
                    child: Custom_container(
                      article: state.articleList[index],
                    ));
              },
              itemCount: state.articleList.length,
            );
          } else
            return Container();
        });
  }
}
