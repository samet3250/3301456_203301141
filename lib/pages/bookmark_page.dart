import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:my_news_app/provider/web_scraping.dart';
import 'package:my_news_app/model/news_model.dart';
import 'package:my_news_app/widget/newsbox.dart';
import 'package:my_news_app/widget/word_selectable_text_widget.dart';

class Bookmark extends StatefulWidget {
  const Bookmark({super.key});

  @override
  State<Bookmark> createState() => _BookmarkState();
}

class _BookmarkState extends State<Bookmark> {
  var box = Hive.box<news>("News_all");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(
            children: box.isNotEmpty
                ? List.generate(box.values.length, (index) {
                    return GestureDetector(
                      child: newsBox(
                        imageUrl: box.get(box.keys.toList()[index])!.imageUrl,
                        category: box.get(box.keys.toList()[index])!.category,
                        futureWidget: FutureBuilder(
                          future: getTextandSubtitle(
                              box.get(box.keys.toList()[index])!.url),
                          builder: (context, snapshot) {
                            if (snapshot.hasData) {
                              var content = snapshot.data!;

                              return FutureWordSelectableText(
                                  content: content[0]);
                            } else if (snapshot.hasError) {
                              return Text(snapshot.error.toString());
                            } else {
                              return const CircularProgressIndicator();
                            }
                          },
                        ),
                        subtitle: FutureBuilder(
                          future: getTextandSubtitle(
                              box.get(box.keys.toList()[index])!.url),
                          builder: (context, snapshot) {
                            if (snapshot.hasData) {
                              var content = snapshot.data!;
                              return Text(content[1]);
                            } else if (snapshot.hasError) {
                              return Text(snapshot.error.toString());
                            } else {
                              return const CircularProgressIndicator();
                            }
                          },
                        ),
                        time: box.get(box.keys.toList()[index])!.time,
                        title: box.get(box.keys.toList()[index])!.title,
                        urlscrap: box.get(box.keys.toList()[index])!.url,
                      ),
                      onHorizontalDragStart: (details) {
                        setState(() {
                          box.delete(box.keys.toList()[index]);
                        });
                      },
                    );
                  })
                : if_bookmarks_empty()));
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
