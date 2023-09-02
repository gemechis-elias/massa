import 'dart:io';

import 'package:smart_gebere/features/blog/presentation/blocs/bloc_event.dart';

class CreateBlogEvent extends BlogEvent {
  final String title;
  final String subTitle;
  final String tags;
  final String content;
  final File image;

  const CreateBlogEvent({
    required this.title,
    required this.subTitle,
    required this.tags,
    required this.content,
    required this.image,
  });

  @override
  List<Object> get props => [];
}
