import 'package:flutter/material.dart';
import 'package:my_news_app/widget/create_news.dart';


class HealthPage extends StatefulWidget {
  HealthPage({super.key});

  @override
  State<HealthPage> createState() => _HealthPageState();
}

class _HealthPageState extends State<HealthPage> {
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
              'HEALTH AND SCIENCE',
              style: TextStyle(
                  fontFamily: 'Montserrat',
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            )),
        body: createNewsListView[6]);
  }
}
