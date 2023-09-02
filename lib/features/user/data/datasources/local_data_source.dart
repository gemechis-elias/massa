import 'dart:convert';
import 'dart:developer';

import 'package:smart_gebere/features/user/data/datasources/data_source_api.dart';
import 'package:smart_gebere/features/user/domain/entities/user.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserLocalDataSourceImpl implements UserLocalDataSource {
  final SharedPreferences sharedPreferences;

  UserLocalDataSourceImpl({required this.sharedPreferences});

  @override
  Future<void> saveUserData(User user) async {
    final userDataJson = jsonEncode(user.toJson()); // Convert user data to JSON
    await sharedPreferences.setString('user_data', userDataJson);
    log("User data saved: $userDataJson");
  }

  @override
  Future<User?> getUserData() async {
    final userDataJson = sharedPreferences.getString('user_data');
    if (userDataJson != null) {
      final userData = jsonDecode(userDataJson);
      return User.fromJson(userData);
    }
    return null;
  }

  @override
  Future<void> clearUserData() async {
    await sharedPreferences.remove('user_data');
  }
}
