import 'package:flutter/material.dart';
import 'package:my_news_app/content.dart';
import 'package:my_news_app/model/news_model.dart';
import 'package:my_news_app/pages/home_pages/home.dart';
import 'package:my_news_app/pages/home_pages/home_tabbar_pages.dart';
import 'package:my_news_app/pages/news_page.dart';
import 'package:my_news_app/widget/newsbox.dart';
import 'package:my_news_app/word_selectable_scrapping.dart';

class Bookmark extends StatefulWidget {
  const Bookmark({super.key});
  
   
  @override
  State<Bookmark> createState() => _BookmarkState();
}

class _BookmarkState extends State<Bookmark> {
  @override
  Widget build(BuildContext context) {
/*     List<newsBox> jj=List.generate(box.values.length, (index) => newsBox(
               imageUrl: box.get(index)!.imageUrl,
                category: box.get(index)!.category,
          
          futureWidget:  FutureBuilder(

          future:getcc(box.get(index)!.url),//"https://www.bbc.com/news/world-latin-america-65381624"
          builder: (context, snapshot) {
            
            
            //print((urlkey.currentState!.urlp)==null?"null":"null degil");
            
        if(snapshot.hasData){
          var metin= snapshot.data!;
          
 

          
          return FutureWordSelectableText(metin: metin[0]);
        }else if (snapshot.hasError) {
              return Text(snapshot.error.toString());
            } else
             { return const CircularProgressIndicator();}
      
        },
          ) ,
          
          subtitle:  FutureBuilder(
          future:getcc(box.get(index)!.url),//"https://www.bbc.com/news/world-latin-america-65381624"
          builder: (context, snapshot) {
            
            
            //print((urlkey.currentState!.urlp)==null?"null":"null degil");
            
        if(snapshot.hasData){
          var metin= snapshot.data!;
          return Text(metin[1]);
        }else if (snapshot.hasError) {
              return Text(snapshot.error.toString());
            } else
             { return const CircularProgressIndicator();}
          
        },
          ) ,
          time: box.get(index)!.time,
          title: box.get(index)!.title,
          urlscrap: box.get(index)!.url,
            )); */
    // box.valuesBetween()
    // print(box.keys.toList()[index]);
    //  box.clear();
    print(box.keys.toList());
    print(box.toMap().toString());
    return Scaffold(
      body: ListView(
          children:box.isNotEmpty?
          List.generate(box.values.length, (index) {
             //print(box.get(1)!.title);
            return GestureDetector(
            child: newsBox(
              // imageUrl: box.get(index)!.imageUrl,
              //  category: box.get(index)!.category,
          
          imageUrl: box.get(box.keys.toList()[index])!.imageUrl,
                category: box.get(box.keys.toList()[index])!.category,
          
          futureWidget:  FutureBuilder(

          future:getcc(box.get(box.keys.toList()[index])!.url),//"https://www.bbc.com/news/world-latin-america-65381624"
          builder: (context, snapshot) {
            
            
            //print((urlkey.currentState!.urlp)==null?"null":"null degil");
            
        if(snapshot.hasData){
          var metin= snapshot.data!;
          
 

          
          return FutureWordSelectableText(metin: metin[0]);
        }else if (snapshot.hasError) {
              return Text(snapshot.error.toString());
            } else
             { return const CircularProgressIndicator();}
      
        },
          ) ,
          
          subtitle:  FutureBuilder(
          future:getcc(box.get(box.keys.toList()[index])!.url),//"https://www.bbc.com/news/world-latin-america-65381624"
          builder: (context, snapshot) {
            
            
            //print((urlkey.currentState!.urlp)==null?"null":"null degil");
            
        if(snapshot.hasData){
          var metin= snapshot.data!;
          return Text(metin[1]);
        }else if (snapshot.hasError) {
              return Text(snapshot.error.toString());
            } else
             { return const CircularProgressIndicator();}
          
        },
          ) ,
          time: box.get(box.keys.toList()[index])!.time,
          title: box.get(box.keys.toList()[index])!.title,
          urlscrap: box.get(box.keys.toList()[index])!.url,
            ),
            onHorizontalDragStart: (details) {
                          setState(()  {
                          box.delete(box.keys.toList()[index]);
                          
/*                            for (var i = index; i <= box.values.length; i++) {
                            await box.putAt(i, news(                        
                        url:box.get(i+1)!.url,
                        imageUrl: box.get(i+1)!.imageUrl,
                        time: box.get(i+1)!.time,
                        title: box.get(i+1)!.title,
                        category: "aa",
                        text: "aa",
                        writer: "aa",
                        ));
                        box.deleteAt(i+1);
                          } */ });
                          
                        },
          );}):if_bookmarks_empty()
          
          
           /* bookmark_list.isNotEmpty
              ? List.generate(
                  bookmark_list.length,
                  (index) => GestureDetector(
                        child: bookmark_list[index],
                        onHorizontalDragStart: (details) {
                          setState(() {});
                          bookmark_list.removeAt(index);
                        },
                      ))
              : if_bookmarks_empty()), */
    ));
  }
}

List<Widget> if_bookmarks_empty() {
  return [
    Container(
        margin: EdgeInsets.only(top: 120, left: 40, right: 50),
        color: Colors.transparent,
        child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Container(
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.transparent,
                  border: Border.all(color: Colors.red, width: 2)),
              child: Icon(
                Icons.add,
                color: Colors.red,
                size: 25,
              )),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 5),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RichText(
                      maxLines: 3,
                      text: TextSpan(children: [
                        TextSpan(
                            text: "Add news",
                            style: TextStyle(
                                fontFamily: 'Montserrat',
                                fontSize: 25,
                                fontWeight: FontWeight.w600,
                                color: Colors.black)),
                        TextSpan(
                            text: " to create your own personel news feed",
                            style: TextStyle(
                                fontFamily: 'Montserrat',
                                fontSize: 24,
                                fontWeight: FontWeight.normal,
                                color: Colors.black)),
                      ])),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "All the latest stories from your topics will appear here",
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.normal,
                        color: Colors.black),
                    maxLines: 2,
                    
                  )
                ],
              ),
            ),
          )
        ]))
  ];
}

/* List<Widget> bookmark_list = [
  // newsBox(imageUrl: "assets/togg.jpg", title: "", subtitle: "subtitle", time: "time", writer: "writer", category: "category", text: "text")
]; */
