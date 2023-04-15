import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news_app_using_news_api/model/newsmodel.dart';
import 'package:url_launcher/url_launcher.dart';

class webnews extends StatelessWidget {
  final newsmodel nm;
  const webnews({super.key, required this.nm});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(nm.title.toString()),
      ),
      body: Column(children: [
        Padding(
            padding: EdgeInsets.all(10.0),
            child: CachedNetworkImage(
              height: 250,
              width: double.infinity,
              fit: BoxFit.cover,
              imageUrl: nm.urlToImage.toString(),
              placeholder: (context, url) =>
                  const Center(child: CircularProgressIndicator()),
              errorWidget: (context, url, error) => const Icon(Icons.error),
            )),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              nm.source!.name.toString(),
              style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Colors.white),
            ),
            Text(nm.publishedAt.toString(),
                style: const TextStyle(fontSize: 12, color: Colors.white)),
          ],
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(nm.title.toString(),
              style: const TextStyle(fontSize: 17, color: Colors.white)),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(nm.description.toString(),
              style: const TextStyle(fontSize: 17, color: Colors.white)),
        ),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            children: [
              Expanded(
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color.fromARGB(255, 156, 95, 4),
                      ),
                      onPressed: () async {
                        final Uri url = Uri.parse(nm.url.toString());
                        if (!await launchUrl(url)) {
                          throw Exception("Could not launch");
                        }
                      },
                      child: const Text('Read More..'))),
            ],
          ),
        ),
      ]),
    );
  }
}
