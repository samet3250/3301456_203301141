
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:google_sign_in/google_sign_in.dart';
import 'package:hive/hive.dart';

import 'package:my_news_app/model/location.dart';
import 'package:my_news_app/model/path_provider.dart';
import 'package:my_news_app/model/weather.dart';
import 'package:my_news_app/pages/bookmark_page.dart';
import 'package:my_news_app/pages/home_pages/home_tabbar_pages.dart';

import 'package:my_news_app/pages/login_pages/user_enterwith.dart';
import 'package:my_news_app/pages/search_page.dart';
import 'package:my_news_app/pages/settings_page.dart';

import 'package:shimmer/shimmer.dart';

String? local2;
var box2=Hive.box("category");
var box3=Hive.box("language");
List<String> list = <String>['turkey', 'france', 'united-kingdom', 'india'];
List<String> list2 = <String>['tr', 'de', 'es', 'fr'];

class Home extends StatefulWidget {
   Home({super.key});
CounterStorage storage=CounterStorage();
 String ff="User";
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int currentIndex = 0;
  late List bottonNavBarPages;
  late FirebaseAuth auth;
  late FirebaseFirestore firestore;
  var locationData=LocationHelper();
  WeatherData weatherData=WeatherData();


  @override
  void initState() {
    //TODO: implement initState
    super.initState();

    bottonNavBarPages = [HomeTabbarPages(), SearchPage(), Bookmark()];
    widget.storage.readCounter().then((value) {setState(() {
      List<String> ad_soyad=value.split(" ");
      String gecici="";
      for (var i = 0; i < ad_soyad.length; i++) {
        gecici += ad_soyad[i].replaceAll(ad_soyad[i][0],ad_soyad[i][0].toUpperCase() )+" ";
      }
 /*      locationData.getCurrentLocation().then((value) {
    if(locationData.latitude!=null && locationData.longitude!=null){
      WeatherData WEATHER=WeatherData(lon: locationData.longitude,lat: locationData.latitude);
      weatherData=WEATHER;
      WEATHER.getWeatherElements();
    }
    else{
      WeatherData NULLWEATHER=WeatherData();
      
      print("null değer");
    }

    }); */
      widget.ff =gecici;
      
      
    });});
   firestore=FirebaseFirestore.instance;
    auth=FirebaseAuth.instance;

    
  }
  String dropdownValue1 = list.first;
  String dropdownValue2 = list.first;
  @override
  Widget build(BuildContext context) {

    return Scaffold(
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
                        onPressed: () => Scaffold.of(context).openDrawer(),
                        icon: Image.asset(
                          'assets/icons/drawer.jpg',
                          height: 35,
                          width: 35,
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
        body: bottonNavBarPages[currentIndex],
        drawer: createDrawer(context),
        bottomNavigationBar: createBottomNavBar());
  }
  Color appbarColor(){
switch (box4.get("color").toString()) {
  case "red": return Colors.red.shade400;
  case "amber": return Colors.amber;
  case "cyan": return Colors.cyan;
  case "teal": return Colors.teal;
    
    
  default: 
  
  return Colors.red.shade400;
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

  Drawer createDrawer(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          SizedBox(
            height: 30,
          ),
          DrawerHeader(
            child: Align(
              alignment: Alignment.center,
              child: Container(
                height: 140,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    color: Colors.transparent,
                    image: DecorationImage(
                        image: AssetImage('assets/news.png'),
                        fit: BoxFit.cover)),
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
           FutureBuilder(
            future:  fonn()            
            
            ,builder: (BuildContext context, AsyncSnapshot snapshot) {
              if(snapshot.hasData){
                var data=snapshot.data;
                if(data[0]!=""){
                  return ListTile(
                    leading: DateTime.now().hour<=19?
          Image.asset("assets/cloudy.png",fit: BoxFit.contain)
        
        
        
      :Image.asset("assets/night.png",fit: BoxFit.contain,height: 40,width: 40,),
                    title: Padding(padding: EdgeInsets.only(left: 8),child: Text(data[0],style: TextStyle(fontFamily: "Montserrat" ))),
                    subtitle: Padding(padding: EdgeInsets.only(left: 8),child: Text(data[2],style: TextStyle(fontFamily: "Montserrat" ))),
                    trailing: Text(data[1],style: TextStyle(fontSize:30,decorationThickness: 2,fontFamily: "Montserrat" ),),
                  );
                }
                else{
                  return SizedBox(height: 0,);
                }
              }
              else if(snapshot.hasError){
                return SizedBox(height: 0,);//Text("Bu bir hava durumu uygulamasi geolocator paketini kullaniyor ,emulatörde çalişiyor ancak webde çalişmiyor");

              }
              else{
                return   Shimmer.fromColors(child: SingleChildScrollView(
                  child: Padding(
        padding: const EdgeInsets.only(top: 8, left: 15, right: 15, bottom: 4),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
          schimmerAnimationBox(),
          
            
          ],
        ),
      ),
                )
                , baseColor: Colors.grey.shade300, highlightColor: Colors.grey.shade100,
                ) ;
              }
            },
          ),
          ListTile(
            leading: CircleAvatar(child:Text(widget.ff.toUpperCase()[0],style: TextStyle(color: Colors.white),) ),
            title: Text(widget.ff),
            subtitle: GestureDetector(
              onTap: () {
                
              signOutUser();
            Navigator.of(context).push(MaterialPageRoute(builder: (context) => userEnterWith()));
              },
              
              child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: const [SizedBox(height: 4),Text("SIGN OUT"),],)),
            trailing: IconButton(icon: Icon(Icons.settings,color: Colors.black,),onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => SettingsPage()));
            },) ,
          ),
          
      
          
         
        
         
          
