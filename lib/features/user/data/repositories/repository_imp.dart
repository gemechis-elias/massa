import 'dart:developer';
import 'dart:io';

import 'package:smart_gebere/core/error/failure.dart';
import 'package:smart_gebere/features/user/data/datasources/data_source_api.dart';
import 'package:dartz/dartz.dart';

import 'package:smart_gebere/features/user/data/datasources/remote_data_source.dart';
import 'package:smart_gebere/features/user/data/models/user_model.dart';

import '../../domain/repositories/user_repository.dart';
import '../../domain/entities/user.dart';

class UserRepositoryImpl implements UserRepository {
  final UserLocalDataSource localDataSource;
  final UserApiDataSource remoteDataSource;

  UserRepositoryImpl(
      {required this.remoteDataSource, required this.localDataSource});

  @override
  Future<Either<Failure, User>> registerUser({
    required String fullName,
    required String email,
    required String password,
    required String expertise,
    required String bio,
  }) async {
    final userData = {
      'bio': "Not available",
      'fullName': fullName,
      'email': email,
      'password': password,
      'expertise': "Not available",
    };
    try {
      final responseData = await remoteDataSource.registerUser(userData);
      if (responseData != null) {
        final user = User.fromJson(responseData);
        // Save user data to local storage
        await localDataSource.saveUserData(user);

        return Right(user);
      } else {
        log("Invalid response data format: $responseData");
        return const Left(ServerFailure('Invalid response data format'));
      }
    } catch (e) {
      return const Left(ServerFailure('Error registering user'));
    }
  }

  @override
  Future<Either<Failure, User>> loginUser({
    required String email,
    required String password,
  }) async {
    final loginData = {
      'email': email,
      'password': password,
    };
    try {
      final responseData = await remoteDataSource.loginUser(loginData);
      log("login response data: $responseData");
      if (responseData != null) {
        final user = User.fromJson(responseData);
        // Save user data to local storage
        await localDataSource.saveUserData(user);

        return Right(user);
      } else {
        log("Invalid response data format: $responseData");
        return const Left(ServerFailure('Invalid response data format'));
      }
    } catch (e) {
      log("Exception caught: $e");
      return const Left(ServerFailure('Error logging in'));
    }
  }

  @override
  Future<Either<Failure, User>> getUser() async {
    try {
      final user = await remoteDataSource.getUser();
      log("Fetched on Repo Imp $user");
      return Right(user); // Return user as Right with success case
    } catch (e) {
      return const Left(ServerFailure('Error fetching user'));
    }
  }

  @override
  Future<Either<Failure, void>> updateProfilePhoto(
      Map<String, dynamic> userData) async {
    try {
      await remoteDataSource.updateProfilePhoto(userData);
      return const Right(null); // Return success as Right with null value
    } catch (e) {
      return const Left(ServerFailure('Error updating profile photo'));
    }
  }
}
