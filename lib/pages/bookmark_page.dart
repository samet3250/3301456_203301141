import 'package:flutter/material.dart';
import 'package:my_news_app/pages/home_pages/home.dart';
import 'package:my_news_app/pages/home_pages/home_tabbar_pages.dart';
import 'package:my_news_app/widget/newsbox.dart';

class Bookmark extends StatefulWidget {
  const Bookmark({super.key});

  @override
  State<Bookmark> createState() => _BookmarkState();
}

class _BookmarkState extends State<Bookmark> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
          children: bookmark_list.isNotEmpty
              ? List.generate(
                  bookmark_list.length,
                  (index) => GestureDetector(
                        child: bookmark_list[index],
                        onHorizontalDragStart: (details) {
                          setState(() {});
                          bookmark_list.removeAt(index);
                        },
                      ))
              : if_bookmarks_empty()),
    );
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

List<Widget> bookmark_list = [
  // newsBox(imageUrl: "assets/togg.jpg", title: "", subtitle: "subtitle", time: "time", writer: "writer", category: "category", text: "text")
];
