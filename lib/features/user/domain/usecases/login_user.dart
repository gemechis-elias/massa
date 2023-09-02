import 'dart:developer';

import 'package:smart_gebere/core/error/failure.dart';
import 'package:dartz/dartz.dart';

import '../entities/user.dart';
import '../repositories/user_repository.dart';

class LoginUserUseCase {
  final UserRepository repository;

  LoginUserUseCase(this.repository);

  Future<Either<Failure, User>> call({
    required String email,
    required String password,
  }) async {
    try {
      final user = await repository.loginUser(email: email, password: password);
      log("logged in user: $user");
      return user; // Return user as Right with success case
    } catch (e) {
      return const Left(ServerFailure('Error logging in'));
    }
  }
}
