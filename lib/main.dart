import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:my_news_app/content.dart';
import 'package:my_news_app/firebase_options.dart';
import 'package:my_news_app/news_api.dart';
import 'package:my_news_app/pages/bookmark_page.dart';
import 'package:my_news_app/pages/home_pages/home.dart';
import 'package:my_news_app/pages/login_pages/user_enter.dart';
import 'package:my_news_app/pages/login_pages/user_enterwith.dart';
import 'package:my_news_app/pages/search_page.dart';
import 'package:my_news_app/word_selectable_scrapping.dart';

import 'model/news_model.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
    await Hive.initFlutter("news_App");
   Hive.registerAdapter(newsAdapter());
   await Hive.openBox<news>("News_all");
   await Hive.openBox("category");
   await Hive.openBox("language"); 
  runApp(const MyApp());
}
/* void main() async{
   await Hive.initFlutter("news_App");
   Hive.registerAdapter(newsAdapter());
   await Hive.openBox<news>("News_all");
   await Hive.openBox("category");
   await Hive.openBox("language");
   
   runApp(const MyApp());} */

/* Future? Newsscrap(String url,int ind){ getcontent(url, ind).then((metin) {
 /* print("---------------------------------------------------------------------------------------------");
 print("---------------------------------------------------------------------------------------------");
 print(List.generate(16, (index) => news(
  category: metin[index].category,
          
          futureWidget: FutureBuilder(
          future:getcc(metin[index].url),//"https://www.bbc.com/news/world-latin-america-65381624"
          builder: (context, snapshot) {
            
            
            //print((urlkey.currentState!.urlp)==null?"null":"null degil");
            print("newspage yukleniyor");
        if(snapshot.hasData){
          var metin= snapshot.data!;
          return FutureWordSelectableText(metin: metin[0]);
        }else if (snapshot.hasError) {
              return Text(snapshot.error.toString());
            } else
             { return const CircularProgressIndicator();}
      
        },
          ),
          imageUrl:metin[index].imageUrl ,
          subtitle: FutureBuilder(
          future:getcc(metin[index].url),//"https://www.bbc.com/news/world-latin-america-65381624"
          builder: (context, snapshot) {
            
            
            //print((urlkey.currentState!.urlp)==null?"null":"null degil");
            print("newspage yukleniyor");
        if(snapshot.hasData){
          var metin= snapshot.data!;
          return Text(metin[1]);
        }else if (snapshot.hasError) {
              return Text(snapshot.error.toString());
            } else
             { return const CircularProgressIndicator();}
      
        },
          ),
          time: metin[index].time,
          title: metin[index].title,
          url: metin[index].url
 ))); 
 print("---------------------------------------------------------------------------------------------");
 print("---------------------------------------------------------------------------------------------");
 */
  var box=Hive.box<news>("News_all");

  List.generate(16, (index) async {
  await box.clear();
  box.add(news(
  category: metin[index].category,
          
          futureWidget: FutureBuilder(
          future:getcc(metin[index].url),//"https://www.bbc.com/news/world-latin-america-65381624"
          builder: (context, snapshot) {
            
            
            //print((urlkey.currentState!.urlp)==null?"null":"null degil");
            print("newspage yukleniyor");
        if(snapshot.hasData){
          var metin= snapshot.data!;
          return FutureWordSelectableText(metin: metin[0]);
        }else if (snapshot.hasError) {
              return Text(snapshot.error.toString());
            } else
             { return const CircularProgressIndicator();}
      
        },
          ),
          imageUrl:metin[index].imageUrl ,
          subtitle: FutureBuilder(
          future:getcc(metin[index].url),//"https://www.bbc.com/news/world-latin-america-65381624"
          builder: (context, snapshot) {
            
            
            //print((urlkey.currentState!.urlp)==null?"null":"null degil");
            print("newspage yukleniyor");
        if(snapshot.hasData){
          var metin= snapshot.data!;
          return Text(metin[1]);
        }else if (snapshot.hasError) {
              return Text(snapshot.error.toString());
            } else
             { return const CircularProgressIndicator();}
      
        },
          ),
          time: metin[index].time,
          title: metin[index].title,
          url: metin[index].url
 ));
 }
 
 );
 print("----------------------------------");
 print("----------------------------------");
 print(box.toMap().toString());
 print("----------------------------------");
 print("----------------------------------");

 });} */


class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override

  @override
  Widget build(BuildContext context) {
     
     
    // Newsscrap("https://www.cnbc.com/world-news/",0); 
    
   // Future<String> aa=getcontent("https://www.bbc.com/news/world-latin-america-65381624");
    //"https://www.cnbc.com/2023/04/28/euro-zone-gdp-q1-2023.html"


    return MaterialApp(

      debugShowCheckedModeBanner: false,
      home: userEnter()
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