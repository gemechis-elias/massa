import 'dart:developer';

import 'package:smart_gebere/features/blog/domain/entities/article.dart';
import 'package:smart_gebere/features/blog/domain/usecases/create_article.dart';
import 'package:smart_gebere/features/blog/domain/usecases/delete_article.dart';
import 'package:smart_gebere/features/blog/domain/usecases/get_all_articles.dart';
import 'package:smart_gebere/features/blog/domain/usecases/get_single_article.dart';
import 'package:smart_gebere/features/blog/domain/usecases/get_tags.dart';
import 'package:smart_gebere/features/blog/presentation/blocs/bloc.dart';
import 'package:smart_gebere/features/blog/presentation/blocs/bloc_event.dart';
import 'package:smart_gebere/features/blog/presentation/blocs/bloc_state.dart';
import 'package:smart_gebere/features/blog/presentation/blocs/create_blog/create_blod_state.dart';
import 'package:smart_gebere/features/blog/presentation/widgets/edit_inputForm.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../injection.dart';
import '../widgets/inputForm.dart';

class EditBlog extends StatefulWidget {
  final Article article;

  const EditBlog({super.key, required this.article});

  @override
  State<EditBlog> createState() => _EditBlogState();
}

class _EditBlogState extends State<EditBlog> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => BlogBloc(
              createArticle: sl<CreateArticleUseCase>(),
              getAllArticle: sl<GetArticleUseCase>(),
              getSingleArticle: sl<GetSingleArticleUseCase>(),
              getTags: sl<GetTagsUseCase>(),
              deleteArticle: sl<DeleteArticleUseCase>(),
            ),
        child: BlocConsumer<BlogBloc, BlogState>(
          listener: (context, state) {
            if (state is BlogInitial) {
              // Navigator.pushNamed(context, '/home', arguments: state.user.id);
              log('initial state');
            }
            // loading state
            else if (state is CreatingBlogState) {
              log('creating blog state');
            } else if (state is CreatedBlogState) {
              log('CREATED blog state');

              // snackbar with success
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  backgroundColor: Colors.green,
                  content: Text('Article created successfully'),
                ),
              );
            } else if (state is BlogError) {
              // Handle error if login fails
              // ScaffoldMessenger.of(context).showSnackBar(
              //   SnackBar(
              //     backgroundColor: Colors.red,
              //     content: Text(state.errorMessage),
              //   ),
              // );
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  backgroundColor: Colors.green,
                  content: Text('Article created successfully'),
                ),
              );
              // set state is loading
            } else {
              log('else state');
            }
          },
          builder: (context, state) {
            return buildBody(context);
          },
        ));
  }

  Widget buildBody(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: SafeArea(
        child: Container(
          margin: const EdgeInsets.fromLTRB(40, 40, 40, 20),
          child: Column(
            children: [
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: 36,
                    height: 38,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: const Color(0xffEAEBF0),
                    ),
                    child: IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(
                        Icons.arrow_back_ios,
                        size: 25,
                      ),
                    ),
                  ),
                  const Text(
                    "Edit Article",
                    style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w600,
                        fontFamily: "poppins"),
                  ),
                  Container()
                  // Spacer(),
                ],
              ),
              Container(
                  padding: const EdgeInsets.fromLTRB(0, 50, 0, 0),
                  child: EditInputForm(
                    article: widget.article,
                  )),
            ],
          ),
        ),
      ),
    ));
  }
}
