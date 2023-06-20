import 'package:flutter/cupertino.dart';

class Categories {
  late String name;
  late String imageUrl;
  Categories({ required this.name,  required this.imageUrl});

  
}
  List<Categories> categories = [
  Categories(name: "World", imageUrl: "assets/categories/world.jpg"),
  Categories(name: "Local", imageUrl: "assets/categories/local.jpg"),
  Categories(name: "Business", imageUrl: "assets/categories/business.jpg"),
  Categories(name: "Technology", imageUrl: "assets/categories/science.jpg"),
  Categories(name: "Travel", imageUrl: "assets/categories/lifestyle.jpg"),
  Categories(name: "Politics", imageUrl: "assets/categories/Politic.png"),
  Categories(name: "Health", imageUrl: "assets/categories/health.jpg"),
  Categories(name: "Sports", imageUrl: "assets/categories/sports.jpg"),
  Categories(name: "Books", imageUrl: "assets/categories/books.jpg"),
  Categories(name: "Movies", imageUrl: "assets/categories/cinema.jpg"),
  

];

