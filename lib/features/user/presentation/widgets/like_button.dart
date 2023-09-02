import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class LikeButton extends StatelessWidget {
  final int initialLikes;
  final void Function(bool isLiked, int likes) onLikeChanged;

  const LikeButton({
    Key? key,
    required this.initialLikes,
    required this.onLikeChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          icon: FaIcon(
            FontAwesomeIcons.thumbsUp,
            size: 17,
          ),
          onPressed: () {
            onLikeChanged(true, initialLikes + 1);
          },
        ),
        // SizedBox(width: 5),
        Text('$initialLikes K'),
      ],
    );
  }
}
