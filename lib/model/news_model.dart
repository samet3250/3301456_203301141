import 'package:hive/hive.dart';
part 'news_model.g.dart';

@HiveType(typeId: 1)
class news {
  @HiveField(0, defaultValue: "")
  String imageUrl;
  @HiveField(1, defaultValue: "")
  String title;
  @HiveField(2, defaultValue: "")
  String subtitle;
  @HiveField(3, defaultValue: "")
  String category;
  @HiveField(4, defaultValue: "")
  String writer;
  @HiveField(5, defaultValue: "")
  String time;
  @HiveField(6, defaultValue: "")
  String text;
  @HiveField(7, defaultValue: "")
  String url;
  @HiveField(8, defaultValue: "")
  String futureWidget;
  news(
      {this.futureWidget = "",
      this.imageUrl = "",
      this.title = "",
      this.category = "",
      this.subtitle = "",
      this.text = "",
      this.time = "",
      this.writer = "",
      this.url = ""});

  @override
  String toString() {
    // TODO: implement toString

    return url + "," + imageUrl + "," + time + "," + title + "\n";
  }
}
