import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:html/dom.dart';
import 'package:http/http.dart' as http;
import 'package:html/parser.dart'as parser;

import 'model/news_model.dart';

//var response = document.getElementsByClassName("ArticleBody-articleBody")[0].getElementsByClassName("group").forEach((element) {element.getElementsByTagName("p").forEach((element) {metin+=(element.text.toString()+"\n"); });});
Future<List<news>> getcontent(String urll,int index)async{
  String metin="",aa="humm";
  List<news> aaaa=[];
  //var client= http.Client();
  for (int i=0;i<1;i++){
    var res=await http.get(Uri.parse(urll));
  final body=res.body;
  final document =parser.parse(body);
  
  /* 
  tarih---  el.children[1].getElementsByClassName("Card-cardFooter")[0].text
  acıklama--- el.children[1].getElementsByClassName("Card-titleContainer")[0].text
  category--- el.children[1].getElementsByClassName("Card-eyebrowContainer")[0].text
  resim --- (el.getElementsByClassName("Card-squareMediaContainer Card-placeholder")[0].children[0].innerHtml.split("\"")[1]!="PlayButton-base"?el.getElementsByClassName("Card-squareMediaContainer Card-placeholder")[0].children[0].innerHtml.split("\"")[1]:"https://im.haberturk.com/2023/04/26/3586345_18459bcabc71697438868098c51bdef4_1366x1366.jpg"
  
   */
  var response2 = document.getElementsByClassName("PageBuilder-pageWrapper")[0].getElementsByClassName("PageBuilder-containerFluidWidths PageBuilder-pageRow")[0].getElementsByClassName("Layout-layout");

  void addnewsust(int a,int b){
      print(response2[a].children[b].getElementsByClassName("Card-titleAndFooter")[0].getElementsByTagName("a")[0].attributes["href"]);
      
      if(!response2[a].children[b].getElementsByTagName("a")[0].attributes["href"].toString().contains("video")&&!response2[a].children[b].getElementsByTagName("a")[0].attributes["href"].toString().contains("live-updates")&&response2[a].children[b].getElementsByClassName("Card-titleAndFooter")[0].getElementsByTagName("a")[0].attributes["href"]!="/pro/"){
      aaaa.add(news(
      url: response2[a].children[b].getElementsByTagName("a")[0].attributes["href"].toString(),
      imageUrl:response2[a].children[b].getElementsByTagName("source")[0].attributes["srcset"].toString(), //el.getElementsByClassName("Card-squareMediaContainer Card-placeholder")[0].children[0].innerHtml.split("\"")[1]!="PlayButton-base"?el.getElementsByClassName("Card-squareMediaContainer Card-placeholder")[0].children[0].innerHtml.split("\"")[1]:"https://im.haberturk.com/2023/04/26/3586345_18459bcabc71697438868098c51bdef4_1366x1366.jpg",
      category: "bilmiyorum",
      title: response2[a].children[b].getElementsByClassName("Card-titleContainer")[0].text,
      time:response2[a].children[b].getElementsByClassName("Card-time")[0].text

    )); 
    }}
      void addnewsalt(int a,int b){
       //print(response2[a].getElementsByClassName("Card-standardBreakerCard Card-threeUpStackRectangleSquareMedia Card-rectangleToLeftSquareMedia Card-card")[b].getElementsByClassName("Card-titleAndFooter")[0].getElementsByTagName("a")[1].attributes["href"]);
       if(!response2[a].getElementsByClassName("Card-standardBreakerCard Card-threeUpStackRectangleSquareMedia Card-rectangleToLeftSquareMedia Card-card")[b].getElementsByTagName("a")[0].attributes["href"].toString().contains("video")&&!response2[a].getElementsByClassName("Card-standardBreakerCard Card-threeUpStackRectangleSquareMedia Card-rectangleToLeftSquareMedia Card-card")[b].getElementsByTagName("a")[0].attributes["href"].toString().contains("live-updates")&&response2[a].getElementsByClassName("Card-standardBreakerCard Card-threeUpStackRectangleSquareMedia Card-rectangleToLeftSquareMedia Card-card")[b].getElementsByClassName("Card-titleAndFooter")[0].getElementsByTagName("a")[1].attributes["href"]!="/pro/"){ 
       aaaa.add(news(
      url: response2[a].getElementsByClassName("Card-standardBreakerCard Card-threeUpStackRectangleSquareMedia Card-rectangleToLeftSquareMedia Card-card")[b].getElementsByTagName("a")[0].attributes["href"].toString(),
      imageUrl:response2[a].getElementsByClassName("Card-standardBreakerCard Card-threeUpStackRectangleSquareMedia Card-rectangleToLeftSquareMedia Card-card")[b].getElementsByTagName("source")[0].attributes["srcset"].toString(), //el.getElementsByClassName("Card-squareMediaContainer Card-placeholder")[0].children[0].innerHtml.split("\"")[1]!="PlayButton-base"?el.getElementsByClassName("Card-squareMediaContainer Card-placeholder")[0].children[0].innerHtml.split("\"")[1]:"https://im.haberturk.com/2023/04/26/3586345_18459bcabc71697438868098c51bdef4_1366x1366.jpg",
      category: "bilmiyorum",
      title: response2[a].getElementsByClassName("Card-standardBreakerCard Card-threeUpStackRectangleSquareMedia Card-rectangleToLeftSquareMedia Card-card")[b].getElementsByClassName("Card-titleContainer")[0].text,
      time:response2[a].getElementsByClassName("Card-standardBreakerCard Card-threeUpStackRectangleSquareMedia Card-rectangleToLeftSquareMedia Card-card")[b].getElementsByClassName("Card-time")[0].text
      
    )); 

   
    }}
   addnewsust(0,0);
  addnewsust(0,1);
  addnewsust(1,0);
  addnewsust(1,1);
  addnewsust(1,2);
  addnewsalt(2, 0);
  addnewsalt(2, 1); 

void morenews(int number){
   var response = document.getElementsByClassName("PageBuilder-pageWrapper")[0].getElementsByClassName("PageBuilder-containerFluidWidths PageBuilder-pageRow")[number].getElementsByClassName("PageBuilder-col-9 PageBuilder-col")[0].getElementsByClassName("ThreeUpStack-container").forEach((element) {element.getElementsByClassName("Card-standardBreakerCard Card-threeUpStackRectangleSquareMedia Card-rectangleToLeftSquareMedia Card-card").forEach((el) {
        //el.children[1].getElementsByClassName("Card-titleAndFooter")[0].getElementsByTagName("a")[0].attributes["href"].toString()
        //el.children[1].getElementsByClassName("Card-titleAndFooter")[0].getElementsByClassName("Card-title")[0].text
    // print(el.children[1].getElementsByClassName("Card-titleAndFooter")[0].getElementsByTagName("a")[0].attributes["href"]);
   if(!el.children[1].getElementsByClassName("Card-titleAndFooter")[0].getElementsByTagName("a")[1].attributes["href"].toString().contains("video")&&!el.children[1].getElementsByClassName("Card-titleAndFooter")[0].getElementsByTagName("a")[1].attributes["href"].toString().contains("live-updates")&&el.children[1].getElementsByClassName("Card-titleAndFooter")[0].getElementsByTagName("a")[0].attributes["href"]!="/pro/"){
      //print( el.children[1].getElementsByClassName("Card-eyebrowContainer")[0].getElementsByTagName("a")[0].attributes["href"]);
      // print(el.children[1].getElementsByClassName("Card-titleAndFooter")[0].getElementsByTagName("a")[1].attributes["href"].toString());
       //print(document.getElementById("BrandPageWrapper")!.getElementsByTagName("header")[0].attributes["data-analytics"]);
       aaaa.add(news(
      url: el.children[1].getElementsByClassName("Card-titleAndFooter")[0].getElementsByTagName("a")[1].attributes["href"].toString(),//el.children[1].getElementsByClassName("Card-titleContainer")[0].getElementsByTagName("a")[0].attributes["href"].toString(),
      imageUrl:el.getElementsByTagName("source")[0].attributes["srcset"].toString(), //el.getElementsByClassName("Card-squareMediaContainer Card-placeholder")[0].children[0].innerHtml.split("\"")[1]!="PlayButton-base"?el.getElementsByClassName("Card-squareMediaContainer Card-placeholder")[0].children[0].innerHtml.split("\"")[1]:"https://im.haberturk.com/2023/04/26/3586345_18459bcabc71697438868098c51bdef4_1366x1366.jpg",
      category: el.children[1].getElementsByClassName("Card-eyebrowContainer")[0].text,
      title: el.children[1].getElementsByClassName("Card-titleAndFooter")[0].getElementsByClassName("Card-title")[0].text,//el.children[1].getElementsByClassName("Card-titleContainer")[0].text,
      time:el.children[1].getElementsByClassName("Card-cardFooter")[0].text 
    )); 
}   
  });});  
}  
if(index!=5){
  morenews(3);
}else{
  morenews(4);
}

  /* 
  response2.children[1].getElementsByTagName("a")[0].attributes["href"].toString()  -----url
  response2.children[1].getElementsByTagName("source")[0].attributes["srcset"].toString()  ---imageurl
  response2.children[1].getElementsByClassName("Card-titleContainer")[0].text    ----text
  response2.children[1].getElementsByClassName("Card-cardFooter")[0].text  ----- time
   */
   
      
      
      

    
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
Future<List<String>> getcc(String urll)async{
    String metin="",aa="humm";
    
  var client= http.Client();
  var res=await http.get(Uri.parse(urll));
  final body=res.body;
  final document =parser.parse(body);
    print(document.getElementsByTagName("meta")[8].attributes["content"]); 

  var response = document.getElementsByClassName("ArticleBody-articleBody")[0].getElementsByClassName("group").forEach((element) {element.getElementsByTagName("p").forEach((element) {metin+=(element.text.toString()+"\n"); });});
  aa=document.getElementsByTagName("meta")[8].attributes["content"]!;
  List<String> mycontent=[metin,aa];
  return mycontent;
}