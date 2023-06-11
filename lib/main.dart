import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:my_news_app/firebase_options.dart';
import 'package:my_news_app/pages/home_pages/home.dart';
import 'package:my_news_app/pages/login_pages/user_enterwith.dart';
import 'model/news_model.dart';

main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await Hive.initFlutter("news_App");
  Hive.registerAdapter(newsAdapter());
  await Hive.openBox<news>("News_all");
  await Hive.openBox("category");
  await Hive.openBox("language");
  await Hive.openBox("color");

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late FirebaseAuth auth;
  @override
  void initState() {
    super.initState();
    auth = FirebaseAuth.instance;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false, 
        home: AreYouSignIn());
  }

  Widget AreYouSignIn() {
    var user = auth.currentUser;

    if (user == null) {
      return userEnterWith();
    } else {
      return Home();
    }
  }
}
