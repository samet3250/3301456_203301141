import 'package:flutter/material.dart';
import 'package:my_news_app/pages/news_page.dart';

class newsBox extends StatelessWidget {
  late String imageUrl;
  late String title;
  late String subtitle;
  late String time;
  late String writer;
  late String category;
  late String text;

  //late int index;
  newsBox({
    super.key,
    //required this.index,
    required this.imageUrl,
    required this.title,
    required this.subtitle,
    required this.time,
    required this.writer,
    required this.category,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => newsPage(
                  imageUrl: imageUrl,
                  category: category,
                  text: text,
                  time: time,
                  title: title,
                  writer: writer,
                  subtitle: subtitle,
                )));
      },
      child: Card(
        shadowColor: Colors.black,
        elevation: 3,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(11)),
        margin: EdgeInsets.only(top: 8, left: 12, right: 12),
        child: Padding(
          padding: EdgeInsets.only(top: 8, left: 8, right: 8, bottom: 4),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 180,
                width: double.infinity,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      width: 1,
                      color: Color.fromARGB(255, 187, 180, 180),
                    ),
                    image: DecorationImage(
                        image: AssetImage(imageUrl), fit: BoxFit.fill)),
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
      ),
    );
  }
}
