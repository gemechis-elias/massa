import 'package:smart_gebere/features/user/domain/entities/user.dart';
import 'package:equatable/equatable.dart';

abstract class UserState extends Equatable {
  const UserState();

  @override
  List<Object> get props => [];
}

class UserInitial extends UserState {}

class UserLoading extends UserState {}

// class UserLoaded extends UserState {
//   final User user;

//   UserLoaded(this.user);
// }

class UserError extends UserState {
  final String errorMessage;

  const UserError(this.errorMessage);
  @override
  List<Object> get props => [errorMessage];
}
