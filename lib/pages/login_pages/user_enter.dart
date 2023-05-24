// ignore_for_file: unused_local_variable

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:my_news_app/pages/login_pages/forget_password.dart';
import 'package:my_news_app/pages/login_pages/register_page.dart';

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
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    auth=FirebaseAuth.instance;

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
              child: Expanded(
                child: Column(
                  children: [
                    emailTexField(context),
                    SizedBox(height: 10),
                    ParolaTextField(context),
                    SizedBox(
                      height: 15,
                    ),
                    navButton(context),
                    TextButton(child: Text("forgot my password"),onPressed: () {              
                                         Navigator.of(context)
                                       .push(MaterialPageRoute(builder: (context) => forgetPassword()));} ,),
                                    Expanded(
                                      child: Container(
                                      margin: EdgeInsets.only(bottom: 15),  
                                      alignment: Alignment.bottomCenter,
                                       child: TextButton(child: Text("Don't have an account? Register here."),onPressed: () {              
                                         Navigator.of(context)
                                       .push(MaterialPageRoute(builder: (context) => RegisterPage()));} ,),
                                                                       ),
                                    )
                  ],
                  
                ),
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

            }
            loginUserEmailAndPassword();

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

  void createuserandemail()async{
    var _userCredential=await auth.createUserWithEmailAndPassword(email: email,password: password);
    print(_userCredential.toString());
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
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                    padding: EdgeInsets.only(left: 25),
                                    child: Text(
                                      e.toString(),
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontFamily: 'Monserrat',
                                          fontSize: 18,
                                          fontWeight: FontWeight.w400),
                                    )),
                                IconButton(
                                    onPressed: () {
                                      ScaffoldMessenger.of(context)
                                          .clearSnackBars();
                                    },
                                    icon: Image.asset(
                                      'assets/icons/back.png',
                                      color: Colors.black,
                                    ))
                              ],
                            ),
                          ),
                        );

                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }

  void signOutUser() async {

    await auth.signOut();
  }

  void deleteUser() async {
    if (auth.currentUser != null) {
      await auth.currentUser!.delete();
    } else {
      debugPrint('Kullanıcı oturum açmadığı için silinemez');
    }
  }

  void changePassword() async {
    try {
      await auth.currentUser!.updatePassword('password');
      await auth.signOut();
    } on FirebaseAuthException catch (e) {
      if (e.code == 'requires-recent-login') {
        debugPrint('reauthenticate olunacak');
        var credential =
            EmailAuthProvider.credential(email: email, password: password);
        await auth.currentUser!.reauthenticateWithCredential(credential);

        await auth.currentUser!.updatePassword('password');
        await auth.signOut();
        debugPrint('şifre güncellendi');
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}