          Expanded(
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                color: Colors.black,
                height: 65,
                width: double.infinity,
                child: Center(
                  child: Text(
                    'v1.3.7',
                    style: TextStyle(
                        fontFamily: 'Montserrat',
                        fontSize: 20,
                        color: Colors.white),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  BottomNavigationBar createBottomNavBar() {
    return BottomNavigationBar(
        currentIndex: currentIndex,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.black.withOpacity(0.5),
        onTap: (index) => setState((){
          currentIndex = index;
          
        }),
        items: [
          BottomNavigationBarItem(
              icon: Padding(
                padding: const EdgeInsets.only(left: 40),
                child:
                    Image.asset('assets/icons/home.png', width: 24, height: 24),
              ),
              label: 'Home'),

          
          BottomNavigationBarItem(
              icon:
                  Image.asset('assets/icons/search.png', width: 21, height: 21),
              label: 'Search'),

          
          BottomNavigationBarItem(
              icon: Padding(
                padding: const EdgeInsets.only(right: 40),
                child: Image.asset('assets/icons/bookmark.png',
                    width: 21, height: 21),
              ),
              label: 'Bookmark'),

          
        ]);
  }
    void signOutUser() async {
        var _user=GoogleSignIn().currentUser;
  if(_user!=null){
   await GoogleSignIn().signOut();
  }
    await auth.signOut();
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
    void fireStoreDelete()async{
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
     await firestore.doc("users/${auth.currentUser!.uid}").delete();
     await _myUser.delete();
  }

  Navigator.of(context).push(MaterialPageRoute(builder: (context) => userEnterWith()));
  

}

  Future<List<String>> fonn()async{
  await locationData.getCurrentLocation();
  if(locationData.latitude!=null && locationData.longitude!=null){
      WeatherData WEATHER=WeatherData(lon: locationData.longitude,lat: locationData.latitude);
      weatherData=WEATHER;
      await WEATHER.getWeatherElements();
      return [WEATHER.city,WEATHER.degree,WEATHER.state];
    }
    else{
      // WeatherData NULLWEATHER=WeatherData();
      return ["","",""];
      
    }


  }
}

schimmerAnimationBox() {
  return ListTile(
    leading: Container(height: 40,width: 40,color:Colors.grey.shade300),
    title :Container(height: 15,width: 40,color:Colors.grey.shade300),
    subtitle: Container(height: 15,width: 40,color:Colors.grey.shade300),
    trailing: Container(height: 35,width: 25,color:Colors.grey.shade300),

  );
}
