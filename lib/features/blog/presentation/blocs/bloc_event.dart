import 'package:equatable/equatable.dart';

abstract class BlogEvent extends Equatable {
  const BlogEvent();

  @override
  List<Object> get props => [];
}

class GetAllArticlesEvent extends BlogEvent {
  const GetAllArticlesEvent();
}
