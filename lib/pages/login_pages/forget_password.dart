import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:my_news_app/firebase_firestore/firebase_firestore_func.dart';

class forgetPassword extends StatefulWidget {
  forgetPassword({super.key});

  @override
  State<forgetPassword> createState() => _forgetPasswordState();
}

class _forgetPasswordState extends State<forgetPassword> {
  late String e_mail;

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  FirebaseAuth auth = FirebaseAuth.instance;

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
              width: 90,
              height: 90,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/news.png'), fit: BoxFit.cover)),
            ),
          ),
          Form(
              key: formKey,
              child: Column(
                children: [
                  GetEmail(context),
                  SizedBox(height: 10),
                ],
              )),
          Button(context)
        ]));
  }

  Container Button(BuildContext context) {
    return Container(
        margin: EdgeInsets.fromLTRB(45, 0, 45, 0),
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
            bool validate = formKey.currentState!.validate();
            if (validate) {
              formKey.currentState!.save();
              FirebaseFirestoreFonk.forgot_password(e_mail, context);
              formKey.currentState!.reset();
              Navigator.of(context).pop();
            }
          },
          child: Text('Send mail',
              style: TextStyle(
                  fontFamily: 'Montserrat',
                  fontSize: 18,
                  fontWeight: FontWeight.w700)),
          style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
        ));
  }

  Container GetEmail(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(45, 0, 45, 0),
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
      child: TextFormField(
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(
            border: OutlineInputBorder(),
            enabledBorder: InputBorder.none,
            focusedBorder: InputBorder.none,
            contentPadding: EdgeInsets.fromLTRB(15, 11, 15, 11),
            errorStyle: TextStyle(color: Colors.red),
            hintText: 'E-mail'),
        validator: (value) {
          if (value!.length < 5) {
            return 'E-mail must be at least 5 character';
          } else if (!value.contains('@')) {
            return 'E-mail must contain special character (@)';
          } else {
            return null;
          }
        },
        onSaved: (newValue) {
          e_mail = newValue!;
        },
      ),
    );
  }
}
