import 'package:flutter/material.dart';
import 'package:my_news_app/pages/bookmark_page.dart';
import 'package:my_news_app/widget/newsbox.dart';
import 'package:word_selectable_text/word_selectable_text.dart';
import 'package:translator/translator.dart';

class newsPage extends StatefulWidget {
  late String imageUrl;
  late String title;
  late String subtitle;
  late String category;
  late String writer;
  late String time;
  late String text;
  newsPage({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.subtitle,
    required this.time,
    required this.writer,
    required this.category,
    required this.text,
  });

  @override
  State<newsPage> createState() => _newsPageState();
}

class _newsPageState extends State<newsPage> {
  late GoogleTranslator translator = GoogleTranslator();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        Column(
          children: [
            Stack(children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height / 2.5,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(widget.imageUrl), fit: BoxFit.cover)),
              ),
              Positioned(
                top: 23,
                left: 0,
                child: IconButton(
                    onPressed: () => Navigator.of(context).pop(),
                    icon: Image.asset('assets/icons/back2.png',
                        width: 25, height: 25, color: Colors.black)),
              ),
              Positioned(
                  left: 10,
                  bottom: 50,
                  child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4),
                          color: Colors.black.withOpacity(0.55)),
                      padding: EdgeInsets.all(3),
                      child: Text(
                        widget.category,
                        style: TextStyle(
                            fontFamily: 'Montserrat',
                            fontSize: 17,
                            fontWeight: FontWeight.w600,
                            color: Colors.white),
                      ))),
            ]),
            Expanded(child: Container())
          ],
        ),
        Positioned(
          bottom: 0,
          right: 0,
          left: 0,
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: (MediaQuery.of(context).size.height / 1.52),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30)),

                color: Colors.white,
               ),
            child: ListView(
              children: [
                Padding(
                    padding: EdgeInsets.only(left: 10,top:12),
                    child: Text(
                      'By ${widget.writer}  ${widget.time}',
                      style: TextStyle(fontFamily: 'Montserrat'),
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
                  child: WordSelectableText(
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
                ),
              ],
            ),
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
                  onPressed: () {},
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
                        imageUrl: widget.imageUrl,
                        title: widget.title,
                        subtitle: widget.subtitle,
                        time: widget.time,
                        writer: widget.writer,
                        category: widget.category,
                        text: widget.text));
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
