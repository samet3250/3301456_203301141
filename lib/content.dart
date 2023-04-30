import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:html/dom.dart';
import 'package:http/http.dart' as http;
import 'package:html/parser.dart'as parser;

import 'model/news_model.dart';

//var response = document.getElementsByClassName("ArticleBody-articleBody")[0].getElementsByClassName("group").forEach((element) {element.getElementsByTagName("p").forEach((element) {metin+=(element.text.toString()+"\n"); });});
Future<List<news>> getcontent(String urll)async{
  String metin="",aa="humm";
  List<news> aaaa=[];
  //var client= http.Client();
  for (int i=0;i<7;i++){
    var res=await http.get(Uri.parse(urll));
  final body=res.body;
  final document =parser.parse(body);
  
  /* 
  tarih---  el.children[1].getElementsByClassName("Card-cardFooter")[0].text
  acıklama--- el.children[1].getElementsByClassName("Card-titleContainer")[0].text
  category--- el.children[1].getElementsByClassName("Card-eyebrowContainer")[0].text
  resim --- (el.getElementsByClassName("Card-squareMediaContainer Card-placeholder")[0].children[0].innerHtml.split("\"")[1]!="PlayButton-base"?el.getElementsByClassName("Card-squareMediaContainer Card-placeholder")[0].children[0].innerHtml.split("\"")[1]:"https://im.haberturk.com/2023/04/26/3586345_18459bcabc71697438868098c51bdef4_1366x1366.jpg"
   */
  var response = document.getElementsByClassName("PageBuilder-pageWrapper")[0].getElementsByClassName("PageBuilder-containerFluidWidths PageBuilder-pageRow")[3].getElementsByClassName("PageBuilder-col-9 PageBuilder-col")[0].getElementsByClassName("ThreeUpStack-container").forEach((element) {element.getElementsByClassName("Card-standardBreakerCard Card-threeUpStackRectangleSquareMedia Card-rectangleToLeftSquareMedia Card-card").forEach((el) {
    aaaa.add(news(
      imageUrl: el.getElementsByClassName("Card-squareMediaContainer Card-placeholder")[0].children[0].innerHtml.split("\"")[1]!="PlayButton-base"?el.getElementsByClassName("Card-squareMediaContainer Card-placeholder")[0].children[0].innerHtml.split("\"")[1]:"https://im.haberturk.com/2023/04/26/3586345_18459bcabc71697438868098c51bdef4_1366x1366.jpg",
      category: el.children[1].getElementsByClassName("Card-eyebrowContainer")[0].text,
      title: el.children[1].getElementsByClassName("Card-titleContainer")[0].text,
      time:el.children[1].getElementsByClassName("Card-cardFooter")[0].text 
    ));
  });});
  }
/*   var response=document.getElementsByClassName("PageBuilder-pageWrapper")[0];
    
  //var response2=document.getElementsByClassName("PageBuilder-pageWrapper")[0].getElementsByClassName("PageBuilder-containerFluidWidths PageBuilder-pageRow")[3].getElementsByClassName("PageBuilder-col-9 PageBuilder-col")[0];
   List url_list=response.innerHtml.split("\"");
   List founded_url=[];
   int a=10;
   print("------------------------------------------------------------------------");
   for(String  url in url_list){

  url.startsWith("https://www")&&url.endsWith("html")&&!url.contains("video")&&!founded_url.contains(url)? founded_url.add(url):a=11;
   }
   print("------------------------------------------------------------------------");
   int counter=0;
    List<news> all=[];
    for(var i=0;i<founded_url.length;i++){
  var res=await http.get(Uri.parse(founded_url[i]));
  final body=res.body;
  final document =parser.parse(body);
  var response= document.getElementById("BrandPageWrapper");
  if(response!.className.toString()=="cnbcBrand"){
   all.add(news(category:response.className.toString(),imageUrl: response.className.toString(),subtitle: response.className.toString(),text: response.className.toString(),time: response.className.toString(),title: response.className.toString(),url:founded_url[i],writer: response.className.toString()  ));
  }
    }
    print(counter); */
    return aaaa;


  
}
Future<String> getcc(String urll)async{
    String metin="",aa="humm";
  //var client= http.Client();
  var res=await http.get(Uri.parse(urll));
  final body=res.body;
  final document =parser.parse(body);
  var response = document.getElementsByClassName("ArticleBody-articleBody")[0].getElementsByClassName("group").forEach((element) {element.getElementsByTagName("p").forEach((element) {metin+=(element.text.toString()+"\n"); });});
  return metin;
}