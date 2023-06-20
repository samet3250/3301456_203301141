import 'package:flutter/material.dart';
import 'package:my_news_app/pages/category_pages/books_page.dart';
import 'package:my_news_app/pages/category_pages/movies_page.dart';
import 'package:my_news_app/widget/category_box.dart';
import 'package:my_news_app/widget/create_news.dart';
import 'package:my_news_app/model/categories_model.dart';
import 'category_pages/business_page.dart';
import 'category_pages/health_page.dart';
import 'category_pages/poltcs_page.dart';
import 'category_pages/travel_page.dart';
import 'category_pages/techn_page.dart';
import 'category_pages/sports_page.dart';
import 'category_pages/local_page.dart';
import 'category_pages/world_page.dart';

List indexlist = [];

class SearchPage extends StatefulWidget {
  SearchPage({super.key});

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
            : SliverToBoxAdapter(
                child: ifSearchNotEmptyText(searchController.text)),
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
            setState(() {
              FocusScope.of(context).unfocus();
            });
          },
          icon: Image.asset(
            'assets/icons/search.png',
            color: Colors.black,
          ));
    }
    ;
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
    delegate: SliverChildListDelegate(List.generate(
        indexlist.length, (index) => searchList[indexlist[index]])));

SliverGrid ifSearchEmptySliver(BuildContext context) {
  return SliverGrid.count(
      childAspectRatio: 5 / 3.5,
      crossAxisCount: 2,
      children: List.generate(categories.length, (index) {
        return GestureDetector(
            onTap: () {
              switch (index) {
                case 0:
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => WorldPage()));
                  break;
                case 1:
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => LocalPage()));
                  break;
                case 2:
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => BusinessPage()));
                  break;
                case 3:
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => TechnologyPage()));
                  break;
                case 4:
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => TravelPage()));
                  break;
                case 5:
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => PoliticsPage()));
                  break;
                case 6:
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => HealthPage()));
                  break;
                case 7:
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => SportsPage()));
                  break;
                case 8:
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => BooksPage()));
                  break;
                case 9:
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => MoviesPage()));
                  break;
              }
            },
            child: categoryBox(
                imageUrl: categories[index].imageUrl,
                category: categories[index].name));
      }));
}

void searchlist_add(String text) {
  indexlist.clear();

  titleList = titleList.toSet().toList();

  for (int a = 0; a < titleList.length; a++) {
    var subtitle = titleList[a].toLowerCase();
    var search_text = text.toLowerCase();
    if (subtitle.contains(search_text)) {
      indexlist.add(a);
    }
  }
}
