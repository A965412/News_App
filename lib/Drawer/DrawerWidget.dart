import 'package:flutter/material.dart';
import 'package:news_application/Theme.dart';

class Drawer_Widget extends StatelessWidget {
  Drawer_Widget({super.key, required this.onclickdrawer});

  Function onclickdrawer;
  static const int category = 1;

  static const int settings = 2;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: double.infinity,
          height: 150,
          color: Mytheme.primarycolor,
          child: Center(
            child: Text(
              "News App!",
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ),
        ),
        SizedBox(
          height: 15,
        ),
        Padding(
          padding: const EdgeInsets.all(7.0),
          child: InkWell(
            onTap: () {
              onclickdrawer(category);
            },
            child: Row(
              children: [
                Icon(
                  Icons.list,
                  size: 30,
                  color: Mytheme.blackcolor,
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  "Categeory",
                  style: TextStyle(
                      fontSize: 22,
                      color: Mytheme.blackcolor,
                      fontWeight: FontWeight.bold),
                )
              ],
            ),
          ),
        ),
        SizedBox(
          height: 15,
        ),
        Padding(
          padding: const EdgeInsets.all(7.0),
          child: InkWell(
            onTap: () {
              onclickdrawer();
            },
            child: Row(
              children: [
                Icon(
                  Icons.settings,
                  size: 30,
                  color: Mytheme.blackcolor,
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  "Settings",
                  style: TextStyle(
                      fontSize: 22,
                      color: Mytheme.blackcolor,
                      fontWeight: FontWeight.bold),
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}
