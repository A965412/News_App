import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_application/APi/Api_Manager.dart';
import 'package:news_application/Category/cubit/categorycubit_cubit.dart';
import 'package:news_application/Models/Category.dart';
import 'package:news_application/Models/SourceResponse.dart';
import 'package:news_application/Tab/Tab_Widget.dart';
import 'package:news_application/Theme.dart';

class Category_Details extends StatefulWidget {
  static const String Route_name = "Home_page";

  Category_Details({super.key, required this.caty});

  Categorymodel caty;

  @override
  State<Category_Details> createState() => _Category_DetailsState();
}

class _Category_DetailsState extends State<Category_Details> {
  /*
  21c0a356efb8c4a95b1c80d22a50bec59
   */

  CategorycubitCubit viewmodel = CategorycubitCubit();

  @override
  void initState() {
    viewmodel.getSources(widget.caty.id);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategorycubitCubit, SourceStates>(
        bloc: viewmodel,
        builder: (context, state) {
          if (state is SourceLoadingState) {
            return Center(
              child: CircularProgressIndicator(
                color: Mytheme.primarycolor,
              ),
            );
          } else if (state is SourceErrorState) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: AlertDialog(
                    content: Text(
                      state.errorMessage!,
                      style: TextStyle(color: Mytheme.primarycolor),
                    ),
                    actions: [
                      TextButton(
                          onPressed: () {
                            viewmodel.getSources(widget.caty.id);
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
          } else if (state is SourceSuccessState) {
            return Tab_Widget(sourcelist: state.sourcesList);
          }
          return Container();
        });

/* '   FutureBuilder<SourceResponse?>(
        future: Apimanager.getresources(widget.caty.id),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(
                color: Mytheme.primarycolor,
              ),
            );
          } else if (snapshot.hasError) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: AlertDialog(
                    content: Text(
                      "SomethingWentWrong",
                      style: TextStyle(color: Mytheme.primarycolor),
                    ),
                    actions: [
                      TextButton(
                          onPressed: () {
                            Apimanager.getresources(widget.caty.id);
                            setState(() {});
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
          } else if (snapshot.data?.status != "ok") {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: AlertDialog(
                    content: Text(
                      snapshot.data!.message!,
                      style: TextStyle(color: Mytheme.primarycolor),
                    ),
                    actions: [
                      TextButton(
                          onPressed: () {
                            Apimanager.getresources(widget.caty.id);
                            setState(() {});
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
          }
          var sourceList = snapshot.data?.sources ?? [];
          return Tab_Widget(sourcelist: sourceList);
        });'*/
  }
}
