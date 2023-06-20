import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:my_news_app/provider/web_scraping.dart';
import 'package:my_news_app/model/news_model.dart';
import 'package:my_news_app/widget/searchnot_box.dart';
import 'package:my_news_app/widget/word_selectable_text_widget.dart';
import 'package:shimmer/shimmer.dart';
import 'newsbox.dart';

List<String> titleList = [];
List<SearchNotEmptyBox> searchList = [];
List<bool> ControlList=[true,true,true,true,true,true,true,true,true,true];
List<Widget> createNewsListView = [
  NewsBycategory(url: "https://www.cnbc.com/world-news/", ind: 0),
  NewsBycategory(url: "https://www.cnbc.com/turkey/", ind: 1),
  NewsBycategory(url: "https://www.cnbc.com/business/", ind: 2),
  NewsBycategory(url: "https://www.cnbc.com/technology/", ind: 3),
  NewsBycategory(url: "https://www.cnbc.com/travel/", ind: 4),
  NewsBycategory(url: "https://www.cnbc.com/politics/", ind: 5),
  NewsBycategory(url: "https://www.cnbc.com/health-and-science/", ind: 6),
  NewsBycategory(url: "https://www.cnbc.com/sports/", ind: 7),
  NewsBycategory(url: "https://www.cnbc.com/books/", ind: 8),
  NewsBycategory(url: "https://www.cnbc.com/movies/", ind: 9),
];

class NewsBycategory extends StatefulWidget {
  late String url;
  late int ind;

  NewsBycategory({super.key, required this.url, required this.ind});

  @override
  State<NewsBycategory> createState() => _NewsBycategoryState();
}

class _NewsBycategoryState extends State<NewsBycategory>
    with SingleTickerProviderStateMixin {

    var box2 = Hive.box("category");
    var box3 = Hive.box("language");
@override
  void initState() {
    // TODO: implement initState
    super.initState();
      if (widget.ind == 1 && box2.isNotEmpty) {
      widget.url = "https://www.cnbc.com/${box2.get("cat")}/";
    }
  }
  @override
  Widget build(BuildContext context) {

    print("kategori yukleniyor");
    return RefreshIndicator(
      onRefresh: () async {
        setState(() {});
      },
      child: FutureBuilder(
          future: getcontent(widget.url, widget.ind),
          builder: (context, snapshot) {
            
            if (snapshot.hasData) {
              List<news> AllNews = snapshot.data!;
              return ListView.builder(
                  itemCount: AllNews.length,
                  itemBuilder: (context, index) {
                    print("newspage yukleniyor");
                    getNewsToList( 0, AllNews);
                    getNewsToList( 1, AllNews);
                    getNewsToList( 2, AllNews);
                    getNewsToList( 3, AllNews);
                    getNewsToList( 4, AllNews);
                    getNewsToList( 5, AllNews);
                    getNewsToList( 6, AllNews);
                    getNewsToList( 7, AllNews);
                    getNewsToList( 8, AllNews);
                    getNewsToList( 9, AllNews);
                    
                    return newsBox(
                      category: AllNews[index].category,
                      futureWidget: FutureBuilder(
                        future: getTextandSubtitle(AllNews[index].url), 
                        builder: (context, snapshot) {
                        

                          if (snapshot.hasData) {
                            var AllNews = snapshot.data!;

                            return FutureWordSelectableText(content: AllNews[0]);
                          } else if (snapshot.hasError) {
                            return Text(snapshot.error.toString());
                          } else {
                            return const CircularProgressIndicator();
                          }
                        },
                      ),
                      imageUrl: AllNews[index].imageUrl,
                      subtitle: FutureBuilder(
                        future: getTextandSubtitle(AllNews[index]
                            .url), 
                        builder: (context, snapshot) {
                          

                          if (snapshot.hasData) {
                            var AllNews = snapshot.data!;
                            return Text(AllNews[1]);
                          } else if (snapshot.hasError) {
                            return Text(snapshot.error.toString());
                          } else {
                            return const CircularProgressIndicator();
                          }
                        },
                      ),
                      time: AllNews[index].time,
                      title: AllNews[index].title,
                      urlscrap: AllNews[index].url,
                    );
                  });
            } else if (snapshot.hasError) {
              return Text(snapshot.error.toString());
            } else {
              return Shimmer.fromColors(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.only(
                        top: 8, left: 15, right: 15, bottom: 4),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        schimmerAnimationBox(),
                        schimmerAnimationBox(),
                        schimmerAnimationBox(),
                      ],
                    ),
                  ),
                ),
                baseColor: Colors.grey.shade300,
                highlightColor: Colors.grey.shade100,
              );
            }
          }),
    );


  }

  Column schimmerAnimationBox() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 180,
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: Colors.grey.shade300,
          ),
        ),
        const SizedBox(
          height: 6,
        ),
        Container(height: 17, width: 65, color: Colors.grey.shade300),
        const SizedBox(
          height: 3,
        ),
        Container(
            height: 17, width: double.infinity, color: Colors.grey.shade300),
        const SizedBox(
          height: 3,
        ),
        Container(
            height: 17, width: double.infinity, color: Colors.grey.shade300),
        const SizedBox(
          height: 8,
        ),
      ],
    );
  }

  void getNewsToList(int index,List<news> AllNews){
                        if (ControlList[index] == true && widget.ind == index) {
                      for (var i = 0; i < AllNews.length; i++) {
                        titleList.add(AllNews[i].title);
                        var _news = AllNews[i];
                        searchList.add(SearchNotEmptyBox(
                            imageUrl: _news.imageUrl,
                            time: _news.time,
                            title: _news.title,
                            category: _news.category,
                            subtitle: _news.subtitle,
                            url: _news.url,
                            writer: _news.writer));
                      }
                      ControlList[index] = false;
      
  }
}



    }



