import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:smart_gebere/core/error/failure.dart';
import 'package:smart_gebere/features/user/domain/entities/user.dart';
import 'package:smart_gebere/features/user/domain/usecases/get_user.dart';
import 'package:smart_gebere/features/user/domain/usecases/login_user.dart';
import 'package:smart_gebere/features/user/domain/usecases/register_user.dart';
import 'package:smart_gebere/features/user/domain/usecases/update_user.dart';
import 'package:smart_gebere/features/user/presentation/blocs/bloc_state.dart';
import 'package:smart_gebere/features/user/presentation/blocs/bloc_event.dart';
import 'package:smart_gebere/features/user/presentation/blocs/get_user.dart/user_event.dart';
import 'package:smart_gebere/features/user/presentation/blocs/get_user.dart/user_state.dart';
import 'package:smart_gebere/features/user/presentation/blocs/login/login_event.dart';
import 'package:smart_gebere/features/user/presentation/blocs/login/login_state.dart';
import 'package:smart_gebere/features/user/presentation/blocs/singup/signup_event.dart';
import 'package:smart_gebere/features/user/presentation/blocs/singup/signup_state.dart';
import 'package:dartz/dartz.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final RegisterUserUseCase registerUser;
  final LoginUserUseCase loginUser;
  final GetUserUseCase getUser;
  final UpdateProfilePhotoUseCase updateProfilePhoto;

  UserBloc({
    required this.registerUser,
    required this.loginUser,
    required this.getUser,
    required this.updateProfilePhoto,
  }) : super(UserInitial()) {
    on<RegisterUserEvent>((event, emit) async {
      emit(UserLoading());
      try {
        final Either<Failure, User> result =
            await registerUser(RegisterUserParams(
          fullName: event.fullName,
          email: event.email,
          password: event.password,
          expertise: event.expertise,
          bio: event.bio,
        ));

        // emit UserSignedInState
        emit(result.fold(
          (failure) => UserError(_mapFailureToMessage(failure)),
          (user) => UserSignedInState(user),
        ));
      } catch (e) {
        emit(const UserError('Error registering user'));
      }
    });

    on<LoginUserEvent>((event, emit) async {
      emit(UserLoading()); // Emit UserLoading state here

      try {
        final Either<Failure, User> result = await loginUser(
          email: event.email,
          password: event.password,
        );
        emit(result.fold(
          (failure) => UserError(_mapFailureToMessage(failure)),
          (user) => LoadedUserState(user),
        ));
      } catch (e) {
        emit(UserError(
            _mapFailureToMessage(const ServerFailure('Error logging in'))));
      }
    });

    on<GetUserEvent>((event, emit) async {
      emit(UserLoading()); // Emit UserLoading state here

      try {
        final Either<Failure, User> result = await getUser();
        log("User fetched on bloc $result");
        emit(result.fold(
          (failure) => UserError(_mapFailureToMessage(failure)),
          (user) => LoadedGetUserState(user),
        ));
      } catch (e) {
        emit(UserError(
            _mapFailureToMessage(const ServerFailure('Error fetching user'))));
      }
    });
  }
  String _mapFailureToMessage(Failure failure) {
    return 'An Bloc error occurred $failure';
  }
}
