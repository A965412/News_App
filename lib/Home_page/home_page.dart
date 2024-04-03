import 'package:flutter/material.dart';
import 'package:news_application/APi/Api_Manager.dart';

import 'package:news_application/Home_page/ArticleSearchDelegate.dart';
import 'package:news_application/Category/Categeory_Details.dart';
import 'package:news_application/Category/Category_Fragment.dart';
import 'package:news_application/News/AllArticle.dart';
import 'package:news_application/News/Container.dart';
import 'package:news_application/Drawer/DrawerWidget.dart';
import 'package:news_application/Models/Category.dart';
import 'package:news_application/Models/EveryResponse.dart';
import 'package:news_application/Theme.dart';

import '../Settings/settingTab.dart';

class Home_page extends StatefulWidget {
  static const String Route_name = "Home_page";

  const Home_page({super.key});

  @override
  State<Home_page> createState() => _Home_pageState();
}

class _Home_pageState extends State<Home_page> {
  final TextEditingController _searchController = TextEditingController();
  String _searchQuery = '';
  List<EveryResponse> _searchResults = [];

  /*
  21c0a356eb8c4a95b1c80d22a50bec59
   */

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Container(
        color: Mytheme.whiteycolor,
        child: Image(
          image: AssetImage(
            "assets/images/bg.png",
          ),
          width: double.infinity,
          height: double.infinity,
          fit: BoxFit.cover,
        ),
      ),
      Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            title: Text(
              selectedmenuitem == Drawer_Widget.settings
                  ? "Settings"
                  : selectedcategory == null
                      ? "News App"
                      : selectedcategory!.title,
              style: Theme.of(context).textTheme.titleLarge,
            ),
            actions: [
              //  IconButton(
              //    icon: Icon(Icons.search),
              //   onPressed: () {
              //   Navigator.push(
              //    context,
              //    MaterialPageRoute(builder: (context) => Search_Screen()),
              //  );
//})
              IconButton(
                onPressed: () {
                  setState(() {
                    showSearch(
                      context: context,
                      delegate: NewsSearch(),
                    );
                  });
                },
                icon: const Icon(Icons.search),
              ),
            ],
          ),
          drawer: Drawer(
            width: 260,
            child: Drawer_Widget(
              onclickdrawer: onclickdrawer,
            ),
          ),
          body: selectedmenuitem == Drawer_Widget.settings
              ? Settings()
              : selectedcategory == null
                  ? CategoryFragment(
                      oncategoryclick: onclick,
                    )
                  : Category_Details(
                      caty: selectedcategory!,
                    )),
    ]);
  }

  Categorymodel? selectedcategory;

  void onclick(Categorymodel newselectedcategory) {
    selectedcategory = newselectedcategory;
    setState(() {});
  }

  int selectedmenuitem = Drawer_Widget.category;

  void onclickdrawer(int newselectedmenuitem) {
    selectedmenuitem = newselectedmenuitem;
    selectedcategory = null;
    Navigator.pop(context);

    setState(() {});
  }
}
