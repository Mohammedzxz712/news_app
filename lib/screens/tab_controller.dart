import 'package:flutter/material.dart';
import 'package:news_app3/screens/tap_item.dart';
import 'package:news_app3/shared/network/remote/api_manager.dart';

import '../models/SourceDataModel.dart';
import 'news_item.dart';

class TabControllerScreen extends StatefulWidget {
  List<Sources> sources;

  TabControllerScreen(this.sources);

  @override
  State<TabControllerScreen> createState() => _TabControllerScreenState();
}

class _TabControllerScreenState extends State<TabControllerScreen> {
  int indexSelected = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 12,
        ),
        DefaultTabController(
            length: widget.sources.length,
            child: TabBar(
                indicatorColor: Colors.white,
                isScrollable: true,
                onTap: (value) {
                  indexSelected = value;
                  setState(() {});
                },
                tabs: widget.sources
                    .map(
                      (e) => Tab(
                          child: TabItem(
                              e, widget.sources.indexOf(e) == indexSelected)),
                    )
                    .toList())),
        FutureBuilder(
          future:
              ApiManager.getNewsData(widget.sources[indexSelected].id ?? ""),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return CircularProgressIndicator(
                color: Colors.green,
              );
            }
            if (snapshot.hasError) {
              return Column(
                children: [
                  Text("${snapshot.data?.message ?? "has error"}"),
                  TextButton(onPressed: () {}, child: Text("try again")),
                ],
              );
            }
            if (snapshot.data?.status != "ok") {
              return Column(
                children: [
                  Text("${snapshot.data?.message ?? "has error"}"),
                  TextButton(onPressed: () {}, child: Text("try again")),
                ],
              );
            }

            var news = snapshot.data?.articles ?? [];

            return Expanded(
              child: ListView.builder(
                itemBuilder: (context, index) {
                  return NewsItem(news[index]);
                },
                itemCount: news.length,
              ),
            );
          },
        ),
      ],
    );
  }
}
