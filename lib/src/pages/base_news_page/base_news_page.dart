import 'package:dart_rss/dart_rss.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

import '../../api/news_api.dart';
import '../base_news_page/news_provider/provider.dart';

abstract class BaseNewsPage extends StatelessWidget {
  final LentaRssApi _newsProvider;
  const BaseNewsPage({Key? key, required LentaRssApi newsProvider}):
        _newsProvider = newsProvider,
        super(key: key);
  @overridegit
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) => News_Provider(),
      builder: (context, child) => _buildPage(context),
    );
  }

  Widget _buildPage(BuildContext context) {
    final provider = context.read<News_Provider>();
    final providerWatch = context.watch<News_Provider>();
    if (providerWatch.isLoaded == false) {
      providerWatch.loadNews();
      return const Center(child: CircularProgressIndicator());
    }
    if (providerWatch.isError == true) {
      return const Text("News Load Error", style: TextStyle(fontSize: 24));
    }
    if (providerWatch.isLoaded == true) {
      return RefreshIndicator(
          child: listBuilder(context, providerWatch),
          onRefresh: () => provider.reloadNews(),
      );
    }
    else {
      return Container();
    }
  }

  Widget listBuilder(BuildContext context, providerWatch) {
    return ListView.builder(
        itemCount: providerWatch.news.length,
        itemBuilder: (BuildContext context, int index) {
          final item = providerWatch.news[index];
          return buildListViewItem(item);
        });
  }

  Widget buildListViewItem(RssItem item);
}
