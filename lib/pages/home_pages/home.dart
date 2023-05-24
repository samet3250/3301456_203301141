import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:hive/hive.dart';
import 'package:my_news_app/content.dart';
import 'package:my_news_app/pages/bookmark_page.dart';
import 'package:my_news_app/pages/home_pages/home_tabbar_pages.dart';
import 'package:my_news_app/pages/login_pages/user_enterwith.dart';
import 'package:my_news_app/pages/search_page.dart';
import 'package:my_news_app/widget/create_news.dart';
String? local2;
var box2=Hive.box("category");
var box3=Hive.box("language");
List<String> list = <String>['turkey', 'france', 'united-kingdom', 'india'];
List<String> list2 = <String>['tr', 'de', 'es', 'fr'];

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int currentIndex = 0;
  late List bottonNavBarPages;
  late FirebaseAuth auth;


  @override
  void initState() {
    //TODO: implement initState
    super.initState();

    bottonNavBarPages = [HomeTabbarPages(), SearchPage(), Bookmark()];
    auth=FirebaseAuth.instance;
    

  }
  String dropdownValue1 = list.first;
  String dropdownValue2 = list.first;
  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: AppBar(
            backgroundColor: Colors.red.shade400,
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
            height: 25,
          ),
          GestureDetector(
            onTap: () {
              setState(() {
                Navigator.of(context).pop();
              });
            },
            child: Text(
              'Profile',
              style: TextStyle(
                fontFamily: 'Montserrat',
                fontSize: 24,
                fontWeight: FontWeight.w700,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(
            height: 45,
          ),
          GestureDetector(
            onTap: () {},
            child: GestureDetector(
               onDoubleTap: () {
                 
                 //await box2.put("cat", "france");
               },
              child: ExpansionTile(
                title: Text(
                  'Settings',
                  style: TextStyle(
                    fontFamily: 'Montserrat',
                    fontSize: 24,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: DropdownButton<String>(
                        //value: dropdownValue,
                        hint: Text("choose"),
                        icon: const Icon(Icons.arrow_downward),
                        elevation: 16,
                        style: const TextStyle(color: Colors.deepPurple),
                        underline: Container(
                          height: 2,
                          color: Colors.deepPurpleAccent,
                        ),
                        onChanged: (String? value)async{
                          // This is called when the user selects an item.
                           
                            dropdownValue1 = value!;
                            await box2.put("cat", value);
                          
                        },
                        items: list.map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      ),
                  ),
                                        Align(
                    alignment: Alignment.topLeft,
                    child: DropdownButton<String>(
                        //value: dropdownValue,
                        hint: Text("translate to:"),
                        icon: const Icon(Icons.arrow_downward),
                        elevation: 16,
                        style: const TextStyle(color: Colors.deepPurple),
                        underline: Container(
                          height: 2,
                          color: Colors.deepPurpleAccent,
                        ),
                        onChanged: (String? value)
                          // This is called when the user selects an item.
                          async {
                            dropdownValue2 = value!;
                            await box3.put("lan", value);
                          
                        },
                        items: list2.map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      ),
                  )
                ],
              ),
            ),
          ),
          SizedBox(
            height: 45,
          ),
          ExpansionTile(
            title: Text(
              'About',
              style: TextStyle(
                fontFamily: 'Montserrat',
                fontSize: 24,
                fontWeight: FontWeight.w700,
              ),
            ),
            children: [Text(
              'whattttttttttttttttttttttttttttttttttttsa',
              style: TextStyle(
                fontFamily: 'Montserrat',
                fontSize: 24,
                fontWeight: FontWeight.w700,
              ),
            )],
          ),
          SizedBox(
            height: 45,
          ),
          Text(
            'Log Out',
            style: TextStyle(
              fontFamily: 'Montserrat',
              fontSize: 24,
              fontWeight: FontWeight.w700,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          GestureDetector(
            onTap: () {
              signOutUser();
              Navigator.popUntil(context,  ModalRoute.withName('/'));
            },
            child: CircleAvatar(
              radius: 20,
              backgroundColor: Colors.black,
              child: Icon(
                Icons.arrow_back,
                color: Colors.white,
              ),
            ),
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

    await auth.signOut();
  }
}
