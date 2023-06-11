import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:my_news_app/model/path_provider.dart';

class FirebaseFirestoreFonk {
    static void googleIleGiris(BuildContext context,FirebaseAuth auth,FirebaseFirestore firestore,Widget GoTo) async {

        CounterStorage storage=CounterStorage();
        final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
    print(googleUser!.displayName.toString());
    print(googleUser.email.toString());
    
    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
       

    );


     
    // Once signed in, return the UserCredential
    var _user= await FirebaseAuth.instance.signInWithCredential(credential);

    print(_user.user?.uid);
    var _myUser=_user.user;
          if(_myUser!=null){
              await firestore.collection('users').doc(_myUser.uid).set({
  "user_id":auth.currentUser?.uid,
  "user_name":googleUser!.displayName.toString(),
  "user_gmail":googleUser!.email,
  "createdAt":FieldValue.serverTimestamp()
});}

storage.writeCounter(googleUser!.displayName.toString());
       Navigator.of(context)
                                       .push(MaterialPageRoute(builder: (context) =>GoTo));
  }
}