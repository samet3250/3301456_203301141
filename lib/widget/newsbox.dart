
import 'package:flutter/material.dart';
import 'package:my_news_app/pages/news_page.dart';

class newsBox extends StatefulWidget {
  String imageUrl;
  String title;
  String time;
  String writer;
  String category;
  String urlscrap;
  late Widget subtitle;
  late Widget futureWidget;

  newsBox(
      {super.key,
      
      this.imageUrl = "",
      this.title = "",
      this.time = "",
      this.writer = "",
      this.category = "",
      this.urlscrap = "",
      required this.subtitle,
      required this.futureWidget});

  @override
  State<newsBox> createState() => _newsBoxState();
}

class _newsBoxState extends State<newsBox> {
  int tapControl = 0;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onDoubleTap: () {
        Navigator.of(context).push(createAnimationRoute());
      },
      onTap: () {
        tapControl++;
        setState(() {});
      },
      child: Padding(
        padding: const EdgeInsets.only(top: 8, left: 15, right: 15, bottom: 4),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 180,
              width: double.infinity,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  border: Border.all(
                    width: 1,
                    color: const Color.fromARGB(255, 187, 180, 180),
                  ),
                  image: DecorationImage(
                      image: NetworkImage(widget.imageUrl), fit: BoxFit.fill)),
            ),
            const SizedBox(
              height: 6,
            ),
            Text(widget.time,
                style: const TextStyle(
                    fontFamily: "Times",
                    fontSize: 13,
                    color: Color.fromARGB(255, 138, 137, 137))),
            const SizedBox(
              height: 3,
            ),
            Text(widget.title,
                style: const TextStyle(
                    fontFamily: "Montserrat",
                    fontSize: 17,
                    fontWeight: FontWeight.bold)),
            const SizedBox(
              height: 3,
            ),
            if (tapControl % 2 == 1) widget.subtitle else const SizedBox()
          ],
        ),
      ),
    );
  }

  Route createAnimationRoute() {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => newsPage(
        imageUrl: widget.imageUrl,
        category: widget.category,
        url: widget.urlscrap,
        futureWidget: widget.futureWidget,
        time: widget.time,
        title: widget.title,
        writer: widget.writer,
        subtitle: widget.subtitle,
      ),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(1.0, 0.0);
        const end = Offset.zero;
        const curve = Curves.ease;

        var tween =
            Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

        return SlideTransition(
          position: animation.drive(tween),
          child: child,
        );
      },
    );
  }
}
