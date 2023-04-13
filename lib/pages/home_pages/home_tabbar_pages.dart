import 'package:flutter/material.dart';
import 'package:my_news_app/model/categories_model.dart';
import 'package:my_news_app/widget/create_news.dart';


class HomeTabbarPages extends StatefulWidget {
  const HomeTabbarPages({super.key});

  @override
  State<HomeTabbarPages> createState() => _HomeTabbarPagesState();
}

class _HomeTabbarPagesState extends State<HomeTabbarPages>
    with SingleTickerProviderStateMixin {
  late TabController tabBarController;
  int curIndex = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    tabBarController = TabController(length: categories.length, vsync: this);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    tabBarController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 0,
        backgroundColor: Colors.transparent,
        elevation: 0,
        bottom: PreferredSize(
          preferredSize: Size(double.infinity, 30),
          child: TabBar(
            controller: tabBarController,
            isScrollable: true,
            tabs: categories_name(),
            labelColor: Colors.black,
            labelStyle: TextStyle(
                fontFamily: 'Montserrat',
                fontSize: 20,
                fontWeight: FontWeight.bold),
            unselectedLabelStyle: TextStyle(
                fontFamily: 'Montserrat',
                fontSize: 18,
                fontWeight: FontWeight.normal),
            unselectedLabelColor: Colors.black.withOpacity(0.6),
            indicatorSize: TabBarIndicatorSize.label,
            labelPadding: EdgeInsets.only(left: 12, right: 3),
            indicatorColor: Colors.transparent,
          ),
        ),
      ),
      body: TabBarView(
          controller: tabBarController, children: createNewsListView),
    );
  }
}

