import 'package:flutter/material.dart';

class categoryBox extends StatelessWidget {
  late String category, imageUrl;
  categoryBox({required this.imageUrl, required this.category, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          image: DecorationImage(
              image: AssetImage(imageUrl), fit: BoxFit.cover)),
      child: Container(
        alignment: Alignment.center,
        child: Text(
          category,
          style: TextStyle(
              fontFamily: 'Montserrat',
              fontSize: 23,
              color: Colors.white,
              fontWeight: FontWeight.w600),
          
        ),
      ),
    );
  }
}
