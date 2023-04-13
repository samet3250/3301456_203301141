import 'package:flutter/material.dart';
import 'package:my_news_app/pages/news_page.dart';

class SearchNotEmptyBox extends StatelessWidget {
  late String imageUrl;
  late String title;
  late String subtitle;
  late String time;
  late String writer;
  late String category;
  late String text;
  SearchNotEmptyBox({
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
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        margin: EdgeInsets.only(top: 8, left: 8, right: 8),
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
                          image: AssetImage(imageUrl), fit: BoxFit.cover)),
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
      ),
    );
  }
}
