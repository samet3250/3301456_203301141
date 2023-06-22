import 'package:http/http.dart' as http;
import 'package:html/parser.dart' as parser;
import '../model/news_model.dart';

Future<List<news>> getcontent(String urll, int index) async {
  List<news> _newsList = [];
  for (int i = 0; i < 1; i++) {
    var res = await http.get(Uri.parse(urll));
    final body = res.body;
    final document = parser.parse(body);
    var response2 = document
        .getElementsByClassName("PageBuilder-pageWrapper")[0]
        .getElementsByClassName(
            "PageBuilder-containerFluidWidths PageBuilder-pageRow")[0]
        .getElementsByClassName("Layout-layout");

    void addnewsust(int a, int b) {
      if (!response2[a]
              .children[b]
              .getElementsByTagName("a")[0]
              .attributes["href"]
              .toString()
              .contains("video") &&
          !response2[a]
              .children[b]
              .getElementsByTagName("a")[0]
              .attributes["href"]
              .toString()
              .contains("live-updates") &&
          response2[a]
                  .children[b]
                  .getElementsByClassName("Card-titleAndFooter")[0]
                  .getElementsByTagName("a")[0]
                  .attributes["href"] !=
              "/pro/") {
        _newsList.add(news(
            url: response2[a]
                .children[b]
                .getElementsByTagName("a")[0]
                .attributes["href"]
                .toString(),
            imageUrl: response2[a]
                .children[b]
                .getElementsByTagName("source")[0]
                .attributes["srcset"]
                .toString(),
            category: "bilmiyorum",
            title: response2[a]
                .children[b]
                .getElementsByClassName("Card-titleContainer")[0]
                .text,
            time: response2[a]
                .children[b]
                .getElementsByClassName("Card-time")[0]
                .text));
      }
    }

    void addnewsalt(int a, int b) {
      if (!response2[a]
              .getElementsByClassName("Card-standardBreakerCard Card-threeUpStackRectangleSquareMedia Card-rectangleToLeftSquareMedia Card-card")[
                  b]
              .getElementsByTagName("a")[0]
              .attributes["href"]
              .toString()
              .contains("video") &&
          !response2[a]
              .getElementsByClassName("Card-standardBreakerCard Card-threeUpStackRectangleSquareMedia Card-rectangleToLeftSquareMedia Card-card")[
                  b]
              .getElementsByTagName("a")[0]
              .attributes["href"]
              .toString()
              .contains("live-updates") &&
          response2[a]
                  .getElementsByClassName(
                      "Card-standardBreakerCard Card-threeUpStackRectangleSquareMedia Card-rectangleToLeftSquareMedia Card-card")[b]
                  .getElementsByClassName("Card-titleAndFooter")[0]
                  .getElementsByTagName("a")[1]
                  .attributes["href"] !=
              "/pro/") {
        _newsList.add(news(
            url: response2[a]
                .getElementsByClassName("Card-standardBreakerCard Card-threeUpStackRectangleSquareMedia Card-rectangleToLeftSquareMedia Card-card")[
                    b]
                .getElementsByTagName("a")[0]
                .attributes["href"]
                .toString(),
            imageUrl: response2[a]
                .getElementsByClassName("Card-standardBreakerCard Card-threeUpStackRectangleSquareMedia Card-rectangleToLeftSquareMedia Card-card")[
                    b]
                .getElementsByTagName("source")[0]
                .attributes["srcset"]
                .toString(),
            category: "bilmiyorum",
            title: response2[a]
                .getElementsByClassName("Card-standardBreakerCard Card-threeUpStackRectangleSquareMedia Card-rectangleToLeftSquareMedia Card-card")[
                    b]
                .getElementsByClassName("Card-titleContainer")[0]
                .text,
            time: response2[a]
                .getElementsByClassName(
                    "Card-standardBreakerCard Card-threeUpStackRectangleSquareMedia Card-rectangleToLeftSquareMedia Card-card")[b]
                .getElementsByClassName("Card-time")[0]
                .text));
      }
    }

    addnewsust(0, 0);
    addnewsust(0, 1);
    addnewsust(1, 0);
    addnewsust(1, 1);
    addnewsust(1, 2);
    addnewsalt(2, 0);
    addnewsalt(2, 1);

    void morenews(int number) {
      var response = document
          .getElementsByClassName("PageBuilder-pageWrapper")[0]
          .getElementsByClassName(
              "PageBuilder-containerFluidWidths PageBuilder-pageRow")[number]
          .getElementsByClassName("PageBuilder-col-9 PageBuilder-col")[0]
          .getElementsByClassName("ThreeUpStack-container")
          .forEach((element) {
        element
            .getElementsByClassName(
                "Card-standardBreakerCard Card-threeUpStackRectangleSquareMedia Card-rectangleToLeftSquareMedia Card-card")
            .forEach((el) {
          if (!el.children[1]
                  .getElementsByClassName("Card-titleAndFooter")[0]
                  .getElementsByTagName("a")[1]
                  .attributes["href"]
                  .toString()
                  .contains("video") &&
              !el.children[1]
                  .getElementsByClassName("Card-titleAndFooter")[0]
                  .getElementsByTagName("a")[1]
                  .attributes["href"]
                  .toString()
                  .contains("live-updates") &&
              el.children[1]
                      .getElementsByClassName("Card-titleAndFooter")[0]
                      .getElementsByTagName("a")[0]
                      .attributes["href"] !=
                  "/pro/") {
            _newsList.add(news(
              url: el.children[1]
                  .getElementsByClassName("Card-titleAndFooter")[0]
                  .getElementsByTagName("a")[1]
                  .attributes["href"]
                  .toString(),
              imageUrl: el
                  .getElementsByTagName("source")[0]
                  .attributes["srcset"]
                  .toString(),
              category: el.children[1]
                  .getElementsByClassName("Card-eyebrowContainer")[0]
                  .text,
              title: el.children[1]
                  .getElementsByClassName("Card-titleAndFooter")[0]
                  .getElementsByClassName("Card-title")[0]
                  .text,
              time: el.children[1]
                  .getElementsByClassName("Card-cardFooter")[0]
                  .text,
            ));
          }
        });
      });
    }

    if (index != 5) {
      morenews(3);
    } else {
      morenews(4);
    }
  }

  return _newsList;
}

Future<List<String>> getTextandSubtitle(String urll) async {
  String news_content = "", subtitle = "";

  var client = http.Client();
  var res = await http.get(Uri.parse(urll));
  final body = res.body;
  final document = parser.parse(body);

  var response = document.getElementsByClassName("group").forEach((element) {
    element.getElementsByTagName("p").forEach((element) {
      news_content += (element.text.toString() + "\n");
    });
  });
  document.getElementsByTagName("meta")[8].attributes["content"] == null
      ? subtitle =
          document.getElementsByTagName("meta")[7].attributes["content"]!
      : subtitle =
          document.getElementsByTagName("meta")[8].attributes["content"]!;

  List<String> mycontent = [news_content, subtitle];
  return mycontent;
}
