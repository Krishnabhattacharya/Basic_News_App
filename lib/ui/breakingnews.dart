import 'package:flutter/material.dart';
import 'package:news_app_using_news_api/model/newsmodel.dart';
import 'package:news_app_using_news_api/newsdeatils/newsitemlist.dart';
import '../apiservice/apiservice.dart';

// ignore: camel_case_types
class breakingnews extends StatelessWidget {
  const breakingnews({super.key});

  @override
  Widget build(BuildContext context) {
    apiservice aps = apiservice();
    return Scaffold(
      body: FutureBuilder(
          future: aps.getbreakingnews(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              List<newsmodel> articallist = snapshot.data ?? [];
              return ListView.builder(
                  itemCount: articallist.length,
                  itemBuilder: (context, index) {
                    return newsitemlist(
                      nm: articallist[index],
                    );
                  });
            }
            return const Center(
              child: CircularProgressIndicator(),
            );
          }),
    );
  }
}
