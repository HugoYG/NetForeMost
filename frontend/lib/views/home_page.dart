import 'package:flutter/material.dart';
import 'package:frontend/models/article.dart';
import 'package:frontend/services/articles_service.dart';
import 'package:frontend/widgets/article_item.dart';
import 'package:skeletonizer/skeletonizer.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    super.key,
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final articleService = ArticleService();
  final List<Article> articlesL = [];
  bool isLoading = false;
  final articleSkeleton = Article(
    id: '',
    author: 'Loading...',
    title: 'Loading...',
    description: 'Loading...',
    url: '',
    urlToImage: '',
    publishedAt: DateTime.now(),
  );
  @override
  void initState() {
    retrieveArticles();
    super.initState();
  }

  retrieveArticles() async {
    try {
      setState(() {
        isLoading = true;
      });
      final tempArticles = await articleService.getArticles();
      setState(() {
        articlesL.addAll(tempArticles);
        articlesL.addAll(tempArticles);

        isLoading = false;
      });
    } catch (e) {
      print(e);
      //TODO: Handle the error in the screen
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('NetForeMost Test'),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              if (isLoading)
                Skeletonizer(
                  enabled: true,
                  ignoreContainers: false,
                  child: ListView.builder(
                    itemCount: 7,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return ArticleItem(article: articleSkeleton);
                    },
                  ),
                ),
              for (final article in articlesL) ArticleItem(article: article),
            ],
          ),
        ));
  }
}
