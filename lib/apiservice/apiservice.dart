import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:news_app_using_news_api/model/newsmodel.dart';
import 'package:http/http.dart' as http;

class apiservice {
  final allnews =
      "https://newsapi.org/v2/everything?q=bitcoin&apiKey=4c61210883cd4a0196d39fcf07d42a46";

  final breakingnews =
      "https://newsapi.org/v2/top-headlines?country=us&apiKey=4c61210883cd4a0196d39fcf07d42a46";

  List<newsmodel> articals = [];
  Future<List<newsmodel>> getalllnews() async {
    final respons = await http.get(Uri.parse(allnews));
    try {
      if (respons.statusCode == 200) {
        var data = jsonDecode(respons.body);
        var artical = data["articles"];
        for (Map<String, dynamic> i in artical) {
          articals.add(newsmodel.fromJson(i));
        }
        return articals;
      } else {
        throw ("No atricl found");
      }
    } catch (e) {
      debugPrint(e.toString());
      throw (e.toString());
    }
  }
    Future<List<newsmodel>> getbreakingnews() async {
    final respons = await http.get(Uri.parse(breakingnews));
    try {
      if (respons.statusCode == 200) {
        var data = jsonDecode(respons.body);
        var artical = data["articles"];
        for (Map<String, dynamic> i in artical) {
          articals.add(newsmodel.fromJson(i));
        }
        return articals;
      } else {
        throw ("No atricl found");
      }
    } catch (e) {
      debugPrint(e.toString());
      throw (e.toString());
    }
  }
}
