import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:tech_trends/model/data.dart';

class MyServices {
  List<Articles>? articles = [];

  Future<NewsHeadlines> searchData(String query) async {
    String baseUrl =
        'https://newsapi.org/v2/top-headlines?q=$query&apiKey=<USE-YOUR-OWN-API-KEY-THANKS>';

    try {
      final respone = await http.get(
        Uri.parse(baseUrl),
        headers: {
          HttpHeaders.contentTypeHeader: ContentType.json.value,
        },
      );

      if (respone.statusCode == HttpStatus.ok) {
        final jsonData = json.decode(respone.body);
        var data = NewsHeadlines.fromMap(jsonData);

        print('$data -- real data');

        return data;
      }
    } on Exception {
      throw 'Unknown result';
    }
    return null!;
  }

  Future<NewsHeadlines> filterData(
      {String? filterByCountry, String? category}) async {
    String baseUrl =
        // 'https://newsapi.org/v2/top-headlines?country=$filterByCountry&apiKey=<---->';
        'https://newsapi.org/v2/top-headlines?country=$filterByCountry&category=$category&apiKey=<------>';
    try {
      final respone = await http.get(
        Uri.parse(baseUrl),
        headers: {
          HttpHeaders.contentTypeHeader: ContentType.json.value,
        },
      );

      if (respone.statusCode == HttpStatus.ok) {
        final jsonData = json.decode(respone.body);
        var data = NewsHeadlines.fromMap(jsonData);

        // articles = data.articles!
        //     .where((e) => e.title!.toLowerCase().contains(query.toLowerCase()))
        //     .toList();

        print('$data -- real data');

        return data;
      }
    } on Exception {
      throw 'Unknown result';
    }
    return null!;
  }
}
