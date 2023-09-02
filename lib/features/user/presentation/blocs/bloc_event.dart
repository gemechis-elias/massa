import 'package:equatable/equatable.dart';

abstract class UserEvent extends Equatable {
  const UserEvent();

  @override
  List<Object> get props => [];
}

class UpdateProfilePhotoEvent extends UserEvent {
  final String userId;
  final String imageUrl;
  final String imagePublicId;

  const UpdateProfilePhotoEvent({
    required this.userId,
    required this.imageUrl,
    required this.imagePublicId,
  });
}
