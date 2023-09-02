import 'dart:io';

import 'package:smart_gebere/core/error/failure.dart';
import 'package:dartz/dartz.dart';

import '../repositories/user_repository.dart';

class UpdateProfilePhotoUseCase {
  final UserRepository repository;

  UpdateProfilePhotoUseCase(this.repository);

  Future<Either<Failure, void>> call(UpdateProfilePhotoParams params) async {
    final userData = {
      'user_id': params.user_id,
      'image': params.image,
    };
    try {
      await repository.updateProfilePhoto(userData);
      return const Right(null); // Return success as Right with null value
    } catch (e) {
      return const Left(ServerFailure('Error updating profile photo'));
    }
  }
}

class UpdateProfilePhotoParams {
  final String user_id;
  final File image;

  UpdateProfilePhotoParams({
    required this.user_id,
    required this.image,
  });
}
