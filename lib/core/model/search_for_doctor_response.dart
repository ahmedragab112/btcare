// ignore_for_file: prefer_void_to_null

class SearchForDoctorResponse {
  String? username;
  Null email;
  Null image;
  Null name;
  String? bio;
  Null location;
  Null birthDate;

  SearchForDoctorResponse(
      {this.username,
      this.email,
      this.image,
      this.name,
      this.bio,
      this.location,
      this.birthDate});

  SearchForDoctorResponse.fromJson(Map<String, dynamic> json) {
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
