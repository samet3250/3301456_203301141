import 'package:flutter/material.dart';

import '../home_pages/home.dart';

class userEnter extends StatelessWidget {
  userEnter({super.key});

  String email = "", password = "";

  

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Column(
        children: [
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
          Form(
              key: formKey,
              //autovalidateMode: AutovalidateMode.onUserInteraction,
              child: Column(
                children: [
                  emailTexField(context),
                  SizedBox(height: 10),
                  ParolaTextField(context),
                  SizedBox(
                    height: 15,
                  ),
                  navButton(context)
                ],
              ))
        ],
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
            bool validate = formKey.currentState!.validate();
            if (validate) {
              formKey.currentState!.save();
              formKey.currentState!.reset();
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => Home()));
            }
          },
          child: Text('Log In',
              style: TextStyle(
                  fontFamily: 'Montserrat',
                  fontSize: 18,
                  fontWeight: FontWeight.w700)),
          style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
        ));
  }

  Container ParolaTextField(BuildContext context) {
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
      child: TextFormField(
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(
            border: OutlineInputBorder(),
            enabledBorder: InputBorder.none,
            focusedBorder: InputBorder.none,
            contentPadding: EdgeInsets.fromLTRB(15, 11, 15, 11),
            errorStyle: TextStyle(color: Colors.red),
            hintText: 'Password'),
        validator: (value) {
          if (value!.length < 5) {
            return 'Password must be at least 5 character';
          } else {
            return null;
          }
        },
        onSaved: (newValue) {
          password = newValue!;
        },
      ),
    );
  }

  Container emailTexField(BuildContext context) {
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
          email = newValue!;
        },
      ),
    );
  }
}
