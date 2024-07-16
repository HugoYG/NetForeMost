import 'package:flutter/material.dart';
import 'package:frontend/models/article.dart';

class ArticleItem extends StatelessWidget {
  const ArticleItem({
    super.key,
    required this.article,
  });

  final Article article;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      width: double.infinity,
      child: ListTile(
        title: Text(article.title),
        subtitle: Text(article.description),
        //leading: Image.network(article.urlToImage), //TODO: Handle error image
      ),
    );
  }
}
