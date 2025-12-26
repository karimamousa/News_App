import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:newnews_app/model/NewsResponse.dart';
import 'api_constants.dart';
import 'package:newnews_app/model/SourceResponse.dart';
//https://newsapi.org/v2/top-headlines/sources?apiKey=c51c8e3088cd4475b936353f8fff0bbf
class ApiManager{
  static Future<SourceResponse?> getSources()async{
    Uri url = Uri.https(ApiConstants.baseUrl,ApiConstants.sourcesApi,
    {
      //parameter   value
      'apiKey':ApiConstants.apiKey,
    });
    var response = await http.get(url);
    try{ //3shan law 7sl error men na7ytna (client)(ma3andish net msln )
      return SourceResponse.fromJson(jsonDecode(response.body));
    }catch (e){
      throw e;
    }

  }
  //https://newsapi.org/v2/everything?q=apple&from=2024-11-02&to=2024-11-02&sortBy=popularity&apiKey=c51c8e3088cd4475b936353f8fff0bbf
  static Future<NewsResponse?> getNewsBySourceId(String sourceId) async{
    Uri url = Uri.https(ApiConstants.baseUrl,ApiConstants.newsApi,{
      'apiKey':ApiConstants.apiKey,
      'sources':sourceId
    });
    var response = await http.get(url);
    try{
      return NewsResponse.fromJson(jsonDecode(response.body));
    }catch(e){ //client error
      throw e;
    }


  }

}