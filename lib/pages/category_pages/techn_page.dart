import 'package:flutter/material.dart';
import 'package:my_news_app/widget/create_news.dart';


class TechnologyPage extends StatefulWidget {
  TechnologyPage({super.key});

  @override
  State<TechnologyPage> createState() => _TechnologyPageState();
}

class _TechnologyPageState extends State<TechnologyPage> {
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
              'TECHNOLOGY',
              style: TextStyle(
                  fontFamily: 'Montserrat',
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            )),
        body: createNewsListView[3]);
  }
}
