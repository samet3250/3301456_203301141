import 'package:flutter/cupertino.dart';

class Categories {
  late String name;
  late String imageUrl;
  Categories({ required this.name,  required this.imageUrl});

  
}
  List<Categories> categories = [
  Categories(name: "Highligths", imageUrl: "assets/categories/highlights.jpg"),
  Categories(name: "Turkey", imageUrl: "assets/categories/turkey.jpg"),
  Categories(name: "World", imageUrl: "assets/categories/world.jpg"),
  Categories(name: "Business", imageUrl: "assets/categories/business.jpg"),
  Categories(name: "Sports", imageUrl: "assets/categories/sports.jpg"),
  Categories(name: "Science", imageUrl: "assets/categories/science.jpg"),
  Categories(name: "Education", imageUrl: "assets/categories/education.jpg"),
  Categories(name: "Entertainment", imageUrl: "assets/categories/entertainment.jpg"),
  Categories(name: "Lifestyle", imageUrl: "assets/categories/lifestyle.jpg"),
  Categories(name: "Health and Fitness", imageUrl: "assets/categories/health.jpg"),
  Categories(name: "Books", imageUrl: "assets/categories/books.jpg"),
  Categories(name: "Cinema&Tv", imageUrl: "assets/categories/cinema.jpg"),
  
];

