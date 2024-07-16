import 'package:dio/dio.dart';
import '../models/article.dart';

class ArticleService {
  static final ArticleService _singleton = ArticleService._internal();

  ArticleService._internal() {
    _dio = Dio(BaseOptions(baseUrl: 'http://localhost:3000'));
  }

  factory ArticleService() {
    return _singleton;
  }

  late Dio _dio;

  Future<List<Article>> getArticles() async {
    try {
      final response = await _dio.get('/articles');
      if (response.statusCode == 200) {
        await Future.delayed(const Duration(
            seconds:
                5)); // Simulate network delay because I will create a skeleton
        return Article.fromList(response.data as List<dynamic>);
      } else {
        throw Exception(
            'Failed to load articles with status code: ${response.statusCode}');
      }
    } catch (e) {
      print(e);
      throw Exception('Failed to load articles $e');
    }
  }
}
