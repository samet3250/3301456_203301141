import 'package:flutter/material.dart';
import 'package:my_news_app/content.dart';
import 'package:my_news_app/model/categories_model.dart';
import 'package:my_news_app/model/news_model.dart';
import 'package:my_news_app/news_api.dart';
import 'package:my_news_app/pages/news_page.dart';
import 'package:my_news_app/widget/searchnot_box.dart';
import 'package:my_news_app/word_selectable_scrapping.dart';

import 'newsbox.dart';
List<String> titleList=[];
List<int>indexxList=[];
List<SearchNotEmptyBox>searchList=[];
bool control=true;
int uzunluk=0;
List<Widget> categories_name() {
  return List.generate(
      categories.length, (index) => Text(categories[index].name));
}

List<List<Widget>> createNewsListView = [
[NewsBycategory(url:"https://www.cnbc.com/2023/04/28/euro-zone-gdp-q1-2023.html",category: 'cnbc',ind:0)],
[NewsBycategory(url:"https://www.cnbc.com/2023/04/28/euro-zone-gdp-q1-2023.html",category: 'cnbc',ind:1)],
[NewsBycategory(url:"https://www.cnbc.com/2023/04/28/euro-zone-gdp-q1-2023.html",category: 'cnbc',ind:2)],
[NewsBycategory(url:"https://www.cnbc.com/2023/04/28/euro-zone-gdp-q1-2023.html",category: 'cnbc',ind:3)],
[NewsBycategory(url:"https://www.cnbc.com/2023/04/28/euro-zone-gdp-q1-2023.html",category: 'cnbc',ind:4)],
[NewsBycategory(url:"https://www.cnbc.com/2023/04/28/euro-zone-gdp-q1-2023.html",category: 'cnbc',ind:5)],
[NewsBycategory(url:"https://www.cnbc.com/2023/04/28/euro-zone-gdp-q1-2023.html",category: 'cnbc',ind:6)],
 //"https://newsapi.org/v2/top-headlines?language=en&sources=bbc-news&apiKey=90cb3f5228b24f1aabaded9050e8f0d6"
  
];

 class NewsBycategory extends StatefulWidget {
  late String url;
  late String category;
  late int ind;
   NewsBycategory({super.key,required this.url,required this.category,required this.ind});

  @override
  State<NewsBycategory> createState() => _NewsBycategoryState();
}

class _NewsBycategoryState extends State<NewsBycategory> {
  late Future <List<news>> apiListHolder;
  String? urlp="https://www.bbc.com/news/world-latin-america-65381624";
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
   // apiListHolder=createApiList(widget.url,widget.category);
  }
  @override
  Widget build(BuildContext context) {
    print("kategori yukleniyor");

    return  ListView.builder(
              
                 
                
      itemCount: newsList.length,
      itemBuilder: (context, index) {
         var news = newsList[index];
         //urlp=news.url;
         uzunluk=newsList.length;


/*          for (var i = 0; i < newsList.length; i++) {
         titleList.add(newsList[i].title);
            
         }
     */
    if(control==true &&widget.ind==0){
       for (var i = 0; i < newsList.length; i++) {
         titleList.add(newsList[i].title);
         var ne=newsList[i];
        searchList.add(SearchNotEmptyBox(
            imageUrl: ne.imageUrl,
            time: ne.time,
            title: ne.title,
            category:  ne.category,
            subtitle:  ne.subtitle,
            urlll: ne.url,
            writer:  ne.writer
            ));
            
         }
        control=false;   
    }
    
        return newsBox(
         
          category: news.category,
          imageUrl: news.imageUrl,
          title: news.title,
          subtitle: news.subtitle,
          urlscrap: news.url,
          futureWidget: FutureBuilder(
          future:getcontent("https://www.cnbc.com/2023/04/28/euro-zone-gdp-q1-2023.html"),//"https://www.bbc.com/news/world-latin-america-65381624"
          builder: (context, snapshot) {
            
            
            //print((urlkey.currentState!.urlp)==null?"null":"null degil");
            print("newspage yukleniyor");
        if(snapshot.hasData){
          var metin= snapshot.data!;
          return FutureWordSelectableText(metin: metin);
        }else if (snapshot.hasError) {
              return Text(snapshot.error.toString());
            } else
             { return const CircularProgressIndicator();}
      
        },
          ),
          //text: news.text,
          time: news.time,
          writer: news.writer,
        );
      }
                
              
              );
  
  }
}


/*   itemCount: newsList.length,
      itemBuilder: (context, index) {
        return newsBox(
          category: newsList[index].category,
          imageUrl: newsList[index].imageUrl,
          title: newsList[index].title,
          subtitle: newsList[index].subtitle,
          text: newsList[index].text,
          time: newsList[index].time,
          writer: newsList[index].writer,
        );
      } */