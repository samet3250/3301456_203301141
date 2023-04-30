import 'package:flutter/material.dart';
import 'package:my_news_app/content.dart';
import 'package:my_news_app/model/news_model.dart';
import 'package:my_news_app/news_api.dart';
import 'package:my_news_app/pages/bookmark_page.dart';
import 'package:my_news_app/widget/newsbox.dart';
import 'package:share_plus/share_plus.dart';

import 'package:word_selectable_text/word_selectable_text.dart';
import 'package:translator/translator.dart';

import '../word_selectable_scrapping.dart';

class newsPage extends StatefulWidget {
  late String imageUrl;
  late String title;
  late String subtitle;
  late String category;
  late String writer;
  late String time;
   String urlsc;
  late Widget futureWidget;
  newsPage({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.subtitle,
    required this.time,
    required this.writer,
    required this.category,
    this.urlsc="",
    required this.futureWidget
  });

  @override
  State<newsPage> createState() => _newsPageState();
}

class _newsPageState extends State<newsPage> {
  //late GoogleTranslator translator = GoogleTranslator();
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        Column(
          children: [
            Stack(children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height / 3,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage(widget.imageUrl), fit: BoxFit.fitWidth)),
              ),
              Positioned(
                top: 23,
                left: 0,
                child: IconButton(
                    onPressed: () => Navigator.of(context).pop(),
                    icon: Image.asset('assets/icons/back2.png',
                        width: 25, height: 25, color: Colors.black)),
              ),

            ]),
            
          ],
        ),
        Positioned(
          bottom: 0,
          right: 0,
          left: 0,
          top:MediaQuery.of(context).size.height / 3 ,

            child: ListView(
              children: [
                Padding(
                    padding: EdgeInsets.only(left: 10,top: 8),
                    child: Text(
                      'From ${widget.writer}  ${widget.time}',
                      style: TextStyle(fontFamily: 'Times'),
                    )),
                Padding(
                    padding: EdgeInsets.fromLTRB(10, 5, 10, 10),
                    child: Text(
                      widget.title,
                      style: TextStyle(
                          fontFamily: 'Montserrat',
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          color: Colors.black),
                      maxLines: 2,
                    )),





                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  
                  child:  widget.futureWidget
                ),
              ],
            ),
          
        ),
        Positioned(
            right: 16,
            top: (MediaQuery.of(context).size.height - 60) / 3,
            child: Container(
              height: 50,
              width: 50,
              decoration: BoxDecoration(boxShadow: [
                BoxShadow(
                    color: Colors.black, offset: Offset(0, 1), blurRadius: 10)
              ], color: Colors.white, borderRadius: BorderRadius.circular(25)),
              child: IconButton(
                  onPressed: () async{
                    await Share.share(widget.urlsc);
                  },
                  icon: Padding(
                    padding: const EdgeInsets.all(5),
                    child: Image.asset('assets/icons/share.png',
                        color: Colors.black),
                  )),
            )),
        Positioned(
            right: 74,
            top: (MediaQuery.of(context).size.height - 60) / 3,
            child: Container(
              height: 50,
              width: 50,
              decoration: BoxDecoration(boxShadow: [
                BoxShadow(
                    color: Colors.black, offset: Offset(0, 1), blurRadius: 10)
              ], color: Colors.white, borderRadius: BorderRadius.circular(25)),
              child: IconButton(
                  onPressed: () {
                    bookmark_list.add(newsBox(
                        urlscrap:widget.urlsc,
                        futureWidget:Text("sss"),/* FutureBuilder(
          future:getcontent(widget.urlsc),//"https://www.bbc.com/news/world-latin-america-65381624"
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
          ) , */
                        imageUrl: widget.imageUrl,
                        title: widget.title,
                        subtitle: widget.subtitle,
                        time: widget.time,
                        writer: widget.writer,
                        category: widget.category,
                        //text: widget.text
                        ));
                  },
                  icon: Padding(
                    padding: const EdgeInsets.all(5),
                    child: Image.asset('assets/icons/bookmark.png',
                        color: Colors.black),
                  )),
            )),
      ]),
    );
  }
}



/* 





WordSelectableText(
                    selectable: true,
                    highlight: true,
                    text: widget.text,
                    style: TextStyle(fontSize: 20, fontFamily: 'Montserrat'),
                    onWordTapped: (word, index) {
                      translator
                          .translate(word, from: 'en', to: 'tr')
                          .then((value) {
                        SnackBar snackBar = SnackBar(
                          dismissDirection: DismissDirection.none,
                          duration: Duration(seconds: 2),
                          backgroundColor: Colors.transparent,
                          elevation: 0,
                          content: Card(
                            shadowColor: Colors.black,
                            elevation: 5,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                    padding: EdgeInsets.only(left: 25),
                                    child: Text(
                                      '$value',
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontFamily: 'Monserrat',
                                          fontSize: 18,
                                          fontWeight: FontWeight.w400),
                                    )),
                                IconButton(
                                    onPressed: () {
                                      ScaffoldMessenger.of(context)
                                          .clearSnackBars();
                                    },
                                    icon: Image.asset(
                                      'assets/icons/back.png',
                                      color: Colors.black,
                                    ))
                              ],
                            ),
                          ),
                        );

                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      });
                    },
                  ),






 */