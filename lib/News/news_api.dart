import 'dart:convert';
import 'package:http/http.dart' as http;
import 'news_model.dart';

class NewsApi {
  static const String apiKey = "c20db75fa92142b995f9588b664be074";

  static Future<List<Article>> fetchNews() async {
    final url = Uri.parse(
      "https://newsapi.org/v2/top-headlines?country=us&apiKey=$apiKey"
    );

    final res = await http.get(url);

    if (res.statusCode == 200) {
      final data = json.decode(res.body);
      List articles = data["articles"];

      return articles.map((e) => Article.fromJson(e)).toList();
    } else {
      throw Exception("Failed to load news");
    }
  }
}
