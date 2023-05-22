import 'package:flutter/material.dart';
import 'package:my_news_app/model/news_model.dart';
import 'package:my_news_app/news_api.dart';
import 'package:my_news_app/pages/home_pages/home.dart';
import 'package:my_news_app/widget/newsbox.dart';
import 'package:translator/translator.dart';
import 'package:word_selectable_text/word_selectable_text.dart';

class FutureWordSelectableText extends StatefulWidget {
  late String metin;
  FutureWordSelectableText({super.key ,required this.metin});

  @override
  State<FutureWordSelectableText> createState() => _FutureWordSelectableTextState();
}

class _FutureWordSelectableTextState extends State<FutureWordSelectableText> {
  late GoogleTranslator translator = GoogleTranslator();
  
  @override
  Widget build(BuildContext context) {
    return WordSelectableText(
                    selectable: true,
                    highlight: true,
                    text: widget.metin,
                    style: TextStyle(fontSize: 20, fontFamily: 'Montserrat'),
                    onWordTapped: (word, index) {
                      translator
                          .translate(word, from: 'en', to: box3.isNotEmpty? box3.get('lan'):'tr')
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
                  )
;
  }
}


