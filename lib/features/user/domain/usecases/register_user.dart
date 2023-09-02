import 'dart:developer';

import 'package:smart_gebere/core/error/failure.dart';
import 'package:smart_gebere/core/usecases/usescase.dart';
import 'package:dartz/dartz.dart';
import '../entities/user.dart';
import '../repositories/user_repository.dart';

class RegisterUserUseCase implements UseCase<void, RegisterUserParams> {
  final UserRepository repository;

  RegisterUserUseCase(this.repository);

  @override
  Future<Either<Failure, User>> call(RegisterUserParams params) async {
    try {
      final user = await repository.registerUser(
        fullName: params.fullName,
        email: params.email,
        password: params.password,
        expertise: params.expertise,
        bio: params.bio,
      );
      // log("singed up user: $user");

      return user; // Return success as Right with null value
    } catch (e) {
      return const Left(ServerFailure('Error registering user'));
    }
  }
}

class RegisterUserParams {
  final String fullName;
  final String email;
  final String password;
  final String expertise;
  final String bio;

  RegisterUserParams({
    required this.fullName,
    required this.email,
    required this.password,
    required this.expertise,
    required this.bio,
  });
}
