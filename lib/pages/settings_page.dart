import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:my_news_app/firebase_firestore/firebase_firestore_func.dart';
import 'package:my_news_app/pages/home_pages/home.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  var box2 = Hive.box("category");
  var box3 = Hive.box("language");
  var box4 = Hive.box("color");
  List<String> list = <String>['turkey', 'france', 'united-kingdom', 'india'];
  List<String> list2 = <String>['tr', 'de', 'es', 'fr'];
  List<String> list3 = <String>["red", "amber", "cyan", "teal"];

  FirebaseAuth auth = FirebaseAuth.instance;
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: appbarColor(),
          elevation: 2,
          automaticallyImplyLeading: false,
          titleSpacing: 0,
          title: Builder(
            builder: (context) => Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 8),
                  child: IconButton(
                      onPressed: () =>
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => Home(),
                          )),
                      icon: Image.asset(
                        'assets/icons/back2.png',
                        height: 20,
                        width: 20,
                        color: Colors.white,
                      )),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      harf("O"),
                      SizedBox(
                        width: 2,
                      ),
                      harf("N"),
                      SizedBox(
                        width: 2,
                      ),
                      harf("E"),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        "News",
                        style: TextStyle(
                            fontFamily: "Times",
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      )
                    ],
                  ),
                ),
              ],
            ),
          )),
      body: Column(
        children: [
          Padding(
              padding: EdgeInsets.only(left: 10, top: 5),
              child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Common",
                    style: TextStyle(fontFamily: "Montserrat", fontSize: 14),
                  ))),
          SizedBox(
            height: 10,
          ),
          Card(
            elevation: 5,
            child: ListTile(
              leading: Icon(Icons.language),
              title: Text('Language'),
              subtitle: Text(languages()),
              trailing: DropdownButton<String>(
                icon: const Icon(
                  Icons.more_vert,
                  color: Colors.black,
                ),
                elevation: 16,
                style: const TextStyle(color: Colors.deepPurple),
                underline: Container(
                  height: 0,
                  color: Colors.deepPurpleAccent,
                ),
                onChanged: (String? value) async {
                  await box3.put("lan", value);
                  FirebaseFirestoreFonk.fireStoreVeriGuncelle();
                  setState(() {});
                },
                items: list2.map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
            ),
          ),
          Card(
            elevation: 5,
            child: ListTile(
              leading: Icon(Icons.location_on_outlined),
              title: Text('Location'),
              subtitle: Text(box2.get("cat").toString().replaceFirst(
                  box2.get("cat").toString()[0],
                  box2.get("cat").toString()[0].toUpperCase())),
              trailing: DropdownButton<String>(
                icon: const Icon(Icons.more_vert),
                elevation: 16,
                style: const TextStyle(color: Colors.deepPurple),
                underline: Container(
                  height: 0,
                  color: Colors.deepPurpleAccent,
                ),
                onChanged: (String? value) async {
                  await box2.put("cat", value);
                  setState(() {});
                },
                items: list.map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
            ),
          ),
          Card(
            elevation: 5,
            child: ListTile(
              leading: Icon(Icons.format_paint),
              title: Text('Color'),
              subtitle: Text(box4.get("color").toString().replaceFirst(
                  box4.get("color").toString()[0],
                  box4.get("color").toString()[0].toUpperCase())),
              trailing: DropdownButton<String>(
                icon: const Icon(Icons.more_vert),
                elevation: 16,
                style: const TextStyle(color: Colors.deepPurple),
                underline: Container(
                  height: 0,
                  color: Colors.deepPurpleAccent,
                ),
                onChanged: (String? value) async {
                  await box4.put("color", value);
                  setState(() {});
                },
                items: list3.map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
            ),
          ),
          Padding(
              padding: EdgeInsets.only(left: 10),
              child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Account",
                    style: TextStyle(fontFamily: "Montserrat"),
                  ))),
          SizedBox(
            height: 10,
          ),
          Card(
            elevation: 5,
            child: ListTile(
              leading: Icon(Icons.person),
              title: Text('Delete Account'),
              subtitle: Text(auth.currentUser!.email.toString()),
              trailing: GestureDetector(
                onTap: () {
                  FirebaseFirestoreFonk.FireBaseDelete(context);
                },
                child: Icon(Icons.delete),
              ),
            ),
          ),
        ],
      ),
    );
  }

  languages() {
    switch (box3.get("lan")) {
      case "tr":
        return "Turkish";
      case "de":
        return "German";
      case "es":
        return "Spanish";
      case "fr":
        return "French";

      default:
        return "Turkish";
    }
  }

  Container harf(String harf) {
    return Container(
        height: 25,
        width: 27,
        decoration: BoxDecoration(
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
        child: Text(
          harf,
          style: TextStyle(
              fontFamily: "Times",
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.black),
        ));
  }

  Color appbarColor() {
    switch (box4.get("color")) {
      case "red":
        return Colors.red.shade400;
      case "amber":
        return Colors.amber;
      case "cyan":
        return Colors.cyan;
      case "teal":
        return Colors.teal;

      default:
        return Colors.red.shade400;
    }
  }
}
