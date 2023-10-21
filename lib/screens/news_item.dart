import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news_app3/models/NewsDataModel.dart';

class NewsItem extends StatelessWidget {
  Articles articles;

  NewsItem(this.articles);

  @override
  Widget build(BuildContext context) {
    return Card(
      //margin: EdgeInsets.symmetric(vertical: 14),
      elevation: 5,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      shape: OutlineInputBorder(
          borderRadius: BorderRadius.circular(13),
          borderSide: const BorderSide(color: Colors.white)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          CachedNetworkImage(
            imageUrl: articles.urlToImage ?? "",
            placeholder: (context, url) => Center(
                child: CircularProgressIndicator(
              color: Colors.green,
            )),
            errorWidget: (context, url, error) => Icon(Icons.error),
          ),
          Text(
            articles.author ?? "",
            style: const TextStyle(
              color: Colors.grey,
            ),
          ),
          Text(
            articles.title ?? "",
            style: const TextStyle(color: Colors.black),
          ),
          Text(
            articles.publishedAt?.substring(1, 10) ?? "",
            style: const TextStyle(color: Colors.grey),
            textAlign: TextAlign.right,
          ),
        ],
      ),
    );
  }
}
