import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:my_news_app/provider/path_provider.dart';
import 'package:my_news_app/pages/home_pages/home.dart';
import 'package:my_news_app/pages/login_pages/reauthentication.dart';
import 'package:my_news_app/pages/login_pages/user_enterwith.dart';
import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';

class FirebaseFirestoreFonk {
  static FirebaseAuth auth = FirebaseAuth.instance;
  static FirebaseFirestore firestore = FirebaseFirestore.instance;
  static PathProviderStorage storage = PathProviderStorage();

  static Future<void> googleIleGiris(
    BuildContext context,
    FirebaseAuth auth,
    FirebaseFirestore firestore,
  ) async {
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
    storage.write(googleUser!.displayName.toString());

    final GoogleSignInAuthentication? googleAuth =
        await googleUser.authentication;

    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    var _user = await FirebaseAuth.instance.signInWithCredential(credential);

    print(_user.user?.uid);
    var _myUser = _user.user;
    if (_myUser != null) {
      await firestore.collection('users').doc(_myUser.uid).set({
        "user_id": _myUser.uid,
        "user_name": googleUser.displayName.toString(),
        "user_gmail": googleUser.email.toString(),
        "createdAt": FieldValue.serverTimestamp()
      });
    }
  }

// ------------------------------------------------------------------------------------------------------------
  static Future<void> FireBaseDelete(BuildContext context) async {
    try {
      var _myUser = auth.currentUser;
      var uid = auth.currentUser!.uid;

      if (_myUser != null) {
        await auth.currentUser!.delete();
      }
      FireStoreDelete(uid, context);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'requires-recent-login') {
        debugPrint('reauthenticate olunacak');
        Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => ReauthenticateAndDelete()));
      }
    }
  }
// ------------------------------------------------------------------------------------------------------------

  static Future<void> firebaseReauthenticateandDelete(
      String password_, BuildContext context) async {
    try {
      var credential = EmailAuthProvider.credential(
          email: auth.currentUser!.email.toString(), password: password_);
      await auth.currentUser!.reauthenticateWithCredential(credential);

      await auth.currentUser!.delete();
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => userEnterWith()));
    } catch (e) {
      SnackBar snackBar = SnackBar(
        dismissDirection: DismissDirection.none,
        duration: Duration(seconds: 2),
        backgroundColor: Colors.transparent,
        elevation: 0,
        behavior: SnackBarBehavior.floating,
        content: AwesomeSnackbarContent(
          title: 'Warning!',
          message: "Wrong Password!",
          contentType: ContentType.failure,
        ),
      );

      ScaffoldMessenger.of(context).showSnackBar(snackBar);
      Future.delayed(Duration(seconds: 2))
          .then((value) => Navigator.of(context).pop());
    }
  }
// ------------------------------------------------------------------------------------------------------------

  static Future<void> FireStoreDelete(String uid, BuildContext context) async {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => userEnterWith()));
    await firestore.doc("users/${uid}").delete();
  }
// ------------------------------------------------------------------------------------------------------------

  static void fireStoreVeriGuncelle() async {
    var _myUser = auth.currentUser;
    if (_myUser != null) {
      print(auth.currentUser!.uid);
      await firestore
          .doc("users/${auth.currentUser!.uid}")
          .update({"lan": "tr"});
    }
  }
// ------------------------------------------------------------------------------------------------------------

  static void forgot_password(String e_mail, BuildContext context) async {
    await auth.sendPasswordResetEmail(email: e_mail);
  }
// ------------------------------------------------------------------------------------------------------------

  static Future<void> FirebaseCreateuserandemail(String e_mail, String password_,
      String name, BuildContext context) async {
    try {
Future(() async {
        var _userCredential = await auth.createUserWithEmailAndPassword(
          email: e_mail, password: password_);
      var _myUser = _userCredential.user;
      if (_myUser != null) {
        await firestore.collection('users').doc(auth.currentUser?.uid).set({
          "user_id": auth.currentUser?.uid,
          "user_name": name,
          "user_gmail": auth.currentUser!.email,
          "createdAt": FieldValue.serverTimestamp()
        });
      }
      // if (!_myUser!.emailVerified) {
      //   await _myUser.sendEmailVerification();
      // } else {
      //   debugPrint('kullanicin maili onaylanmis');
      // }
      
      storage.write(name);
}).then((value) => Navigator.of(context).pop());
      
    } on FirebaseAuthException catch (e) {
      if (e.code == 'email-already-in-use') {
        SnackBar snackBar = SnackBar(
          dismissDirection: DismissDirection.none,
          duration: Duration(seconds: 2),
          backgroundColor: Colors.transparent,
          elevation: 0,
          behavior: SnackBarBehavior.floating,
          content: AwesomeSnackbarContent(
            title: 'Warning!',
            message: "E-mail already in use , Try  with another one",
            contentType: ContentType.failure,
          ),
        );

        ScaffoldMessenger.of(context).showSnackBar(snackBar);
        Future.delayed(Duration(seconds: 2));
      }
    }
  }
// ------------------------------------------------------------------------------------------------------------

  static void SignInUserEmailAndPassword(
      String email, String password, BuildContext context) async {
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
        behavior: SnackBarBehavior.floating,
        content: AwesomeSnackbarContent(
          title: 'Warning!',
          message: "There is no user like that,check your e-mail or password",
          contentType: ContentType.failure,
        ),
      );

      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }
// ------------------------------------------------------------------------------------------------------------

  static void signOutUser() async {
    var _user = GoogleSignIn().currentUser;
    if (_user != null) {
      await GoogleSignIn().signOut();
    }
    await auth.signOut();
  }
}
