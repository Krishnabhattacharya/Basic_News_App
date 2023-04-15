import 'package:flutter/material.dart';
import 'package:news_app_using_news_api/apiservice/apiservice.dart';
import 'package:news_app_using_news_api/model/newsmodel.dart';
import 'package:news_app_using_news_api/ui/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      
      theme: ThemeData.light().copyWith(
        scaffoldBackgroundColor: Colors.black,
          appBarTheme:
              AppBarTheme(backgroundColor: Color.fromARGB(255, 169, 97, 4))),
      home: const home(),
    );
  }
}
