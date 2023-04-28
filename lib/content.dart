import 'package:dio/dio.dart';
import 'package:html/dom.dart';
import 'package:http/http.dart' as http;
import 'package:html/parser.dart'as parser;


Future<String> getcontent(String urll)async{
  String metin="";
  //var client= http.Client();
  var res=await http.get(Uri.parse(urll));
  final body=res.body;
  final document =parser.parse(body);
  var response = document.getElementsByClassName("ArticleBody-articleBody")[0].getElementsByClassName("group").forEach((element) {element.getElementsByTagName("p").forEach((element) {metin+=(element.text.toString()+"\n"); });});

    return metin;


  
}