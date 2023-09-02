import 'package:smart_gebere/features/blog/domain/entities/article.dart';
import 'package:equatable/equatable.dart';

abstract class BlogState extends Equatable {
  const BlogState();

  @override
  List<Object> get props => [];
}

class BlogInitial extends BlogState {}

class BlogLoading extends BlogState {}

class BlogError extends BlogState {
  final String errorMessage;

  BlogError(this.errorMessage);

  @override
  List<Object> get props => [errorMessage];
}

class LoadedGetBlogState extends BlogState {
  final List<Article> articles;

  const LoadedGetBlogState(this.articles);

  @override
  List<Object> get props => [articles];
}
