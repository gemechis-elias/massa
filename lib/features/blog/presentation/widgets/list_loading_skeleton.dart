import 'package:flutter/material.dart';
import 'package:skeletons/skeletons.dart';

class ListLoading extends StatefulWidget {
  const ListLoading({super.key});

  @override
  State<ListLoading> createState() => _ListLoadingState();
}

class _ListLoadingState extends State<ListLoading> {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding:
            const EdgeInsets.only(bottom: 9), // Adjust the padding as needed
        child: InkWell(
          onTap: () {},
          child: Container(
            height: 160,
            width: double.infinity,
            padding: const EdgeInsets.fromLTRB(15, 5, 15, 5),
            child: Column(
              children: <Widget>[
                Expanded(
                  child: Row(
                    children: <Widget>[
                      Card(
                          margin: const EdgeInsets.all(0),
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          clipBehavior: Clip.antiAliasWithSaveLayer,
                          child: SizedBox(
                            height: 130,
                            width: 130,
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
                          )),
                      Container(width: 5),
                      Expanded(
                        child: Column(
                          children: <Widget>[
                            Container(height: 15),
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
                            Container(height: 5),
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
                            Container(height: 20),
                            Row(
                              //    mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Container(width: 24),
                                SizedBox(
                                  width: 50,
                                  height: 15,
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
                            Container(height: 10),
                            Row(
                              children: <Widget>[
                                Container(width: 24),
                                SizedBox(
                                  width: 50,
                                  height: 15,
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
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                //        const Divider(height: 0)
              ],
            ),
          ),
        ));
  }
}
