import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news_app_using_news_api/model/newsmodel.dart';
import 'package:news_app_using_news_api/ui/newsToweb.dart';

class newsitemlist extends StatelessWidget {
  final newsmodel nm;
  const newsitemlist({super.key, required this.nm});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => webnews(nm: nm)));
      },
      child: Card(
        color: const Color.fromARGB(255, 246, 193, 113),
        elevation: 8,
        shape: Border.all(color: Colors.white, width: 3),
        shadowColor: Colors.white,
        //padding:const EdgeInsets.all(20),
        margin: const EdgeInsets.all(15),

        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          CachedNetworkImage(
            height: 250,
            width: double.infinity,
            fit: BoxFit.cover,
            imageUrl: nm.urlToImage.toString(),
            placeholder: (context, url) =>
                const Center(child: CircularProgressIndicator()),
            errorWidget: (context, url, error) => const Icon(Icons.error),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                nm.source!.name.toString(),
                style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Colors.black),
              ),
              Text(nm.publishedAt.toString(),
                  style: const TextStyle(fontSize: 12, color: Colors.black)),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(nm.title.toString(),
                style: const TextStyle(fontSize: 17, color: Colors.black)),
          )
        ]),
      ),
    );
  }
}
