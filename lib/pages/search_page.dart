import 'package:flutter/material.dart';
import 'package:my_news_app/model/news_model.dart';
import 'package:my_news_app/widget/category_box.dart';
import 'package:my_news_app/widget/searchnot_box.dart';
import 'package:my_news_app/model/categories_model.dart';

import 'category_pages/books_page.dart';
import 'category_pages/business_page.dart';
import 'category_pages/cinema_page.dart';
import 'category_pages/education_page.dart';
import 'category_pages/entertainment_page.dart';
import 'category_pages/health_page.dart';
import 'category_pages/highlights_page.dart';
import 'category_pages/lifestyle_page.dart';
import 'category_pages/science_page.dart';
import 'category_pages/sports_page.dart';
import 'category_pages/turkey_page.dart';
import 'category_pages/world_page.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  late TextEditingController searchController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    searchController = TextEditingController();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    searchController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(slivers: [
        SliverToBoxAdapter(
          child: Padding(
            padding: EdgeInsets.fromLTRB(25, 8, 25, 0),
            child: Container(
              height: 46,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  //border:Border.all(width: 1,color: Colors.red),
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black.withOpacity(0.2),
                        offset: Offset(0, 3),
                        blurRadius: 6)
                  ]),
              child: Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      onFieldSubmitted: (value) {
                        setState(() {});
                      },
                      controller: searchController,
                      decoration: InputDecoration(
                          hintText: 'Search',
                          hintStyle: TextStyle(
                              fontFamily: 'Montserrat',
                              fontSize: 18,
                              color: Colors.black),
                          contentPadding:
                              EdgeInsets.only(top: 8, bottom: 10, left: 10),
                          enabledBorder: InputBorder.none,
                          focusedBorder: InputBorder.none),
                    ),
                  ),
                  Padding(
                      padding: EdgeInsets.only(right: 14), child: searchIcons())
                ],
              ),
            ),
          ),
        ),
        searchController.text.isEmpty
            ? SliverToBoxAdapter(child: ifSearchEmptyText())
            : SliverToBoxAdapter(child: ifSearchNotEmptyText(searchController.text)),
        searchController.text.isEmpty
            ? ifSearchEmptySliver(context)
            : ifSearchNotEmptySliver(searchController.text)
      ]),
    );
  }
  
  IconButton searchIcons() {
    if (searchController.text.isNotEmpty) {
      return IconButton(
          onPressed: () {
            setState(() {
              searchController.clear();
            });
          },
          icon: Image.asset(
            'assets/icons/cancel.png',
            color: Colors.black,
          ));
    } else {
      return IconButton(
          onPressed: () {
            setState(() {});
          },
          icon: Image.asset(
            'assets/icons/search.png',
            color: Colors.black,
          ));
    };
  }


}


Widget ifSearchNotEmptyText(String text) {
  searchlist_add(text);

  return indexlist.isNotEmpty
      ? Column(
          children: [
            SizedBox(
              height: 18,
            ),
            Padding(
              padding: EdgeInsets.only(left: 11),
              child: Align(
                alignment: Alignment.centerLeft,
                child: RichText(
                    text: TextSpan(children: [
                  TextSpan(
                      text: 'Search result for ',
                      style: TextStyle(
                          fontFamily: 'Montserrat',
                          fontSize: 13,
                          fontWeight: FontWeight.w400,
                          color: Colors.black)),
                  TextSpan(
                      text: text,
                      style: TextStyle(
                          fontFamily: 'Montserrat',
                          fontSize: 13,
                          fontWeight: FontWeight.bold,
                          color: Colors.black))
                ])),
              ),
            ),
          ],
        )
      : Column(
          children: [
            SizedBox(
              height: 18,
            ),
            Padding(
              padding: EdgeInsets.only(left: 11),
              child: Align(
                alignment: Alignment.centerLeft,
                child: RichText(
                    text: TextSpan(children: [
                  TextSpan(
                      text: 'No result found for ',
                      style: TextStyle(
                          fontFamily: 'Montserrat',
                          fontSize: 13,
                          fontWeight: FontWeight.w400,
                          color: Colors.black)),
                  TextSpan(
                      text: text,
                      style: TextStyle(
                          fontFamily: 'Montserrat',
                          fontSize: 13,
                          fontWeight: FontWeight.bold,
                          color: Colors.black))
                ])),
              ),
            ),
          ],
        );
}

Widget ifSearchEmptyText() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      SizedBox(
        height: 18,
      ),
      Padding(
          padding: EdgeInsets.only(left: 15),
          child: Text(
            'All Categories',
            style: TextStyle(
                fontFamily: 'Montserrat',
                fontSize: 20,
                fontWeight: FontWeight.w600),
            textAlign: TextAlign.left,
          )),
    ],
  );
}

SliverList ifSearchNotEmptySliver(String text) => SliverList(
        delegate: SliverChildBuilderDelegate(
      childCount: indexlist.length,
      (context, index) {
        
        return SearchNotEmptyBox(
            imageUrl: AllLists[indexlist[index][0]][indexlist[index][1]].imageUrl,
            time: AllLists[indexlist[index][0]][indexlist[index][1]].time,
            title: AllLists[indexlist[index][0]][indexlist[index][1]].title,
            category:  AllLists[indexlist[index][0]][indexlist[index][1]].category,
            subtitle:  AllLists[indexlist[index][0]][indexlist[index][1]].subtitle,
            text:  AllLists[indexlist[index][0]][indexlist[index][1]].text,
            writer:  AllLists[indexlist[index][0]][indexlist[index][1]].writer,
            );
      },
    ));

SliverGrid ifSearchEmptySliver(BuildContext context) {
  return SliverGrid.count(
      childAspectRatio: 5 / 3.5,
      crossAxisCount: 2,
      children: List.generate(categories.length, (index) {
        return GestureDetector(
            onTap: () {
              switch (index) {
                case 0:
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => HighlightsPage() ));
                  break;
                case 1:
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => TurkeyPage()));
                  break;
                case 2:
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => WorldPage()));
                  break;
                case 3:
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => BusinessPage()));
                  break;
                case 4:
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => SportsPage()));
                  break;
                case 5:
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => SciencePage()));
                  break;
                case 6:
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => EducationPage()));
                  break;
                case 7:
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => EntertainmentPage()));
                  break;
                case 8:
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => LifestylePage()));
                  break;
                case 9:
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => HealthPage()));
                  break;
                case 10:
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => BooksPage()));
                  break;
                case 11:
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => CinemaPage()));
                  break;

                default:
              }
            },
            child: categoryBox(
                imageUrl: categories[index].imageUrl,
                category: categories[index].name));
      }));
}

List indexlist = [];
void searchlist_add(String text) {
  indexlist.clear();
  for (int i = 0; i < AllLists.length; i++) {
    for(int a=0;a<AllLists[i].length;a++){
      var subtitle=AllLists[i][a].title.toLowerCase();
      var search_text =text.toLowerCase();
      if(subtitle.contains(search_text)){
        indexlist.add([i,a]);
        

      }
    }

  }
}
