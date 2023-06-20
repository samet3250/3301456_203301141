import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:my_news_app/firebase_firestore/firebase_firestore_func.dart';
import 'package:my_news_app/pages/home_pages/home.dart';
import 'package:my_news_app/pages/login_pages/user_enter.dart';

class userEnterWith extends StatefulWidget {
  const userEnterWith({super.key});

  @override
  State<userEnterWith> createState() => _userEnterWithState();
}

class _userEnterWithState extends State<userEnterWith> {
  FirebaseAuth auth = FirebaseAuth.instance;
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
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
        withContainer('assets/icons/google.png')
      ]),
    );
  }

  Container withContainer(String url) {
    return Container(
      margin: EdgeInsets.fromLTRB(35, 0, 35, 0),
      height: 46,
      width: MediaQuery.of(context).size.width / 2.5,
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
        onPressed: () {
          FirebaseFirestoreFonk.googleIleGiris(context, auth, firestore).then(
              (value) => Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => Home())));
        },
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
