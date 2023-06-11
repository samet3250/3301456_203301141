import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:my_news_app/pages/home_pages/home.dart';
import 'package:my_news_app/pages/login_pages/user_enterwith.dart';
import 'package:settings_ui/settings_ui.dart';

var box2=Hive.box("category");
var box3=Hive.box("language");
var box4=Hive.box("color");
List<String> list = <String>['turkey', 'france', 'united-kingdom', 'india'];
List<String> list2 = <String>['tr', 'de', 'es', 'fr'];
List<String> list3 = <String>["red","amber","cyan","teal"];


class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  String dropdownValue1 = list.first;
  String dropdownValue2 = list.first;
    late FirebaseAuth auth;
  late FirebaseFirestore firestore;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
       firestore=FirebaseFirestore.instance;
    auth=FirebaseAuth.instance;
  }
  @override
  Widget build(BuildContext context) {
    return     Scaffold(
              appBar: AppBar(
            backgroundColor:appbarColor(),
            elevation: 2,
            automaticallyImplyLeading: false,
            titleSpacing: 0,
            title: Builder(
              builder: (context) => Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 8),
                    child: IconButton(
                        onPressed: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) => Home(),)),
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
      body: SettingsList(
        sections: [
          SettingsSection(
            title: Text('Common'),
            tiles: <SettingsTile>[
              SettingsTile.navigation(
                leading: Icon(Icons.language),
                title: Text('Language'),
                value: Text(languages()),
                trailing: DropdownButton<String>(
                          //value: dropdownValue,
                          // hint: Text("translate to:"),
                          icon: const Icon(Icons.more_vert),
    
                          elevation: 16,
                          style: const TextStyle(color: Colors.deepPurple),
                          underline: Container(
                            height: 0,
                            color: Colors.deepPurpleAccent,
                          ),
                          onChanged: (String? value)
                            // This is called when the user selects an item.
                            async {
                              dropdownValue2 = value!;
                              await box3.put("lan", value);
                              fireStoreVeriGuncelle();
                              setState(() {
                                
                              });
                            
                          },
                          items: list2.map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                        ),
              ),
              SettingsTile.navigation(
                leading: Icon(Icons.location_on_outlined),
                title: Text('Location'),
                value: Text(box2.get("cat").toString().replaceFirst(box2.get("cat").toString()[0], box2.get("cat").toString()[0].toUpperCase())),
                trailing: DropdownButton<String>(
                          //value: dropdownValue,
                          // hint: Text("choose"),
                          icon: const Icon(Icons.more_vert),
                          elevation: 16,
                          style: const TextStyle(color: Colors.deepPurple),
                          underline: Container(
                            height: 0,
                            color: Colors.deepPurpleAccent,
                          ),
                          onChanged: (String? value)async{
                            // This is called when the user selects an item.
                             
                              dropdownValue1 = value!;
                              await box2.put("cat", value);
                              setState(() {
                                
                              });
                            
                          },
                          items: list.map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                        ),
              ),
    SettingsTile.navigation(
                leading: Icon(Icons.format_paint),
                title: Text('Color'),
                value: Text(box4.get("color").toString().replaceFirst(box4.get("color").toString()[0],box4.get("color").toString()[0].toUpperCase())),
                trailing: DropdownButton<String>(
                          //value: dropdownValue,
                          // hint: Text("choose"),
                          icon: const Icon(Icons.more_vert),
                          elevation: 16,
                          style: const TextStyle(color: Colors.deepPurple),
                          underline: Container(
                            height: 0,
                            color: Colors.deepPurpleAccent,
                          ),
                          onChanged: (String? value)async{
                            // This is called when the user selects an item.
                             
                              // dropdownValue1 = value!;
                              await box4.put("color", value);
                              setState(() {
                                
                              });
                            
                          },
                          items: list3.map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                        ),
              ),
              
            ],
          ),
                  SettingsSection(
          title: Text('Account'),
          tiles: <SettingsTile>[
            SettingsTile.navigation(
              leading: Icon(Icons.person),
              title: Text('Delete Account'),
              value: Text(auth.currentUser!.email.toString()),
              trailing: GestureDetector(
                onTap: () {
                  
                 
                  FireBaseDelete().then((value) {FireStoreDelete(value);});
                  
                },
                child: Icon(Icons.delete),
              ),
            ),

          ],
        ),
        ],
      ),
    );
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
  {print(auth.currentUser!.uid);
     await firestore.doc("users/${auth.currentUser!.uid}").update({"lan":"tr"});
  }

  

}
languages(){

 switch (box3.get("lan")) {
   case "tr":return "Turkish";
   case "de":return "German";
   case "es":return "Spanish";
   case "fr":return "French";
     
     
   default: return "Turkish";
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
  Color appbarColor(){
switch (box4.get("color")) {
  case "red": return Colors.red.shade400;
  case "amber": return Colors.amber;
  case "cyan": return Colors.cyan;
  case "teal": return Colors.teal;
    
    
  default: return Colors.red.shade400;
}
  }

      Future<String> FireBaseDelete()async{
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
var uid=auth.currentUser!.uid;

if(_myUser!=null)

  {
    
      await auth.currentUser!.delete();
  }
  return uid;

  

}
      Future<void> FireStoreDelete(String uid)async{



  
      await firestore.doc("users/${uid}").delete();
      

  Navigator.of(context).push(MaterialPageRoute(builder: (context) => userEnterWith()));

  
  

}
}