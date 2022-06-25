//USER MODEL TO RETRIEVE API DATA
class User {
   int? userId;
   int? id;
   String? title;

  User({
    this.userId,
    this.id,
    this.title,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      userId: json['userId'],
      id: json['id'],
      title: json['title'],
    );
  }
}