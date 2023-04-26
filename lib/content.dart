import 'package:dio/dio.dart';
import 'package:html/dom.dart';
import 'package:http/http.dart' as http;
import 'package:html/parser.dart'as parser;


Future<String> getcontent(String urll)async{
  String metin="";
  var res=await http.get(Uri.parse(urll));
  final body=res.body;
  final document =parser.parse(body);
  var response = document.getElementsByClassName("ssrcss-1ki8hfp-StyledZone e1mcntqj3")[0].getElementsByClassName("ssrcss-11r1m41-RichTextComponentWrapper ep2nwvo0");
  response.forEach((element) {
    
    
    metin+=(element.text.toString()+"\n");

    });
    
    return metin;


  
}