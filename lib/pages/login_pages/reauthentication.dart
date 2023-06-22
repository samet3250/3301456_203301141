import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:my_news_app/firebase_firestore/firebase_firestore_func.dart';
import 'package:my_news_app/pages/home_pages/home.dart';


class ReauthenticateAndDelete extends StatefulWidget {
  ReauthenticateAndDelete({super.key});

  @override
  State<ReauthenticateAndDelete> createState() =>
      _ReauthenticateAndDeleteState();
}

class _ReauthenticateAndDeleteState extends State<ReauthenticateAndDelete> {
  late String password;
  

  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  late FirebaseAuth auth;
  late FirebaseFirestore firestore;
  late bool _passwordVisible;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    auth = FirebaseAuth.instance;
    firestore = FirebaseFirestore.instance;
    _passwordVisible=false;
    auth.authStateChanges().listen((User? user) {
      if (user == null) {
        debugPrint('User oturumu kapali');
      } else {
        debugPrint('User oturum acik ${user.email} ');
      }
    });
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
              child: ParolaTextField(context)),
          SizedBox(
            height: 15,
          ),
          navButton(context),
          SizedBox(
            height: 15,
          ),
          withContainer('assets/icons/google.png')
        ],
      ),
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
          FirebaseFirestoreFonk.googleIleGiris()
              .then((value) => FirebaseFirestoreFonk.FireBaseDelete(context));

          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => Home()));
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
            FocusManager.instance.primaryFocus?.unfocus();
            bool validate = formKey.currentState!.validate();
            if (validate) {
              formKey.currentState!.save();
              FirebaseFirestoreFonk.firebaseReauthenticateandDelete(
                   password, context);
                   
              formKey.currentState!.reset();
            }
          },
          child: Text('Verify',
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
              // Based on passwordVisible state choose the icon
               _passwordVisible
               ? Icons.visibility
               : Icons.visibility_off,
               color: Theme.of(context).primaryColorDark,
               ),
            onPressed: () {
               // Update the state i.e. toogle the state of passwordVisible variable
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
  
}
