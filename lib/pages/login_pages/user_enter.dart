import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:my_news_app/firebase_firestore/firebase_firestore_func.dart';
import 'package:my_news_app/pages/login_pages/forget_password.dart';
import 'package:my_news_app/pages/login_pages/register_page.dart';

class userEnter extends StatefulWidget {
  userEnter({super.key});

  @override
  State<userEnter> createState() => _userEnterState();
}

class _userEnterState extends State<userEnter> {
  late String email, password;

  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  late FirebaseAuth auth;
  late FirebaseFirestore firestore;
  bool _passwordVisible = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    auth = FirebaseAuth.instance;
    firestore = FirebaseFirestore.instance;


  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
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
                ],
              )),
          navButton(context),
          ForgotMyPassword(),
          DontHaveAnAccount()
        ],
      ),
    );
  }

  Expanded DontHaveAnAccount() {
    return Expanded(
      child: Container(
        margin: EdgeInsets.only(bottom: 10),
        alignment: Alignment.bottomCenter,
        child: TextButton(
          child: Text("Don't have an account? Register here.",
              style:
                  TextStyle(fontFamily: "Montserrat", color: Colors.black87)),
          onPressed: () {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => RegisterPage()));
          },
        ),
      ),
    );
  }

  TextButton ForgotMyPassword() {
    return TextButton(
      child: Text(
        "Forgot your password?",
        style: TextStyle(fontFamily: "Montserrat", color: Colors.black87),
      ),
      onPressed: () {
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => forgetPassword()));
      },
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
            FocusManager.instance.primaryFocus?.unfocus();
            bool validate = formKey.currentState!.validate();
            if (validate) {
              formKey.currentState!.save();
              FirebaseFirestoreFonk.SignInUserEmailAndPassword(
                  email, password, context);
              formKey.currentState!.reset();
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
        keyboardType: TextInputType.text,
        obscureText: !_passwordVisible,
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          enabledBorder: InputBorder.none,
          focusedBorder: InputBorder.none,
          contentPadding: EdgeInsets.fromLTRB(15, 11, 15, 11),
          errorStyle: TextStyle(color: Colors.red),
          hintText: 'Password',
          suffixIcon: IconButton(
            icon: Icon(
              _passwordVisible ? Icons.visibility : Icons.visibility_off,
              color: Theme.of(context).primaryColorDark,
            ),
            onPressed: () {
              setState(() {
                _passwordVisible = !_passwordVisible;
              });
            },
          ),
        ),
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
