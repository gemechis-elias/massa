import 'package:smart_gebere/features/blog/presentation/blocs/bloc_state.dart';

class TagLoading extends BlogState {}

class LoadedTagsState extends BlogState {
  final List<String> tags;

  const LoadedTagsState(this.tags);

  @override
  List<Object> get props => [tags];
}
