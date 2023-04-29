import 'package:flutter/material.dart';
import 'package:my_news_app/widget/create_news.dart';


class TurkeyPage extends StatefulWidget {
  TurkeyPage({super.key});

  @override
  State<TurkeyPage> createState() => _TurkeyPageState();
}

class _TurkeyPageState extends State<TurkeyPage> {
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
              'TURKEY',
              style: TextStyle(
                  fontFamily: 'Montserrat',
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            )),
        body: createNewsListView[1]);
  }
}
