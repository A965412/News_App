import 'package:flutter/material.dart';
import 'package:news_application/Category/C_item.dart';
import 'package:news_application/Models/Category.dart';
import 'package:news_application/Theme.dart';

class CategoryFragment extends StatelessWidget {
  CategoryFragment({super.key, required this.oncategoryclick});

  var categorieslist = Categorymodel.getcategories();
  Function oncategoryclick;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(25),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text("Pick your category \n of interest",
              style: Theme.of(context)
                  .textTheme
                  .titleLarge!
                  .copyWith(color: Mytheme.blackcolor, fontSize: 22)),
          SizedBox(
            height: 15,
          ),
          Expanded(
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, mainAxisSpacing: 15, crossAxisSpacing: 15),
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    oncategoryclick(categorieslist[index]);
                  },
                  child:
                      categoryItem(caty: categorieslist[index], index: index),
                );
              },
              itemCount: categorieslist.length,
            ),
          )
        ],
      ),
    );
  }
}
