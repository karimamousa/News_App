import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:newnews_app/app_colors.dart';
import '../../model/NewsResponse.dart';

class NewsItem extends StatelessWidget {
  News news;
  NewsItem({required this.news});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            width: double.infinity,
            height: MediaQuery.of(context).size.height*0.3,
            clipBehavior: Clip.antiAlias,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
            ),
            child: CachedNetworkImage(
                imageUrl: news.urlToImage,
              placeholder:(context,url)=> CircularProgressIndicator(
                color: AppColors.primaryColor,
              ),
              errorWidget:(context,url,error)=>Icon(Icons.error) ,
            ),
          ),
          Text(news.author??"",style: Theme.of(context).textTheme.titleSmall?.copyWith(color: AppColors.greyColor),),
          SizedBox(height: 10,),
          Text(news.title??"",style: Theme.of(context).textTheme.titleMedium?.copyWith(color: AppColors.blackColor)),
          Text(news.publishedAt??"",style: Theme.of(context).textTheme.titleSmall?.copyWith(color: AppColors.greyColor),
          textAlign: TextAlign.end,)
        ],
      ),
    );
  }
}
