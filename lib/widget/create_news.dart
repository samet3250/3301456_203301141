import 'package:flutter/material.dart';
import 'package:my_news_app/model/categories_model.dart';
import 'package:my_news_app/model/news_model.dart';
import 'newsbox.dart';

List<Widget> categories_name() {
  return List.generate(
      categories.length, (index) => Text(categories[index].name));
}

List<ListView> createNewsListView = [
  ListViewBuilderWidget(AllLists[0]),
  ListViewBuilderWidget(AllLists[1]),
  ListViewBuilderWidget(AllLists[2]),
  ListViewBuilderWidget(AllLists[3]),
  ListViewBuilderWidget(AllLists[4]),
  ListViewBuilderWidget(AllLists[5]),
  ListViewBuilderWidget(AllLists[6]),
  ListViewBuilderWidget(AllLists[7]),
  ListViewBuilderWidget(AllLists[8]),
  ListViewBuilderWidget(AllLists[9]),
  ListViewBuilderWidget(AllLists[10]),
  ListViewBuilderWidget(AllLists[11]),
];

ListView ListViewBuilderWidget(List newsList) {
  return ListView.builder(
      itemCount: 10,
      itemBuilder: (context, index) {
        return newsBox(
          category: newsList[index].category,
          imageUrl: newsList[index].imageUrl,
          title: newsList[index].title,
          subtitle: newsList[index].subtitle,
          text: newsList[index].text,
          time: newsList[index].time,
          writer: newsList[index].writer,
        );
      });
}
