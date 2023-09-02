import 'package:smart_gebere/features/blog/domain/entities/article.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class MiniBlogInfo extends StatelessWidget {
  final Article object;
  const MiniBlogInfo({
    super.key,
    required this.object,
  });

  @override
  Widget build(BuildContext context) {
    final now = DateTime.now();
    final difference = now.difference(DateTime.parse(object.createdAt!));

    String formattedDifference = '';

    if (difference.inDays >= 1) {
      formattedDifference = DateFormat.yMMMd()
          .format(DateTime.parse(object.createdAt!)); // Format as 'MMM d, y'
    } else if (difference.inHours >= 1) {
      formattedDifference = '${difference.inHours} hours ago';
    } else if (difference.inMinutes >= 1) {
      formattedDifference = '${difference.inMinutes} minutes ago';
    } else {
      formattedDifference = 'Just now';
    }

    return Row(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(10), // Image border
          child: SizedBox.fromSize(
            size: const Size.fromRadius(20), // Image radius
            child: profileImage(object.image!),
          ),
        ),
        Container(
          padding: const EdgeInsets.only(left: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                object.user!.fullName!,
                style: const TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                    color: Color(0xff2D4379)),
              ),
              Text(
                formattedDifference,
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  color: Color(0xff7B8BB2),
                ),
              )
            ],
          ),
        ),
      ],
    );
  }

  Widget profileImage(String image) {
    var profileImage;
    if (image != null && Uri.parse(image).isAbsolute) {
      profileImage = CachedNetworkImage(
        imageUrl: image,
        width: 42,
        height: 42,
        fit: BoxFit.cover,
        placeholder: (context, url) => Image.asset(
          "assets/images/no_profile.png",
          width: 42,
          height: 42,
          fit: BoxFit.cover,
        ),
        errorWidget: (context, url, error) => Image.asset(
          "assets/images/no_profile.png",
          width: 42,
          height: 42,
          fit: BoxFit.cover,
        ),
      );
    } else {
      profileImage = Image.asset(
        "assets/images/no_profile.png",
        width: 42,
        height: 42,
        fit: BoxFit.cover,
      );
    }
    return profileImage;
  }
}
