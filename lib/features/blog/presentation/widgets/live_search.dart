import 'package:smart_gebere/features/blog/domain/entities/article.dart';
import 'package:smart_gebere/features/blog/presentation/blocs/bloc.dart';
import 'package:smart_gebere/features/blog/presentation/blocs/bloc_event.dart';
import 'package:smart_gebere/features/blog/presentation/blocs/bloc_state.dart';
import 'package:smart_gebere/features/blog/presentation/widgets/home_card.dart';
import 'package:smart_gebere/features/blog/presentation/widgets/list_loading_skeleton.dart';
import 'package:smart_gebere/features/onboarding/widgets/loading_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LiveSearch extends StatefulWidget {
  final String title;

  const LiveSearch({super.key, required this.title});

  @override
  State<LiveSearch> createState() => _LiveSearchState();
}

class _LiveSearchState extends State<LiveSearch> {
  @override
  void initState() {
    super.initState();
    context.read<BlogBloc>().add(const GetAllArticlesEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: BlocBuilder<BlogBloc, BlogState>(
        builder: (context, state) {
          if (state is BlogLoading) {
            return ListView.builder(
              itemCount: 7,
              itemBuilder: (context, index) {
                return const ListLoading();
              },
            );
          } else if (state is BlogError) {
            return const Center(
              child: Text('Error loading articles'),
            );
          } else if (state is BlogInitial) {
            context.read<BlogBloc>().add(const GetAllArticlesEvent());
            return loadingDialog(context);
          } else if (state is LoadedGetBlogState) {
            List<Article> allArticles = state.articles;

// Sort the articles using the custom comparator
            allArticles.sort(Article.compareByCreatedAt);

            allArticles = state.articles
                .where((article) =>
                    article.title != null &&
                    article.title!.contains(widget.title))
                .toList();

            if (allArticles.isEmpty) {
              return const Center(
                child: Text('No articles'),
              );
            } else {
              return ListView.builder(
                itemCount: allArticles.length,
                itemBuilder: (context, index) {
                  return CustomizedCard(
                    article: allArticles[index],
                  );
                },
              );
            }
          } else {
            return const Center(
              child: Text('No articles'),
            );
          }
        },
      ),
    );
  }
}
