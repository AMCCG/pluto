class User {
  final String email;
  final String userName;

  User({required this.email, required this.userName});

  User.fromJson(Map<String, dynamic> json)
      : email = json['email'],
        userName = json['userName'];

  Map<String, dynamic> toJson() => {
        'email': email,
        'userName': userName,
      };
}
