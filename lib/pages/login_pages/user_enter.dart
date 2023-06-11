// ignore_for_file: unused_local_variable

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:my_news_app/model/firebase_firestore.dart';
import 'package:my_news_app/pages/login_pages/forget_password.dart';
import 'package:my_news_app/pages/login_pages/register_page.dart';
import 'package:twitter_login/twitter_login.dart';

import '../home_pages/home.dart';

class userEnter extends StatefulWidget {
  userEnter({super.key});

  @override
  State<userEnter> createState() => _userEnterState();
}

class _userEnterState extends State<userEnter> {
  late String email , password ;

  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  late FirebaseAuth auth;
  late FirebaseFirestore firestore;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    auth=FirebaseAuth.instance;
    firestore=FirebaseFirestore.instance;
        auth.authStateChanges().listen((User? user) {
      if (user == null) {
        debugPrint('User oturumu kapalı');
      } else {
        debugPrint(
            'User oturum açık ${user.email} ');
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset : false,
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
  Expanded DontHaveAnAccount(){
                                        return Expanded(
                                      child: Container(
                                      margin: EdgeInsets.only(bottom: 10),  
                                      alignment: Alignment.bottomCenter,
                                       child: TextButton(child: Text("Don't have an account? Register here.",style: TextStyle(fontFamily: "Montserrat",color: Colors.black87)),onPressed: () {              
                                         Navigator.of(context)
                                       .push(MaterialPageRoute(builder: (context) => RegisterPage()));} ,),
                                                                       ),
                                    );
  }
  TextButton ForgotMyPassword(){
    return                     TextButton(child: Text("Forgot your password?",style: TextStyle(fontFamily: "Montserrat",color: Colors.black87),),onPressed: () {              
                                         Navigator.of(context)
                                       .push(MaterialPageRoute(builder: (context) => forgetPassword()));} ,);
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
              loginUserEmailAndPassword();
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



  void loginUserEmailAndPassword() async {
    try {
      var _userCredential = await auth.signInWithEmailAndPassword(
          email: email, password: password);
          
                    Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => Home()));    
      debugPrint(_userCredential.toString());
    } catch (e) {
      
                              SnackBar snackBar = SnackBar(
                           dismissDirection: DismissDirection.none,
                           
                          
                          duration: Duration(seconds: 2),
                          backgroundColor: Colors.transparent,
                          elevation: 0,
                          content: Card(
                            
                            shadowColor: Colors.black,
                            elevation: 5,
                            child: Container(
                              padding: EdgeInsets.all(5),
                              height: 70,
                              width: MediaQuery.of(context).size.width,
                              decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(12))),
                              child: Center(
                                child: Text(
                                  "There is no user like that,check your e-mail or password",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontFamily: 'Monserrat',
                                      fontSize: 18,
                                      fontWeight: FontWeight.w400),
                                ),
                              ),
                            ),
                          ),
                        );

                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }

 

  void deleteUser() async {
    if (auth.currentUser != null) {
      await auth.currentUser!.delete();
    } else {
      debugPrint('Kullanıcı oturum açmadığı için silinemez');
    }
  }

  

  
  

}
