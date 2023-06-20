import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:my_news_app/model/news_model.dart';
import 'package:share_plus/share_plus.dart';

class newsPage extends StatefulWidget {
  late String imageUrl;
  late String title;
  late String category;
  late String writer;
  late String time;
  late String url;
  late Widget subtitle;
  late Widget futureWidget;
  newsPage(
      {super.key,
      required this.imageUrl,
      required this.title,
      required this.subtitle,
      required this.time,
      required this.writer,
      required this.category,
      required this.url,
      required this.futureWidget});

  @override
  State<newsPage> createState() => _newsPageState();
}

class _newsPageState extends State<newsPage> {
  var box = Hive.box<news>("News_all");

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
                        image: NetworkImage(widget.imageUrl),
                        fit: BoxFit.cover)),
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
          top: (MediaQuery.of(context).size.height) / 3,
          child: ListView(
            children: [
              Padding(
                  padding: EdgeInsets.only(
                    left: 10,
                  ),
                  child: Text(
                    '${widget.time}',
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
                  child: widget.futureWidget),
            ],
          ),
        ),
        Positioned(
            right: 16,
            top: (MediaQuery.of(context).size.height - 90) / 3,
            child: Container(
              height: 50,
              width: 50,
              decoration: BoxDecoration(boxShadow: [
                BoxShadow(
                    color: Colors.black, offset: Offset(0, 1), blurRadius: 10)
              ], color: Colors.white, borderRadius: BorderRadius.circular(25)),
              child: IconButton(
                  onPressed: () async {
                    await Share.share(widget.url);
                  },
                  icon: Padding(
                    padding: const EdgeInsets.all(5),
                    child: Image.asset('assets/icons/share.png',
                        color: Colors.black),
                  )),
            )),
        Positioned(
            right: 74,
            top: (MediaQuery.of(context).size.height - 90) / 3,
            child: Container(
              height: 50,
              width: 50,
              decoration: BoxDecoration(boxShadow: [
                BoxShadow(
                    color: Colors.black, offset: Offset(0, 1), blurRadius: 10)
              ], color: Colors.white, borderRadius: BorderRadius.circular(25)),
              child: IconButton(
                  onPressed: () {
                    box.add(news(
                      url: widget.url,
                      imageUrl: widget.imageUrl,
                      time: widget.time,
                      title: widget.title,
                      category: "",
                      text: "",
                      writer: "",
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
