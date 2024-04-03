import 'package:flutter/material.dart';
import 'package:news_application/News/News.dart';
import 'package:news_application/Models/SourceResponse.dart';
import 'TabItem.dart';

class Tab_Widget extends StatefulWidget {
  Tab_Widget({super.key, required this.sourcelist});

  List<Source> sourcelist = [];

  @override
  State<Tab_Widget> createState() => _Tab_WidgetState();
}

class _Tab_WidgetState extends State<Tab_Widget> {
  int selectedindex = 0;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: widget.sourcelist.length,
      child: Column(
        children: [
          TabBar(
              isScrollable: true,
              indicatorColor: Colors.transparent,
              onTap: (int) {
                selectedindex = int;
                setState(() {});
              },
              tabs: widget.sourcelist
                  .map((source) => Tab_Item(
                      isSelected:
                          selectedindex == widget.sourcelist.indexOf(source),
                      source: source))
                  .toList()),
          Expanded(child: NewsWidget(source: widget.sourcelist[selectedindex]))
        ],
      ),
    );
  }
}
