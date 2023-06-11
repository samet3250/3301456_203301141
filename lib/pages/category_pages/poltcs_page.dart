import 'package:flutter/material.dart';
import 'package:my_news_app/widget/create_news.dart';


class PoliticsPage extends StatefulWidget {
  PoliticsPage({super.key});

  @override
  State<PoliticsPage> createState() => _PoliticsPageState();
}

class _PoliticsPageState extends State<PoliticsPage> {
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
              'POLITICS',
              style: TextStyle(
                  fontFamily: 'Montserrat',
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            )),
        body: createNewsListView[5]);
  }
}
