import 'package:flutter/material.dart';
import 'package:my_news_app/widget/create_news.dart';



class CinemaPage extends StatefulWidget {
  CinemaPage({super.key});

  @override
  State<CinemaPage> createState() => _CinemaPageState();
}

class _CinemaPageState extends State<CinemaPage> {
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
              'CINEMA&TV',
              style: TextStyle(
                  fontFamily: 'Montserrat',
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            )),
        body: createNewsListView[0][11]);
  }
}
