class BlogModel {
  final List<String> tags;
  final String content;
  final String title;
  final String subTitle;
  final String estimatedReadTime;
  final String user;
  final String image;
  final String imageCloudinaryPublicId;
  final String id;
  final DateTime createdAt;

  BlogModel({
    required this.tags,
    required this.content,
    required this.title,
    required this.subTitle,
    required this.estimatedReadTime,
    required this.user,
    required this.image,
    required this.imageCloudinaryPublicId,
    required this.id,
    required this.createdAt,
  });

  factory BlogModel.fromJson(Map<String, dynamic> json) {
    return BlogModel(
      tags: List<String>.from(json['tags']),
      content: json['content'],
      title: json['title'],
      subTitle: json['subTitle'],
      estimatedReadTime: json['estimatedReadTime'],
      user: json['user'],
      image: json['image'],
      imageCloudinaryPublicId: json['imageCloudinaryPublicId'],
      id: json['_id'],
      createdAt: DateTime.parse(json['createdAt']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'tags': tags,
      'content': content,
      'title': title,
      'subTitle': subTitle,
      'estimatedReadTime': estimatedReadTime,
      'user': user,
      'image': image,
      'imageCloudinaryPublicId': imageCloudinaryPublicId,
      '_id': id,
      'createdAt': createdAt.toIso8601String(),
    };
  }
}
