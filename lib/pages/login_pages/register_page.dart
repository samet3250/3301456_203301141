

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:my_news_app/model/path_provider.dart';
import 'package:path_provider/path_provider.dart';


class RegisterPage extends StatefulWidget {
   RegisterPage({super.key});
   CounterStorage storage=CounterStorage();
  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
    String e_mail="", password_="";
    String passwordagain="",name="",surname="";
    
    
  GlobalKey<FormState> formKey2 = GlobalKey<FormState>();

  GlobalKey<FormState> formKey3 = GlobalKey<FormState>();

  GlobalKey<FormState> formKey4 = GlobalKey<FormState>();
  late FirebaseAuth auth;
  late FirebaseFirestore firestore;
  
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    auth=FirebaseAuth.instance;
    firestore=FirebaseFirestore.instance;
   
    
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
              width: 90,
              height: 90,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/news.png'), fit: BoxFit.cover)),
            ),
          ),
          
                    Form(
              key: formKey2,
              //autovalidateMode: AutovalidateMode.onUserInteraction,
              child: Column(
                children: [
/*                   first_name(context),
                  SizedBox(height: 10),
                  surname_(context),
                  SizedBox(
                    height: 10,
                  ), */
                  first_name(context),
                   SizedBox(height: 10),
                   surname_(context),
                  SizedBox(height: 10),

                  e_maill(context),
                  SizedBox(height: 10),
                 


                  
   
                ],
                
              )),
              Form(
                key: formKey3,
                child:Parola(context)),
              Form(
                key: formKey4,
                child: Column(
                children: [
                    SizedBox(height: 10),
                    Parola_control(context),
                    SizedBox(height: 10),
                    createButton(context)
                ],
              )),
          
          
          ]));
  }

Container createButton(BuildContext context) {
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
            bool validate = formKey2.currentState!.validate();
            bool validate2 = formKey3.currentState!.validate();
            bool validate3 = formKey4.currentState!.validate();

            if (validate &&validate2&&validate3) {
              formKey2.currentState!.save();
              formKey3.currentState!.save();
  
              widget.storage.writeCounter(name+' '+surname);  
              createuserandemail();
              // fireStoreVeriEKle();
              // fireStoreVeriGuncelle();
              formKey2.currentState!.reset();
              formKey3.currentState!.reset();
              formKey4.currentState!.reset();
              Navigator.of(context)
                  .pop();
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
          password_ = value;

            return null;
          }
        },

        onSaved: (newValue) {
          password_ = newValue!;
          
        },
      ),
    );
  }

  Container Parola_control(BuildContext context) {
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
            hintText: 'Password again'),
        validator: (value) {
          if(formKey3.currentState!.validate()){
            formKey3.currentState!.save();
          }
          if (value!= password_) {
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

   Container first_name(BuildContext context) {
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

  Container surname_(BuildContext context) {
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

  Container e_maill(BuildContext context) {
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
    void createuserandemail()async{
    try {
      var _userCredential = await auth.createUserWithEmailAndPassword(
          email: e_mail, password: password_);
      var _myUser = _userCredential.user;
      if(_myUser!=null){
              await firestore.collection('users').doc(auth.currentUser?.uid).set({
  "user_id":auth.currentUser?.uid,
  "user_name":name
});
      }
      if (!_myUser!.emailVerified) {
        await _myUser.sendEmailVerification();
        
      } else {
        debugPrint('kullanicin maili onaylanmiş');
      }

      // debugPrint(_userCredential.toString());
    } catch (e) {
      debugPrint(e.toString());
    }
  }
  void fireStoreVeriGuncelle()async{
//  await firestore.collection('users').doc(auth.currentUser!.uid).update({"name":"turki"});
// var _users=await firestore.collection('users').get();

// for (var eleman in _users.docs)   {
//   Map userMap=eleman.data();
//   print(userMap["name"]);
// //   if(userMap['e_mail']==e_mail){
// // // await firestore.doc(eleman.id).update({"lan":"tr"});
// //   }
// }
  print("oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo");

var _myUser=auth.currentUser;
if(_myUser!=null)
  {print("uuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuu");
    await firestore.doc(auth.currentUser!.uid).update({"lan":"tr"});
  }
  

}
        
fireStoreVeriEKle()async{
  Map<String,dynamic>_eklenecekUser={};
  _eklenecekUser["name"]=name;
  _eklenecekUser["surname"]=surname;
  _eklenecekUser["e_mail"]=e_mail;
  _eklenecekUser["id"]=
  _eklenecekUser["createdAt"]=FieldValue.serverTimestamp();
  
await firestore.collection('users').doc(auth.currentUser?.uid).set({
  "user_id":auth.currentUser?.uid,
  "user_name":name
});
print("heyeeeeeeeeee");

}

}

