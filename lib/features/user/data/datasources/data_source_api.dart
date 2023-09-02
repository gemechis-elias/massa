import 'package:smart_gebere/core/error/failure.dart';
import 'package:smart_gebere/features/user/domain/entities/user.dart';
import 'package:dartz/dartz.dart';

abstract class UserRemoteDataSource {
  Future<void> registerUser(Map<String, dynamic> userData);
  Future<Map<String, dynamic>> loginUser(Map<String, dynamic> loginData);
  Future<User> getUser();
  Future<Map<String, dynamic>> updateProfilePhoto(
      Map<String, dynamic> userData);
}

abstract class UserLocalDataSource {
  Future<void> saveUserData(User user);
  Future<User?> getUserData();
  Future<void> clearUserData();
}
