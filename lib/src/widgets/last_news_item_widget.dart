import 'package:dart_rss/dart_rss.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rss_lecture/src/utils/utils.dart';

import 'image_news_widget.dart';

class LastNewsItemWidget extends StatelessWidget {
  final RssItem item;
  const LastNewsItemWidget({Key? key, required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        item.title!,
        style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
        maxLines: 8,
        textAlign: TextAlign.center,
        overflow: TextOverflow.ellipsis,
      ),
      trailing: Icon(
        Icons.keyboard_arrow_right,
        color: Colors.grey[300]!,
        size: 30,
      ),
      contentPadding: const EdgeInsets.all(15),
      onTap: () => launchUniversalLink(item.link!),
      leading: ImageNewsWidget(
        urlImage: item.enclosure!.url!,
      ),
    );
  }
}

