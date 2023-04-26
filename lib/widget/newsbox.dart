import 'package:flutter/material.dart';
import 'package:my_news_app/content.dart';
import 'package:my_news_app/pages/news_page.dart';

class newsBox extends StatelessWidget {
   String imageUrl;
   String title;
   String subtitle;
   String time;
   String writer;
   String category;
   String urlscrap;
   Widget futureWidget;
   

  //late int index;
  newsBox({
    super.key,
    //required this.index,
     this.imageUrl="",
     this.title="",
     this.subtitle="",
     this.time="",
     this.writer="",
     this.category="",
     this.urlscrap="",
     required this.futureWidget
     
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
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
  }
}
