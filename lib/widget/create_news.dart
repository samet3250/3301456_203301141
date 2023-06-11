import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:my_news_app/content.dart';
import 'package:my_news_app/model/categories_model.dart';
import 'package:my_news_app/model/news_model.dart';
import 'package:my_news_app/news_api.dart';
import 'package:my_news_app/pages/home_pages/home.dart';
import 'package:my_news_app/pages/news_page.dart';
import 'package:my_news_app/widget/searchnot_box.dart';
import 'package:my_news_app/word_selectable_scrapping.dart';
import 'package:shimmer/shimmer.dart';

import 'newsbox.dart';
List<String> titleList=[];
List<int>indexxList=[];
List<SearchNotEmptyBox>searchList=[];
bool control1=true;
bool control2=true;
bool control3=true;
bool control4=true;
bool control5=true;
bool control6=true;
bool control7=true;
String local="france";
int uzunluk=0;
List<Widget> categories_name() {
  
  print(box2.isNotEmpty? box2.values.first:"neeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee");
  return List.generate(
      categories.length, (index) => Text(categories[index].name));
}

List<Widget> createNewsListView = [
 NewsBycategory(url:"https://www.cnbc.com/world-news/",ind:0),
NewsBycategory(url:"https://www.cnbc.com/turkey/",ind:1),
NewsBycategory(url:"https://www.cnbc.com/business/",ind:2),
NewsBycategory(url:"https://www.cnbc.com/technology/",ind:3),
NewsBycategory(url:"https://www.cnbc.com/travel/",ind:4),
NewsBycategory(url:"https://www.cnbc.com/politics/",ind:5),
NewsBycategory(url:"https://www.cnbc.com/health-and-science/",ind:6),
NewsBycategory(url:"https://www.cnbc.com/sports/",ind:7),
NewsBycategory(url:"https://www.cnbc.com/books/",ind:8),
NewsBycategory(url:"https://www.cnbc.com/movies/",ind:9),

 //"https://newsapi.org/v2/top-headlines?language=en&sources=bbc-news&apiKey=90cb3f5228b24f1aabaded9050e8f0d6"
  
];


 /* Future? Newsscrap(String url,int ind){ getcontent(url, ind).then((value) {
  print("-----------");
  print(value.toString());
  print("-----------");

 });} */
  class NewsBycategory extends StatefulWidget {
  late String url;
  
  late int ind;
  
   NewsBycategory({super.key,required this.url,required this.ind});

  @override
  State<NewsBycategory> createState() => _NewsBycategoryState();
}

class _NewsBycategoryState extends State<NewsBycategory> with SingleTickerProviderStateMixin{
  //late Future <List<news>> apiListHolder;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

