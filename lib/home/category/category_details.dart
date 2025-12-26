import 'package:flutter/material.dart';

import '../../api/api_manager.dart';
import '../../app_colors.dart';
import '../../model/SourceResponse.dart';

import '../tabs/tabs_widget.dart';

class CategoryDetails extends StatefulWidget {
  const CategoryDetails({super.key});

  @override
  State<CategoryDetails> createState() => _CategoryDetailsState();
}

class _CategoryDetailsState extends State<CategoryDetails> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<SourceResponse?>(
        future: ApiManager.getSources(),
        builder: (context,snapshot){
          if (snapshot.connectionState == ConnectionState.waiting){
            return Center(
                child: CircularProgressIndicator(
                  color: AppColors.primaryColor,
                )
            );
          }else if(snapshot.hasError){ //in catch(e),client
            return Column(
              children: [
                Text('Something went wrong'),
                ElevatedButton(onPressed: (){
                  ApiManager.getSources();
                  setState(() {

                  });
                }, child: Text('try again'))
              ],
            );
          }
          if(snapshot.data!.status != 'ok'){
            return Column(
              children: [
                Text(snapshot.data!.message!), //server sided error messege
                ElevatedButton(onPressed: (){
                  ApiManager.getSources();
                  setState(() {

                  });
                }, child: Text('try again'))
              ],
            );

          } //else
          var sourcesList = snapshot.data!.sources!;
          return TabsWidget(sourcesList: sourcesList);
        }
    );
  }
}
