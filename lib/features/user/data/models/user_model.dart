class UserModel {
  String? sId;
  String? fullName;
  String? email;
  String? expertise;
  String? bio;
  String? createdAt;
  int? iV;
  String? image;
  String? imageCloudinaryPublicId;
  List<Articles>? articles;
  String? id;

  UserModel(
      {this.sId,
      this.fullName,
      this.email,
      this.expertise,
      this.bio,
      this.createdAt,
      this.iV,
      this.image,
      this.imageCloudinaryPublicId,
      this.articles,
      this.id});

  UserModel.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    fullName = json['fullName'];
    email = json['email'];
    expertise = json['expertise'];
    bio = json['bio'];
    createdAt = json['createdAt'];
    iV = json['__v'];
    image = json['image'];
    imageCloudinaryPublicId = json['imageCloudinaryPublicId'];
    if (json['articles'] != null) {
      articles = <Articles>[];
      json['articles'].forEach((v) {
        articles!.add(new Articles.fromJson(v));
      });
    }
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
    if (this.articles != null) {
      data['articles'] = this.articles!.map((v) => v.toJson()).toList();
    }
    data['id'] = this.id;
    return data;
  }
}

class Articles {
  String? sId;
  List<String>? tags;
  String? content;
  String? title;
  String? subTitle;
  String? estimatedReadTime;
  String? user;
  String? image;
  String? imageCloudinaryPublicId;
  String? createdAt;
  int? iV;
  String? id;

  Articles(
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

  Articles.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    tags = json['tags'].cast<String>();
    content = json['content'];
    title = json['title'];
    subTitle = json['subTitle'];
    estimatedReadTime = json['estimatedReadTime'];
    user = json['user'];
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
    data['user'] = this.user;
    data['image'] = this.image;
    data['imageCloudinaryPublicId'] = this.imageCloudinaryPublicId;
    data['createdAt'] = this.createdAt;
    data['__v'] = this.iV;
    data['id'] = this.id;
    return data;
  }
}
