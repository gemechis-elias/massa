import 'package:smart_gebere/features/user/presentation/blocs/bloc_event.dart';

class RegisterUserEvent extends UserEvent {
  final String fullName;
  final String email;
  final String password;
  final String expertise;
  final String bio;

  RegisterUserEvent({
    required this.fullName,
    required this.email,
    required this.password,
    required this.expertise,
    required this.bio,
  });
}
