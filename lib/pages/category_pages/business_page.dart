import 'package:flutter/material.dart';
import 'package:my_news_app/pages/home_pages/home_tabbar_pages.dart';
import 'package:my_news_app/widget/create_news.dart';


class BusinessPage extends StatefulWidget {
  BusinessPage({super.key});

  @override
  State<BusinessPage> createState() => _BusinessPageState();
}

class _BusinessPageState extends State<BusinessPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            backgroundColor: Colors.red.shade400,
            elevation: 4,
            title: Text(
              'BUSINESS',
              style: TextStyle(
                  fontFamily: 'Montserrat',
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            )),
        body: createNewsListView[0][3]);
  }
}
