

import 'dart:convert'as convert;

import 'package:http/http.dart'as http;

import 'model/news_model.dart';

Future <List<news>> createApiList(String url,String category)async{
//var url =  Uri.parse("https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=90cb3f5228b24f1aabaded9050e8f0d6");
  //print("haber listeleri oluşturuldu");
  var response=await http.get(Uri.parse(url));
  List<news> allNews=[];
  if(response.statusCode==200){
    Map<String,dynamic> json=convert.jsonDecode(response.body);
    List<dynamic> apiNews=json['articles'];
    for(var item in apiNews){
    if(item['url'].toString().contains(category)){
      //item['url'].toString().contains(other)
    //item['author']!=null &&item['title']!=null&&item['urlToImage']!=null&&item['publishedAt']!=null&&item['content']!=null
    allNews.add(news.fromJson(item));
    }
    }
    //allNews= apiNews.map((item) =>news.fromJson(item)).toList();
    //print(apiNews[0]['content']);
    }
    return allNews ;
    //newslist=(response.data['articles'] as List).map((e) => news.fromJson(e)).toList();
    
  
  


}
