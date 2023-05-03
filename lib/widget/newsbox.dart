import 'dart:core';

import 'package:flutter/material.dart';
import 'package:my_news_app/content.dart';
import 'package:my_news_app/pages/news_page.dart';

class newsBox extends StatefulWidget {
   String imageUrl;
   String title;
   late Widget subtitle;
   String time;
   String writer;
   String category;
   String urlscrap;
   late Widget futureWidget;
   

  //late int index;
  newsBox({
    super.key,
    //required this.index,
     this.imageUrl="",
     this.title="",
     required this.subtitle,
     this.time="",
     this.writer="",
     this.category="",
     this.urlscrap="",
     required this.futureWidget
     
  });

  @override
  State<newsBox> createState() => _newsBoxState();
}

class _newsBoxState extends State<newsBox> {
  bool _customTileExpanded = false;
  bool tapped =false;
  int cnt=0;
    @override
  Widget build(BuildContext context) {
    return GestureDetector(

      onDoubleTap: () {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => newsPage(
                  imageUrl: widget.imageUrl,
                  category: widget.category,
                  urlsc: widget.urlscrap,
                  //text: text,
                  futureWidget:widget.futureWidget,
                  time: widget.time,
                  title: widget.title,
                  writer: widget.writer,
                  subtitle: widget.subtitle,
                )));
      },
             onTap: () {cnt++;setState(() {
         
       });},
      child: Padding(
        padding: const EdgeInsets.only(top: 8, left: 15, right: 15, bottom: 4),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 180,
              width: double.infinity,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  border: Border.all(
                    width: 1,
                    color: const Color.fromARGB(255, 187, 180, 180),
                  ),
                  image: DecorationImage(
                      image: NetworkImage(widget.imageUrl), fit: BoxFit.fill)),
            ),
            const SizedBox(
              height: 6,
            ),
            Text(widget.time,
                style: const TextStyle(
                    fontFamily: "Times",
                    fontSize: 13,
                    color: Color.fromARGB(255, 138, 137, 137))),
            const SizedBox(
              height: 3,
            ),
            Text(widget.title,
                style: const TextStyle(
                    fontFamily: "Montserrat",
                    fontSize: 17,
                    fontWeight: FontWeight.bold)),
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
            if (cnt%2==1) widget.subtitle else const SizedBox()
            
          ],
        ),
      ),
     
    );
  }
}
/* 

GestureDetector(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => newsPage(
                  imageUrl: imageUrl,
                  category: category,
                  urlsc: urlscrap,
                  //text: text,
                  futureWidget:futureWidget,
                  time: time,
                  title: title,
                  writer: writer,
                  subtitle: subtitle,
                )));
      },
      child: Padding(
        padding: EdgeInsets.only(top: 8, left: 15, right: 15, bottom: 4),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 180,
              width: double.infinity,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  border: Border.all(
                    width: 1,
                    color: Color.fromARGB(255, 187, 180, 180),
                  ),
                  image: DecorationImage(
                      image: NetworkImage(imageUrl), fit: BoxFit.fill)),
            ),
            SizedBox(
              height: 6,
            ),
            Text(time,
                style: TextStyle(
                    fontFamily: "Times",
                    fontSize: 13,
                    color: Color.fromARGB(255, 138, 137, 137))),
            SizedBox(
              height: 3,
            ),
            Text(title,
                style: TextStyle(
                    fontFamily: "Montserrat",
                    fontSize: 17,
                    fontWeight: FontWeight.bold)),
            SizedBox(
              height: 3,
            ),
            Text(
              subtitle,
              style: TextStyle(
                fontFamily: 'Montserrat',
                fontSize: 16,
                color: Colors.black,
              ),
              maxLines: 2,
              overflow: TextOverflow.visible,
            ),
          ],
        ),
      ),
    );


 */
/* 

ExpansionTile(
          title: GestureDetector(
      onDoubleTap: () {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => newsPage(
                  imageUrl: widget.imageUrl,
                  category: widget.category,
                  urlsc: widget.urlscrap,
                  //text: text,
                  futureWidget:widget.futureWidget,
                  time: widget.time,
                  title: widget.title,
                  writer: widget.writer,
                  subtitle: widget.subtitle,
                )));
      },
      child: Padding(
        padding: EdgeInsets.only(top: 8, left: 15, right: 15, bottom: 4),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 180,
              width: double.infinity,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  border: Border.all(
                    width: 1,
                    color: Color.fromARGB(255, 187, 180, 180),
                  ),
                  image: DecorationImage(
                      image: NetworkImage(widget.imageUrl), fit: BoxFit.fill)),
            ),
            SizedBox(
              height: 6,
            ),
            Text(widget.time,
                style: TextStyle(
                    fontFamily: "Times",
                    fontSize: 13,
                    color: Color.fromARGB(255, 138, 137, 137))),
            SizedBox(
              height: 3,
            ),
            Text(widget.title,
                style: TextStyle(
                    fontFamily: "Montserrat",
                    fontSize: 17,
                    fontWeight: FontWeight.bold)),
            SizedBox(
              height: 3,
            ),
            Text(
              widget.subtitle,
              style: TextStyle(
                fontFamily: 'Montserrat',
                fontSize: 16,
                color: Colors.black,
              ),
              maxLines: 2,
              overflow: TextOverflow.visible,
            ),
          ],
        ),
      ),
    )
,
   trailing: SizedBox.shrink(),        

          children: const <Widget>[
            Text('This is tile number 2'),
          ],
          onExpansionChanged: (bool expanded) {
            setState(() => _customTileExpanded = expanded);
          },
        ) ;

 */