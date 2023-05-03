import 'package:flutter/material.dart';
import 'package:my_news_app/content.dart';
import 'package:my_news_app/pages/news_page.dart';
import 'package:my_news_app/word_selectable_scrapping.dart';

class SearchNotEmptyBox extends StatelessWidget {
  late String imageUrl;
  late String title;
  late String subtitle;
  late String time;
  late String writer;
  late String category;
  String urlll;
  SearchNotEmptyBox({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.subtitle,
    required this.time,
    required this.writer,
    required this.category,
   this.urlll ="",
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => newsPage(
                  imageUrl: imageUrl,
                  category: category,
                  urlsc: urlll,
                  futureWidget: FutureBuilder(
          future:getcc("https://www.cnbc.com/world-news/"),//"https://www.bbc.com/news/world-latin-america-65381624"
          builder: (context, snapshot) {
            
            
            //print((urlkey.currentState!.urlp)==null?"null":"null degil");
            print("newspage yukleniyor");
        if(snapshot.hasData){
          var metin= snapshot.data!;
          return FutureWordSelectableText(metin: metin[0]);
        }else if (snapshot.hasError) {
              return Text(snapshot.error.toString());
            } else
             { return Padding(
               padding: const EdgeInsets.only(top: 20),
               child: Center(
       
                  child:  CircularProgressIndicator(
                    color: Colors.red,
                    strokeWidth: 4,
                  ),
                           
               ),
             );}
      
        },
          ), 
                  //text: text,
                  time: time,
                  title: title,
                  writer: writer,
                  subtitle: FutureBuilder(
          future:getcc("https://www.cnbc.com/world-news/"),//"https://www.bbc.com/news/world-latin-america-65381624"
          builder: (context, snapshot) {
            
            
            //print((urlkey.currentState!.urlp)==null?"null":"null degil");
            print("newspage yukleniyor");
        if(snapshot.hasData){
          var metin= snapshot.data!;
          return Text(metin[1]);
        }else if (snapshot.hasError) {
              return Text(snapshot.error.toString());
            } else
             { return Padding(
               padding: const EdgeInsets.only(top: 20),
               child: Center(
       
                  child:  CircularProgressIndicator(
                    color: Colors.red,
                    strokeWidth: 4,
                  ),
                           
               ),
             );}
      
        },
          ),
                )));
      },
      child: Container(
          margin: EdgeInsets.only(left: 6, bottom: 6, top: 6),
          height: 126,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(7),
          ),
          child: Row(
            children: [
              Container(
                height: 140,
                width: MediaQuery.of(context).size.width / 2.1,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(7),
                    image: DecorationImage(
                        image: NetworkImage(imageUrl), fit: BoxFit.cover)),
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.only(left: 4),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: TextStyle(
                            fontFamily: "Montserrat",
                            fontSize: 17,
                            fontWeight: FontWeight.bold),
                        maxLines: 4,
                        overflow: TextOverflow.visible,
                      ),
                      Expanded(
                        child: Align(
                          alignment: Alignment.bottomLeft,
                          child: Text(time,
                              style: TextStyle(
                                  fontFamily: "Montserrat",
                                  fontSize: 13,
                                  color: Colors.black)),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          )),
    );
  }
}
