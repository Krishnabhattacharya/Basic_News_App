import 'package:flutter/material.dart';
import 'package:news_app_using_news_api/apiservice/apiservice.dart';
import 'package:news_app_using_news_api/model/newsmodel.dart';

import '../newsdeatils/newsitemlist.dart';

class allnews extends StatelessWidget {
  const allnews({super.key});

  @override
  Widget build(BuildContext context) {
    final apiservice aps=apiservice();
    return Scaffold(
      body: FutureBuilder(
          future: aps.getalllnews(),
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
