import 'package:flutter/material.dart';
import 'package:frontend/models/article.dart';
import 'package:frontend/widgets/custom_list_title.dart';

class ArticleItem extends StatelessWidget {
  const ArticleItem({
    super.key,
    required this.article,
  });

  final Article article;

  @override
  Widget build(BuildContext context) {
    return CustomListTile(
      title: article.title,
      description: article.description,
      author: article.author,
      imageUrl: article.urlToImage,
      urlToLaunch: article.url,
    );
  }
}
