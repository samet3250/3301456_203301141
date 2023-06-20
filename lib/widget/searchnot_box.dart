import 'package:flutter/material.dart';
import 'package:my_news_app/provider/web_scraping.dart';
import 'package:my_news_app/pages/news_page.dart';
import 'package:my_news_app/widget/word_selectable_text_widget.dart';


class SearchNotEmptyBox extends StatelessWidget {
  late String imageUrl;
  late String title;
  late String subtitle;
  late String time;
  late String writer;
  late String category;
  late String url;
  SearchNotEmptyBox({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.subtitle,
    required this.time,
    required this.writer,
    required this.category,
    required this.url ,
  });

  @override
  Widget build(BuildContext context) {

    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => newsPage(
                  imageUrl: imageUrl,
                  category: category,
                  url: url,
                  futureWidget: FutureBuilder(
          future:getTextandSubtitle(url),
          builder: (context, snapshot) {        
        if(snapshot.hasData){
          List<String> Newscontent= snapshot.data!;
          return FutureWordSelectableText(content: Newscontent[0]);
        }else if (snapshot.hasError) {
              return Text(snapshot.error.toString());
            } else
             { return Padding(
               padding: const EdgeInsets.only(top: 20),
               child: Center(
       
                  child:  CircularProgressIndicator(
                    color: Colors.red,
                    strokeWidth: 4,
                  ),
                           
               ),
             );}
      
        },
          ), 
                  //text: text,
                  time: time,
                  title: title,
                  writer: writer,
                  subtitle: SizedBox()
                )));
      },
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
                        image: NetworkImage(imageUrl), fit: BoxFit.cover)),
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
    );
  }
}
