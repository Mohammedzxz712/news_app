import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news_app3/models/NewsDataModel.dart';
import 'package:news_app3/models/SourceDataModel.dart';
import 'package:news_app3/shared/components/constant.dart';

class ApiManager {
  static Future<SourceDataModel> getSource() async {
    var url = Uri.https(BASE, "v2/top-headlines/sources", {"apiKey": APIKY});
    http.Response response = await http.get(url);

    var jsonData = jsonDecode(response.body);

    SourceDataModel sourceDataModel = SourceDataModel.fromJson(jsonData);

    return sourceDataModel;
  }

  static Future<NewsDataModel> getNewsData(String sourceId) async {
    var url = Uri.https(
        BASE, "/v2/everything", {"apiKey": APIKY, "sources": sourceId});
    http.Response response = await http.get(url);
    var jsonData = jsonDecode(response.body);
    NewsDataModel newsDataModel = NewsDataModel.fromJson(jsonData);

    return newsDataModel;
  }
}
