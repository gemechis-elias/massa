import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:smart_gebere/features/blog/data/datasources/data_source_api.dart';
import 'package:smart_gebere/features/blog/domain/entities/article.dart';
import 'package:http/http.dart' as http;
import 'package:smart_gebere/injection.dart';
import 'package:http_parser/http_parser.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:path/path.dart' as path;

class RemoteDataSource implements BlogRemoteDataSource {
  final String baseUrl;

  RemoteDataSource({required this.baseUrl});

  Future<dynamic> _fetchData(String endpoint) async {
    log("fetching: $baseUrl/$endpoint");
    try {
      final response = await http.get(
        Uri.parse('$baseUrl/$endpoint'),
        headers: {'Content-Type': 'application/json'},
      );

      final responseData = json.decode(response.body);

      if (response.statusCode == 200 && responseData['success'] == true) {
        ////  log("fetched: $responseData");
        return responseData['data'];
      } else {
        log("error: $responseData");
        final errorMessage =
            responseData['message'] as String? ?? 'Unknown error';
        throw Exception(errorMessage);
      }
    } catch (e) {
      log("error:: $e");
      throw Exception('An error occurred: $e');
    }
  }

  Future<dynamic> _fetchTags(String endpoint) async {
    log("fetching: $baseUrl/$endpoint");
    try {
      final response = await http.get(
        Uri.parse('$baseUrl/$endpoint'),
        headers: {'Content-Type': 'application/json'},
      );

      final responseData = json.decode(response.body);

      if (response.statusCode == 200 && responseData['success'] == true) {
        ////  log("fetched: $responseData");
        return responseData['tags'];
      } else {
        log("error: $responseData");
        final errorMessage =
            responseData['message'] as String? ?? 'Unknown error';
        throw Exception(errorMessage);
      }
    } catch (e) {
      log("error:: $e");
      throw Exception('An error occurred: $e');
    }
  }

  @override
  Future<List<Article>> getAllBlog() async {
    final responseData = await _fetchData('article');

    List<Article> articles = [];
    try {
      for (var blogData in responseData) {
        //      log(blogData.toString());
        articles.add(Article.fromJson(blogData));
      }
      return articles;
    } catch (e) {
      log("Error fetching articles: $e");
      throw Exception('An error occurred: $e');
    }
  }

  @override
  Future<List<String>> getTags() async {
    final responseData = await _fetchTags('tags');

    List<String> tags = [];
    try {
      for (var tagData in responseData) {
        //      log(blogData.toString());
        tags.add(tagData);
      }
      log("tags: $responseData");

      return tags;
    } catch (e) {
      log("Error fetching tags: $e");
      throw Exception('An error occurred: $e');
    }
  }

  @override
  Future<Map<String, dynamic>> postBlog(Map<String, dynamic> blogData) async {
    log('Posting blog $blogData');
    final responseData = await _createData('article', blogData);
    return responseData;
  }

  @override
  Future<void> deleteBlog(String articleId) {
    // TODO: implement deleteBlog
    throw UnimplementedError();
  }

  @override
  Future<List<Article>> searchArticle(String tag, String key) async {
    try {
      final endpoint = 'article?tags=$tag&searchParams=$key';
      final response = await _fetchData(endpoint);

      List<Article> articles = [];

      for (var articleData in response) {
        articles.add(Article.fromJson(articleData));
      }
      return articles;
    } catch (e) {
      log("Error fetching search articles: $e");
      throw Exception('An error occurred: $e');
    }
  }

  Future<dynamic> _createData(
    String endpoint,
    Map<String, dynamic> blogData,
  ) async {
    final sharedPreferences = sl<SharedPreferences>();
    final token = sharedPreferences.getString('auth_token');
    log("Base url: $baseUrl/$endpoint");
    log('Token is ready: $token');
    final image = blogData['image'];
    log('File is received: $image');

    var headers = {
      'Authorization': 'Bearer $token',
      'Content-Type': 'multipart/form-data',
    };

    final request = http.MultipartRequest(
      'POST',
      Uri.parse('$baseUrl/$endpoint'),
    );

    request.fields.addAll({
      'title': blogData['title'],
      'content': blogData['content'],
      'subTitle': blogData['subTitle'],
      'tags': blogData['tags'],
      'estimatedReadTime': '5 min'
    });
    request.headers.addAll(headers);

    if (image != null && image is File) {
      request.files.add(await http.MultipartFile.fromPath('photo', image.path,
          contentType: MediaType('image', 'jpeg')));
      log("File length: ${request.files.length}");
    } else {
      log("File is null");
    }

    try {
      final streamedResponse = await request.send();
      final response = await http.Response.fromStream(streamedResponse);

      final responseData = json.decode(response.body);
      log(responseData.toString());
      if (response.statusCode == 200 && responseData['success'] == true) {
        log("fetched: $responseData");
        return responseData['data'];
      } else {
        log("error (datalayer): $responseData");
        final errorMessage =
            responseData['message'] as String? ?? 'Unknown error';
        throw Exception(errorMessage);
      }
    } catch (e) {
      log("error (datalayer) $e");
      throw Exception('An error occurred: $e');
    }
  }
}
