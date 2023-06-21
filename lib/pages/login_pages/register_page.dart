import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:my_news_app/firebase_firestore/firebase_firestore_func.dart';
import 'package:my_news_app/provider/path_provider.dart';

class RegisterPage extends StatefulWidget {
  RegisterPage({super.key});
  PathProviderStorage storage = PathProviderStorage();
  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  String e_mail = "",
      password_ = "",
      passwordagain = "",
      name = "",
      surname = "";

  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  GlobalKey<FormState> formKey2 = GlobalKey<FormState>();
  GlobalKey<FormState> formKey3 = GlobalKey<FormState>();
  late FirebaseAuth auth;
  late FirebaseFirestore firestore;
  late bool _passwordVisible;
  late bool _passwordVisible2;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    auth = FirebaseAuth.instance;
    firestore = FirebaseFirestore.instance;
    _passwordVisible = false;
    _passwordVisible2 = false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
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
              //autovalidateMode: AutovalidateMode.onUserInteraction,
              child: Column(
                children: [
                  firstName(context),
                  SizedBox(height: 10),
                  Surname(context),
                  SizedBox(height: 10),
                  GetEmail(context),
                  SizedBox(height: 10),
                ],
              )),
          Form(key: formKey2, child: Parola(context)),
          Form(
              key: formKey3,
              child: Column(
                children: [
                  SizedBox(height: 10),
                  ParolaControl(context),
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
          onPressed: () async {
            bool validate = formKey.currentState!.validate();
            bool validate2 = formKey2.currentState!.validate();
            bool validate3 = formKey3.currentState!.validate();

            if (validate && validate2 && validate3) {
              formKey.currentState!.save();
              formKey2.currentState!.save();

              FirebaseFirestoreFonk.FirebaseCreateuserandemail(
                  e_mail, password_, name + " " + surname, context);
                  Future.delayed(Duration(seconds: 1)).then((value) =>  Navigator.of(context).pop());
              
              formKey.currentState!.reset();
              formKey2.currentState!.reset();
              formKey3.currentState!.reset();
            }
          },
          child: Text('Create My Account',
              style: TextStyle(
                  fontFamily: 'Montserrat',
                  fontSize: 18,
                  fontWeight: FontWeight.w700)),
          style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
        ));
  }

  Container Parola(BuildContext context) {
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
          password_ = newValue!;
        },
      ),
    );
  }

  Container ParolaControl(BuildContext context) {
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
        keyboardType: TextInputType.text,
        obscureText: !_passwordVisible2,
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          enabledBorder: InputBorder.none,
          focusedBorder: InputBorder.none,
          contentPadding: EdgeInsets.fromLTRB(15, 11, 15, 11),
          errorStyle: TextStyle(color: Colors.red),
          hintText: 'Password again',
          suffixIcon: IconButton(
            icon: Icon(
              _passwordVisible2 ? Icons.visibility : Icons.visibility_off,
              color: Theme.of(context).primaryColorDark,
            ),
            onPressed: () {
              setState(() {
                _passwordVisible2 = !_passwordVisible2;
              });
            },
          ),
        ),
        validator: (value) {
          if (formKey2.currentState!.validate()) {
            formKey2.currentState!.save();
          }
          if (value != password_) {
            return 'Passwords are not same';
          } else {
            return null;
          }
        },
        onSaved: (newValue) {
          password_ = newValue!;
        },
      ),
    );
  }

  Container firstName(BuildContext context) {
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
            hintText: 'First Name'),
        validator: (value) {
          if (value!.length < 1) {
            return 'First Name cannot be left blank';
          } else {
            return null;
          }
        },
        onSaved: (newValue) {
          name = newValue!;
        },
      ),
    );
  }

  Container Surname(BuildContext context) {
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
            hintText: 'Surname'),
        validator: (value) {
          if (value!.length < 1) {
            return 'Surname cannot be left blank';
          } else {
            return null;
          }
        },
        onSaved: (newValue) {
          surname = newValue!;
        },
      ),
    );
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
