class UpdateProfileResponse {
  String? username;
  String? email;
  String? image;
  String? name;
  String? bio;
  String? location;
  String? birthDate;

  UpdateProfileResponse(
      {this.username,
      this.email,
      this.image,
      this.name,
      this.bio,
      this.location,
      this.birthDate});

  UpdateProfileResponse.fromJson(Map<String, dynamic> json) {
    username = json['username'];
    email = json['email'];
    image = json['image'];
    name = json['name'];
    bio = json['bio'];
    location = json['location'];
    birthDate = json['birth_date'];
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
    return data;
  }
}
