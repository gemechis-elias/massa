import 'dart:convert';
import 'dart:developer';
import 'package:smart_gebere/core/error/failure.dart';
import 'package:smart_gebere/features/user/data/datasources/data_source_api.dart';
import 'package:smart_gebere/features/user/domain/entities/user.dart';
import 'package:smart_gebere/injection.dart';
import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';
import 'package:shared_preferences/shared_preferences.dart'; // Import SharedPreferences package

class UserApiDataSource implements UserRemoteDataSource {
  final String baseUrl;

  UserApiDataSource({required this.baseUrl});

  Future<Map<String, dynamic>> _fetchData(
      String endpoint, Map<String, dynamic> data) async {
    log("fetching: $baseUrl/$endpoint");
    try {
      log("My data: $data");
      final response = await http.post(
        Uri.parse('$baseUrl/$endpoint'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(data),
      );

      final responseData = json.decode(response.body) as Map<String, dynamic>;

      if (response.statusCode == 200 && responseData['success'] == true) {
        log("fetched: $responseData");

        // Check if the response has a 'token' key
        if (responseData.containsKey('token')) {
          final token = responseData['token'] as String;

          // Store token in SharedPreferences
          final prefs = await SharedPreferences.getInstance();
          prefs.setString('auth_token', token);

          log("token is saved: $token");
        }

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

  @override
  Future<Map<String, dynamic>> registerUser(
      Map<String, dynamic> userData) async {
    return await _fetchData('user', userData);
  }

  @override
  Future<Map<String, dynamic>> loginUser(Map<String, dynamic> loginData) async {
    return await _fetchData('user/login', loginData);
  }

  @override
  Future<User> getUser() async {
    final responseData = await _fetchUserData('user');
    try {
      final user = User.fromJson(responseData);

      return user;
    } catch (e) {
      log("Error fetching user: $e");
      throw Exception('An error occurred: $e');
    }
  }

  @override
  Future<Map<String, dynamic>> updateProfilePhoto(
      Map<String, dynamic> userData) async {
    return await _updateUser('user', userData);
  }

  Future<String?> fetchAuthToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? authToken = prefs.getString('auth_token');
    return authToken;
  }

  Future<Map<String, dynamic>> _fetchUserData(String endpoint) async {
    log("User fetching: $baseUrl/$endpoint");
    String? authToken = await fetchAuthToken();

    try {
      final response = await http.get(
        Uri.parse('$baseUrl/$endpoint'),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $authToken', // Add the token to the headers
        },
      );

      final responseData = json.decode(response.body) as Map<String, dynamic>;

      if (response.statusCode == 200 && responseData['success'] == true) {
        log("User fetched: $responseData");
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

  Future<Map<String, dynamic>> _updateUser(
    String endpoint,
    Map<String, dynamic> userData,
  ) async {
    final sharedPreferences = sl<SharedPreferences>();
    final token = sharedPreferences.getString('auth_token');
    log("Base url: $baseUrl/$endpoint");
    log('Token is ready: $token');
    final image = userData['image'];
    log('File is received: $image');

    var headers = {
      'Authorization': 'Bearer $token',
      'Content-Type': 'multipart/form-data',
      'Accept': '*/*',
      'Accept-Encoding': 'gzip, deflate, br',
      'Connection': 'keep-alive',
    };

    final request = http.MultipartRequest(
      'POST',
      Uri.parse('$baseUrl/$endpoint'),
    );

    request.headers.addAll(headers);

    if (image != null) {
      var ext = image.path.split('.').last;

      request.files.add(await http.MultipartFile.fromPath('photo', image.path,
          contentType: MediaType('image', ext)));
      log("File length: ${request.files.length}");
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
        log("error (user datalayer): $responseData");
        final errorMessage =
            responseData['message'] as String? ?? 'Unknown error';
        throw Exception(errorMessage);
      }
    } catch (e) {
      log("error:: $e");
      throw Exception('An error occurred: $e');
    }
  }
}
