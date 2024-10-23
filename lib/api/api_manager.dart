import 'dart:convert';

import 'package:http/http.dart' as http;
import 'api_constants.dart';
import 'package:news_app/model/SourceResponse.dart';
//https://newsapi.org/v2/top-headlines/sources?apiKey=c51c8e3088cd4475b936353f8fff0bbf
class ApiManager{
  static void getSources()async{
    Uri url = Uri.https(ApiConstants.baseUrl,ApiConstants.sourceApi,
    {
      'apiKey':'c51c8e3088cd4475b936353f8fff0bbf',
    });
    var response = await http.get(url);
    var responseBody = response.body; //string
    var json=jsonDecode(responseBody);//json
    SourceResponse.fromJson(json); //objs
  }

}