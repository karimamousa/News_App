import 'package:flutter/material.dart';
import 'package:newnews_app/app_colors.dart';
import 'package:newnews_app/home/category/category_item.dart';
import 'package:newnews_app/model/category.dart';
import 'category_item.dart';
import 'category_details.dart';


class CategoryFragment extends StatelessWidget {
  var categoriesList = Category.getCategories();


  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text('Pick your category \n of choice',
          style: Theme.of(context).textTheme.titleMedium),
          SizedBox(height: 20,),
          Expanded(
            child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing:10,
                  crossAxisSpacing: 10
                ),
                itemBuilder: (context,index){
                  return CategoryItem(category: categoriesList[index] , index: index);
                },
              itemCount: categoriesList.length,
            ),
          )
        ],
      ),
    );
  }
}
