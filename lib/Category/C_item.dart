import 'package:flutter/material.dart';
import 'package:news_application/Models/Category.dart';

class categoryItem extends StatelessWidget {
  categoryItem({super.key, required this.caty, required this.index});

  Categorymodel caty;
  int index;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: caty.color,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(25),
              topRight: Radius.circular(25),
              bottomLeft: Radius.circular(index % 2 == 0 ? 25 : 0),
              bottomRight: Radius.circular(index % 2 == 0 ? 0 : 25))),
      child: Column(
        children: [
          Image.asset(
            caty.imagepath,
            height: 110,
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            caty.title,
            style:
                Theme.of(context).textTheme.titleSmall!.copyWith(fontSize: 15),
          )
        ],
      ),
    );
  }
}
