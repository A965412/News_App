import 'package:flutter/material.dart';
import 'package:news_application/Models/SourceResponse.dart';
import 'package:news_application/Theme.dart';

class Tab_Item extends StatelessWidget {
  Tab_Item({super.key, required this.isSelected, required this.source});

  bool isSelected;

  Source source;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 5, horizontal: 14),
      margin: EdgeInsets.only(top: 15),
      decoration: BoxDecoration(
          border: Border.all(color: Mytheme.primarycolor, width: 2),
          borderRadius: BorderRadius.circular(15),
          color: isSelected ? Mytheme.primarycolor : Colors.transparent),
      child: Text(
        source.name ?? "",
        style: Theme.of(context).textTheme.titleLarge?.copyWith(
              color: isSelected ? Mytheme.whiteycolor : Mytheme.primarycolor,
              fontSize: 18,
            ),
      ),
    );
  }
}
