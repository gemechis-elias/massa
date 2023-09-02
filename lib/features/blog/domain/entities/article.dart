class Article {
  String? sId;
  List<String>? tags;
  String? content;
  String? title;
  String? subTitle;
  String? estimatedReadTime;
  User? user;
  String? image;
  String? imageCloudinaryPublicId;
  String? createdAt;
  int? iV;
  String? id;

  Article(
      {this.sId,
      this.tags,
      this.content,
      this.title,
      this.subTitle,
      this.estimatedReadTime,
      this.user,
      this.image,
      this.imageCloudinaryPublicId,
      this.createdAt,
      this.iV,
      this.id});
  static int compareByCreatedAt(Article a, Article b) {
    DateTime aDate = DateTime.parse(a.createdAt!);
    DateTime bDate = DateTime.parse(b.createdAt!);
    return bDate.compareTo(aDate); // Sort in descending order (newest first)
  }

  Article.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    tags = json['tags'].cast<String>();
    content = json['content'];
    title = json['title'];
    subTitle = json['subTitle'];
    estimatedReadTime = json['estimatedReadTime'];
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
    image = json['image'];
    imageCloudinaryPublicId = json['imageCloudinaryPublicId'];
    createdAt = json['createdAt'];
    iV = json['__v'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['tags'] = this.tags;
    data['content'] = this.content;
    data['title'] = this.title;
    data['subTitle'] = this.subTitle;
    data['estimatedReadTime'] = this.estimatedReadTime;
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    data['image'] = this.image;
    data['imageCloudinaryPublicId'] = this.imageCloudinaryPublicId;
    data['createdAt'] = this.createdAt;
    data['__v'] = this.iV;
    data['id'] = this.id;
    return data;
  }
}

class User {
  String? sId;
  String? fullName;
  String? email;
  String? expertise;
  String? bio;
  String? createdAt;
  int? iV;
  String? image;
  String? imageCloudinaryPublicId;
  String? id;

  User(
      {this.sId,
      this.fullName,
      this.email,
      this.expertise,
      this.bio,
      this.createdAt,
      this.iV,
      this.image,
      this.imageCloudinaryPublicId,
      this.id});

  User.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    fullName = json['fullName'];
    email = json['email'];
    expertise = json['expertise'];
    bio = json['bio'];
    createdAt = json['createdAt'];
    iV = json['__v'];
    image = json['image'];
    imageCloudinaryPublicId = json['imageCloudinaryPublicId'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['fullName'] = this.fullName;
    data['email'] = this.email;
    data['expertise'] = this.expertise;
    data['bio'] = this.bio;
    data['createdAt'] = this.createdAt;
    data['__v'] = this.iV;
    data['image'] = this.image;
    data['imageCloudinaryPublicId'] = this.imageCloudinaryPublicId;
    data['id'] = this.id;
    return data;
  }
}
