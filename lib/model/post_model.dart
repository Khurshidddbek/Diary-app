class Post {
  String title;
  String date;
  String content;

  Post(this.title, this.date, this.content);

  Post.fromJson(Map<String, dynamic> json)
    : title = json['title'],
      date = json['date'],
      content = json['content'];

  Map<String, dynamic> toJson() => {
    'title' : title,
    'date' : date,
    'content' : content,
  };
}