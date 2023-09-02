import 'package:smart_gebere/core/utils/human_readable_time.dart';
import 'package:smart_gebere/features/blog/domain/entities/article.dart';
import 'package:smart_gebere/features/blog/presentation/screen/editBlog.dart';
import 'package:smart_gebere/features/blog/presentation/screen/viewBlog.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../widgets/like_button.dart';

class BlogCards extends StatelessWidget {
  final Article object;
  final int index;

  const BlogCards({
    Key? key,
    required this.index,
    required this.object,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Padding(
        padding: const EdgeInsets.only(
            bottom: 10, left: 10, right: 10), // Adjust the padding as needed
        child: InkWell(
          onTap: () {
            //navigate to ViewBlog() without named
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => EditBlog(
                  article: object,
                ),
              ),
            );
          },
          child: Container(
            height: 180,
            width: double.infinity,
            padding: const EdgeInsets.fromLTRB(15, 5, 15, 5),
            decoration: BoxDecoration(
              color: Colors.white, // Set the background color
              borderRadius: BorderRadius.circular(10), // Set the border radius
              boxShadow: const [
                BoxShadow(
                  color: Color.fromRGBO(149, 157, 165, 0.2),
                  blurRadius: 24,
                  offset: Offset(0, 8),
                ),
              ],
            ),
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
                        child: CachedNetworkImage(
                          imageUrl: object.image!,
                          // height: 120,
                          // width: 100,
                          height: screenHeight * 0.14,
                          width: screenWidth * 0.25,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Container(width: 20),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment
                              .start, // Align text to the left
                          children: <Widget>[
                            Container(height: 25),
                            Text(
                              object.title!,
                              maxLines: 1,
                              style: const TextStyle(
                                color: Color.fromARGB(255, 70, 66, 66),
                                fontWeight: FontWeight.w200,
                                fontSize: 18,
                                fontFamily: 'Urbanist',
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  top: 6.0, bottom: 8.0, left: 0, right: 8.0),
                              child: Text(
                                object.content!,
                                maxLines: 2,
                                style: TextStyle(
                                  color: Colors.grey[800],
                                  fontWeight: FontWeight.w500,
                                  fontSize: 15,
                                  fontFamily: 'Urbanist',
                                ),
                              ),
                            ),
                            Row(
                              children: <Widget>[
                                LikeButton(
                                  initialLikes: 2,
                                  onLikeChanged: (isLiked, likes) {
                                    print('Is Liked: $isLiked,K: $likes');
                                  },
                                ),
                                const Spacer(),
                                const FaIcon(FontAwesomeIcons.clock,
                                    size: 16, color: Colors.grey),
                                Padding(
                                  padding: const EdgeInsets.only(left: 8.0),
                                  child: Text(
                                    "jan 1, 2023",
                                    style: TextStyle(
                                      color: Colors.grey[400],
                                      fontSize: 12,
                                    ),
                                  ),
                                ),
                                const Spacer(),
                                const FaIcon(FontAwesomeIcons.solidBookmark)
                              ],
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                Container(height: 10),
              ],
            ),
          ),
        ));
  }
}
