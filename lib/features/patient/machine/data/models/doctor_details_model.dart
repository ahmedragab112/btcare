class DoctorDetailsModel {
  int? id;
  String? username;
  String? email;
  String? image;
  String? about;
  String? workingTime;
  String? location;

  DoctorDetailsModel(
      {this.id,
      this.username,
      this.email,
      this.image,
      this.about,
      this.workingTime,
      this.location});

  DoctorDetailsModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    username = json['username'];
    email = json['email'];
    image = json['image'];
    about = json['about'];
    workingTime = json['working_time'];
    location = json['location'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['username'] = this.username;
    data['email'] = this.email;
    data['image'] = this.image;
    data['about'] = this.about;
    data['working_time'] = this.workingTime;
    data['location'] = this.location;
    return data;
  }
}
