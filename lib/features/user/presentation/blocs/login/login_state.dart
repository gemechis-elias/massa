import 'package:smart_gebere/features/user/domain/entities/user.dart';
import 'package:smart_gebere/features/user/presentation/blocs/bloc_state.dart';

class LoadedUserState extends UserState {
  final User user;

  const LoadedUserState(this.user);

  @override
  List<Object> get props => [user];
}
