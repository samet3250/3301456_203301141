import 'package:flutter/material.dart';
import 'package:my_news_app/pages/login_pages/user_enter.dart';

class userEnterWith extends StatefulWidget {
  const userEnterWith({super.key});

  @override
  State<userEnterWith> createState() => _userEnterWithState();
}

class _userEnterWithState extends State<userEnterWith> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Column(children: [
        Align(
          alignment: Alignment.topCenter,
          child: Container(
            width: 150,
            height: 150,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/news.png'), fit: BoxFit.cover)),
          ),
        ),
        SizedBox(
          height: 35,
        ),
        navButton(context),
        SizedBox(
          height: 15,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 35),
          child: Row(
            children: [
              withContainer('assets/icons/facebook1.png'),
              SizedBox(
                width: 10,
              ),
              withContainer('assets/icons/google.png'),
              SizedBox(
                width: 10,
              ),
              withContainer('assets/icons/twitter.png'),
            ],
          ),
        )
      ]),
    );
  }

  Container withContainer(String url) {
    return Container(
      //margin: EdgeInsets.fromLTRB(35,0, 35,0),
      height: 46,
      width: (MediaQuery.of(context).size.width - 90) / 3,
      decoration: BoxDecoration(
          //border:Border.all(width: 1,color: Colors.red),
          color: Colors.white,
          borderRadius: BorderRadius.circular(4),
          border: Border.all(width: 1, color: Colors.black.withOpacity(0.7)),
          boxShadow: [
            BoxShadow(
                color: Colors.black.withOpacity(0.2),
                offset: Offset(0, 3),
                blurRadius: 6)
          ]),
      alignment: Alignment.center,
      child: IconButton(
        icon: Image.asset(
          url,
          width: 40,
          height: 40,
          fit: BoxFit.cover,
        ),
        onPressed: () {},
      ),
    );
  }

  Container navButton(BuildContext context) {
    return Container(
        margin: EdgeInsets.fromLTRB(35, 0, 35, 0),
        height: 46,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            //border:Border.all(width: 1,color: Colors.red),
            color: Colors.white,
            borderRadius: BorderRadius.circular(4),
            boxShadow: [
              BoxShadow(
                  color: Colors.black.withOpacity(0.2),
                  offset: Offset(0, 3),
                  blurRadius: 6)
            ]),
        child: ElevatedButton(
          onPressed: () {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => userEnter()));
          },
          child: Text('Enter with One News',
              style: TextStyle(
                  fontFamily: 'Montserrat',
                  fontSize: 18,
                  fontWeight: FontWeight.w700)),
          style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
        ));
  }
}
