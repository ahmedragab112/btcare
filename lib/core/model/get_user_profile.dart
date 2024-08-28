class GetUserProfileResponse {
  String? username;
  String? email;
  String? image;
  String? name;
  String? bio;
  String? location;
  String? birthDate;
  User? user;

  GetUserProfileResponse(
      {this.username,
      this.email,
      this.image,
      this.name,
      this.bio,
      this.location,
      this.birthDate,
      this.user});

  GetUserProfileResponse.fromJson(Map<String, dynamic> json) {
    username = json['username'];
    email = json['email'];
    image = json['image'];
    name = json['name'];
    bio = json['bio'];
    location = json['location'];
    birthDate = json['birth_date'];
    user = json['user'] != null ? User.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['username'] = username;
    data['email'] = email;
    data['image'] = image;
    data['name'] = name;
    data['bio'] = bio;
    data['location'] = location;
    data['birth_date'] = birthDate;
    if (user != null) {
      data['user'] = user!.toJson();
    }
    return data;
  }
}

class User {
  int? userId;
  String? username;
  String? email;

  User({this.userId, this.username, this.email});

  User.fromJson(Map<String, dynamic> json) {
    userId = json['user_id'];
    username = json['username'];
    email = json['email'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['user_id'] = userId;
    data['username'] = username;
    data['email'] = email;
    return data;
  }
}