   // apiListHolder=createApiList(widget.url,widget.category);

   
    

  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    
    
  }
  @override
  Widget build(BuildContext context) {
     if (widget.ind==1&&box2.isNotEmpty){
      widget.url="https://www.cnbc.com/${box2.get("cat")}/";

    } 
    print("kategori yukleniyor");
          // var box=Hive.box("News_all");
    // box.clear();
    return GestureDetector(
      onVerticalDragEnd: (details) {
        print("aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa");
        setState(() {
          
        });
      },
      child: FutureBuilder(future: getcontent(widget.url,widget.ind),
      builder: (context, snapshot) {
              
              
              //print((urlkey.currentState!.urlp)==null?"null":"null degil");
          if(snapshot.hasData){
            var metin= snapshot.data!;
            return ListView.builder(itemCount: metin.length,itemBuilder:(context, index) {
              // box.add(metin[index].url);
             print("newspage yukleniyor");
              if(control1==true &&widget.ind==0){
          for (var i = 0; i < metin.length; i++) {
           titleList.add(metin[i].title);
           var ne=metin[i]; 
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
          control1=false;   
      } 
                  if(control2==true &&widget.ind==1){
          for (var i = 0; i < metin.length; i++) {
           titleList.add(metin[i].title);
           var ne=metin[i]; 
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
          control2=false;   
      }            if(control3==true &&widget.ind==2){
          for (var i = 0; i < metin.length; i++) {
           titleList.add(metin[i].title);
           var ne=metin[i]; 
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
          control3=false;   
      }  
                  if(control4==true &&widget.ind==3){
          for (var i = 0; i < metin.length; i++) {
           titleList.add(metin[i].title);
           var ne=metin[i]; 
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
          control4=false;   
      } 
                  if(control5==true &&widget.ind==4){
          for (var i = 0; i < metin.length; i++) {
           titleList.add(metin[i].title);
           var ne=metin[i]; 
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
          control5=false;   
      } 
                  if(control6==true &&widget.ind==5){
          for (var i = 0; i < metin.length; i++) {
           titleList.add(metin[i].title);
           var ne=metin[i]; 
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
          control6=false;   
      } 
                  if(control7==true &&widget.ind==6){
          for (var i = 0; i < metin.length; i++) {
           titleList.add(metin[i].title);
           var ne=metin[i]; 
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
          control7=false;   
      }       
              return newsBox(
            category: metin[index].category,
            
            futureWidget: FutureBuilder(
            future:getcc(metin[index].url),//"https://www.bbc.com/news/world-latin-america-65381624"
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
            ),
            imageUrl:metin[index].imageUrl ,
            subtitle: FutureBuilder(
            future:getcc(metin[index].url),//"https://www.bbc.com/news/world-latin-america-65381624"
            builder: (context, snapshot) {
              
              
              //print((urlkey.currentState!.urlp)==null?"null":"null degil");
              
          if(snapshot.hasData){
            var metin= snapshot.data!;
            return Text(metin[1]);
          }else if (snapshot.hasError) {
                return Text(snapshot.error.toString());
              } else
               { 
                
                return const CircularProgressIndicator();}
            
          },
            ),
            time: metin[index].time,
            title: metin[index].title,
            urlscrap: metin[index].url,);
            
            } 
            ); 
          
          }else if (snapshot.hasError) {
                return Text(snapshot.error.toString());
              } else
               { 
                
                return Shimmer.fromColors(child: SingleChildScrollView(
                  child: Padding(
        padding: const EdgeInsets.only(top: 8, left: 15, right: 15, bottom: 4),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
          schimmerAnimationBox(),
          schimmerAnimationBox(),
          schimmerAnimationBox(),
            
          ],
        ),
      ),
                )
                , baseColor: Colors.grey.shade300, highlightColor: Colors.grey.shade100,
                ) ;
               
              }
          
          }
          
          
          ),
    );  
        
        /* ListView.builder(
              
                 
                
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
          future:getcontent("https://www.cnbc.com/world-news/"),//"https://www.bbc.com/news/world-latin-america-65381624"
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
  */
  }
  
  Column schimmerAnimationBox() {
     return Column(
    
     mainAxisAlignment: MainAxisAlignment.start,
     crossAxisAlignment: CrossAxisAlignment.start,
      children: [
                    Container(
              height: 180,
              width: double.infinity,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
              color:  Colors.grey.shade300,
                 
                  ),
            ),
            const SizedBox(
              height: 6,
            ),
          Container(height: 17,width:65,color:  Colors.grey.shade300),
            const SizedBox(
              height: 3,
            ),
          Container(height: 17,width: double.infinity,color:  Colors.grey.shade300),
           
            const SizedBox(
              height: 3,
            ),
          Container(height: 17,width: double.infinity,color:  Colors.grey.shade300),
                      const SizedBox(
              height: 8,
            ),
      ],
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








      /* 
      
      return ListView.builder(itemCount:10,itemBuilder:(context, index) {
                 return Padding(
        padding: const EdgeInsets.only(top: 8, left: 15, right: 15, bottom: 4),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 180,
              width: double.infinity,
              color: Colors.grey.shade300,

            ),
            const SizedBox(
              height: 6,
            ),
Container(height: 17,width: double.infinity,color: Colors.grey.shade300,), 
            const SizedBox(
              height: 3,
            ),
            Container(height: 17,width: double.infinity,color: Colors.grey.shade300,),
            const SizedBox(
              height: 3,
            ),
/*             Text(
              widget.subtitle,
              style: const TextStyle(
                fontFamily: 'Montserrat',
                fontSize: 16,
                color: Colors.black,
              ),
              maxLines: 2,
              overflow: TextOverflow.visible,
            ), */
            // ignore: prefer_const_constructors
           
            
          ],
        ),
      );
               }, );
      
      */

      /* 
      
      
      SingleChildScrollView(
                  
                  
                  child: Column(children: [
                  Padding(
        padding: const EdgeInsets.only(top: 8, left: 15, right: 15, bottom: 4),
        
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 180,
              width: double.infinity,
              color: Colors.grey.shade300,

            ),
            const SizedBox(
              height: 6,
            ),
Container(height: 17,width: double.infinity,color:Colors.grey.shade300,), 
            const SizedBox(
              height: 3,
            ),
            Container(height: 17,width: double.infinity,color:Colors.grey.shade300,),
            const SizedBox(
              height: 3,
            ),
             Text(
              widget.subtitle,
              style: const TextStyle(
                fontFamily: 'Montserrat',
                fontSize: 16,
                color: Colors.black,
              ),
              maxLines: 2,
              overflow: TextOverflow.visible,
            ), 
            // ignore: prefer_const_constructors
           
            
          ],
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(top: 8, left: 15, right: 15, bottom: 4),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 180,
              width: double.infinity,
              color: Colors.grey.shade300,

            ),
            const SizedBox(
              height: 6,
            ),
Container(height: 17,width: double.infinity,color: Colors.grey.shade300,), 
            const SizedBox(
              height: 3,
            ),
            Container(height: 17,width: double.infinity,color: Colors.grey.shade300,),
            const SizedBox(
              height: 3,
            ),
             Text(
              widget.subtitle,
              style: const TextStyle(
                fontFamily: 'Montserrat',
                fontSize: 16,
                color: Colors.black,
              ),
              maxLines: 2,
              overflow: TextOverflow.visible,
            ), 
            // ignore: prefer_const_constructors
           
            
          ],
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(top: 8, left: 15, right: 15, bottom: 4),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 180,
              width: double.infinity,
              color: Colors.grey.shade300,

            ),
            const SizedBox(
              height: 6,
            ),
Container(height: 17,width: double.infinity,color: Colors.grey.shade300,), 
            const SizedBox(
              height: 3,
            ),
            Container(height: 17,width: double.infinity,color: Colors.grey.shade300,),
            const SizedBox(
              height: 3,
            ),
             Text(
              widget.subtitle,
              style: const TextStyle(
                fontFamily: 'Montserrat',
                fontSize: 16,
                color: Colors.black,
              ),
              maxLines: 2,
              overflow: TextOverflow.visible,
            ), 
            // ignore: prefer_const_constructors
           
            
          ],
        ),
      )
                ],),)
       */