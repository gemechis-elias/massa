import 'package:smart_gebere/features/blog/domain/entities/article.dart';
import 'package:smart_gebere/features/user/presentation/widgets/post_list.dart';
import 'package:smart_gebere/features/user/presentation/widgets/post_list_grid.dart';
import 'package:flutter/material.dart';
import 'package:skeletons/skeletons.dart';

Widget blogListView(
    bool showGridView, List<Article> blogs, List<Article> gridBlogs) {
  if (blogs.isEmpty) {
    return Container(
      height: 100,
      width: double.infinity,
      padding: const EdgeInsets.fromLTRB(15, 5, 15, 5),
      child: Column(
        children: <Widget>[
          Expanded(
            child: Row(
              children: <Widget>[
                SizedBox(
                  height: 160,
                  width: 100,
                  child: SkeletonItem(
                    child: Container(
                      height: double.infinity,
                      width: double.infinity,
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Color(0xFF222222),
                            Color(0xFF242424),
                            Color(0xFF2B2B2B),
                            Color(0xFF242424),
                            Color(0xFF222222),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Container(width: 20),
                Expanded(
                  child: Column(
                    crossAxisAlignment:
                        CrossAxisAlignment.start, // Align text to the left
                    children: <Widget>[
                      Container(height: 65),
                      SizedBox(
                        height: 20,
                        width: 150,
                        child: SkeletonItem(
                          child: Container(
                            height: double.infinity,
                            width: double.infinity,
                            decoration: const BoxDecoration(
                              gradient: LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: [
                                  Color(0xFF222222),
                                  Color(0xFF242424),
                                  Color(0xFF2B2B2B),
                                  Color(0xFF242424),
                                  Color(0xFF222222),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            top: 6.0, bottom: 8.0, left: 0, right: 8.0),
                        child: SizedBox(
                          height: 20,
                          width: 150,
                          child: SkeletonItem(
                            child: Container(
                              height: double.infinity,
                              width: double.infinity,
                              decoration: const BoxDecoration(
                                gradient: LinearGradient(
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                  colors: [
                                    Color(0xFF222222),
                                    Color(0xFF242424),
                                    Color(0xFF2B2B2B),
                                    Color(0xFF242424),
                                    Color(0xFF222222),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                        width: 150,
                        child: SkeletonItem(
                          child: Container(
                            height: double.infinity,
                            width: double.infinity,
                            decoration: const BoxDecoration(
                              gradient: LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: [
                                  Color(0xFF222222),
                                  Color(0xFF242424),
                                  Color(0xFF2B2B2B),
                                  Color(0xFF242424),
                                  Color(0xFF222222),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          Container(height: 10),
          const Divider(height: 0),
        ],
      ),
    );
  } else {
    return showGridView
        ? GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
            ),
            itemCount: gridBlogs.length,
            itemBuilder: (context, index) {
              return BlogGridCards(index: index, object: gridBlogs[index]);
            },
          )
        : ListView.builder(
            itemCount: blogs.length,
            itemBuilder: (context, index) {
              return BlogCards(index: index, object: blogs[index]);
            },
          );
  }
}
