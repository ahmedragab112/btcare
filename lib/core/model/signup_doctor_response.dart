class SignUpDoctorResponse {
  String? status;
  String? message;
  Data? data;

  SignUpDoctorResponse({this.status, this.message, this.data});

  SignUpDoctorResponse.fromJson(Map<String, dynamic> json) {
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
  int? id;
  String? username;
  String? email;
  String? token;
  bool? isDoctor;
  bool? isApprovedDoctor;
  String? certificateImage;

  Data(
      {this.id,
      this.username,
      this.email,
      this.token,
      this.isDoctor,
      this.isApprovedDoctor,
      this.certificateImage});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    username = json['username'];
    email = json['email'];
    token = json['token'];
    isDoctor = json['is_doctor'];
    isApprovedDoctor = json['is_approved_doctor'];
    certificateImage = json['certificate_image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['username'] = username;
    data['email'] = email;
    data['token'] = token;
    data['is_doctor'] = isDoctor;
    data['is_approved_doctor'] = isApprovedDoctor;
    data['certificate_image'] = certificateImage;
    return data;
  }
}
