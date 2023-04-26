import 'package:flutter/material.dart';
import 'package:my_news_app/content.dart';
import 'package:my_news_app/news_api.dart';
import 'package:my_news_app/pages/bookmark_page.dart';
import 'package:my_news_app/pages/home_pages/home.dart';
import 'package:my_news_app/pages/login_pages/user_enter.dart';
import 'package:my_news_app/pages/login_pages/user_enterwith.dart';
import 'package:my_news_app/pages/search_page.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
     
     
    
   // Future<String> aa=getcontent("https://www.bbc.com/news/world-latin-america-65381624");
    
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Home()
    );
  }
}
/* 


Scaffold(
        body: FutureBuilder(future:getcontent("https://www.bbc.com/news/world-latin-america-65381624"),builder: (context, snapshot) {
        if(snapshot.hasData){
          var metin= snapshot.data!;
          return Text(metin);
        }else{
          return Text("null");
        }
      
        },
          ),
      )

 */