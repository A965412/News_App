import 'package:flutter/material.dart';
import 'package:news_application/Theme.dart';

class Categorymodel {
  String id;

  Color color;

  String title;

  String imagepath;

  Categorymodel(
      {required this.title,
      required this.id,
      required this.color,
      required this.imagepath});

  /*






  technology
   */

  static List<Categorymodel> getcategories() {
    return [
      Categorymodel(
          title: "General",
          id: "general",
          color: Mytheme.priblucolor,
          imagepath: "assets/bgcategory/Politics.png"),
      Categorymodel(
          title: "Science",
          id: "science",
          color: Mytheme.yellowcolor,
          imagepath: "assets/bgcategory/science.png"),
      Categorymodel(
          title: "Business",
          id: "business",
          color: Mytheme.browncolor,
          imagepath: "assets/bgcategory/bussines.png"),
      Categorymodel(
          title: "Sports",
          id: "sports",
          color: Mytheme.redcolor,
          imagepath: "assets/bgcategory/sports.png"),
      Categorymodel(
          title: "Entertainment",
          id: "entertainment",
          color: Mytheme.bluecolor,
          imagepath: "assets/bgcategory/environment.png"),
      Categorymodel(
          title: "Health",
          id: "health",
          color: Mytheme.Binkcolor,
          imagepath: "assets/bgcategory/health.png"),
    ];
  }
}
