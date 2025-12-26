import 'package:flutter/material.dart';
import 'package:newnews_app/api/api_manager.dart';
import 'package:newnews_app/home/news/news_item.dart';
import 'package:newnews_app/model/NewsResponse.dart';

import '../../app_colors.dart';
import '../../model/SourceResponse.dart';

class NewsWidget extends StatefulWidget {
  Sources source;
  NewsWidget({required this.source});

  @override
  State<NewsWidget> createState() => _NewsWidgetState();
}

class _NewsWidgetState extends State<NewsWidget> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<NewsResponse?>(
        future: ApiManager.getNewsBySourceId(widget.source.id??""),
        builder:  (context,snapshot){
          if (snapshot.connectionState == ConnectionState.waiting){ //lesa bey7amel
            return Center(
                child: CircularProgressIndicator(
                  color: AppColors.primaryColor,
                )
            );
          }else if(snapshot.hasError){ //in catch,client
            return Column(
              children: [
                Text('Something went wrong'),
                ElevatedButton(onPressed: (){
                  ApiManager.getNewsBySourceId(widget.source.id??'');
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
                  ApiManager.getNewsBySourceId(widget.source.id??'');
                  setState(() {

                  });
                }, child: Text('try again'))
              ],
            );

          } //else
          var newsList = snapshot.data!.articles!;
          return ListView.builder(itemBuilder: (context,index){
            return NewsItem(news: newsList[index] );

          },
          itemCount: newsList.length,);
        }
    );
  }
}
