class Post {
  String id;
  String title;
  String date;
  String content;
  String img_url;

  Post(this.id, this.title, this.date, this.content, this.img_url);

  Post.fromJson(Map<String, dynamic> json)
    : id = json['id'],
        title = json['title'],
      date = json['date'],
      content = json['content'],
      img_url = json['img_url'];

  Map<String, dynamic> toJson() => {
    'id' : id,
    'title' : title,
    'date' : date,
    'content' : content,
    'img_url' : img_url,
  };
}