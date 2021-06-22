class Post {
  String userId;
  String title;
  String date;
  String content;
  String img_url;

  Post(this.userId, this.title, this.date, this.content, this.img_url);

  Post.fromJson(Map<String, dynamic> json)
    : userId = json['userId'],
        title = json['title'],
      date = json['date'],
      content = json['content'],
      img_url = json['img_url'];

  Map<String, dynamic> toJson() => {
    'userId' : userId,
    'title' : title,
    'date' : date,
    'content' : content,
    'img_url' : img_url,
  };
}