class LoginDoctorResponse {
  String? status;
  String? message;
  Data? data;

  LoginDoctorResponse({this.status, this.message, this.data});

  LoginDoctorResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  String? token;
  int? userId;
  String? username;
  String? email;
  String? profileUrl;
  bool? isDoctor;
  bool? isApprovedDoctor;

  Data(
      {this.token,
      this.userId,
      this.username,
      this.email,
      this.profileUrl,
      this.isDoctor,
      this.isApprovedDoctor});

  Data.fromJson(Map<String, dynamic> json) {
    token = json['token'];
    userId = json['user_id'];
    username = json['username'];
    email = json['email'];
    profileUrl = json['profile_url'];
    isDoctor = json['is_doctor'];
    isApprovedDoctor = json['is_approved_doctor'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['token'] = token;
    data['user_id'] = userId;
    data['username'] = username;
    data['email'] = email;
    data['profile_url'] = profileUrl;
    data['is_doctor'] = isDoctor;
    data['is_approved_doctor'] = isApprovedDoctor;
    return data;
  }
}
