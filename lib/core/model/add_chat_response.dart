// ignore_for_file: prefer_void_to_null

class AddChatResponse {
  int? id;
  PatientProfile? patientProfile;
  PatientProfile? doctorProfile;

  AddChatResponse({this.id, this.patientProfile, this.doctorProfile});

  AddChatResponse.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    patientProfile = json['patient_profile'] != null
        ? PatientProfile.fromJson(json['patient_profile'])
        : null;
    doctorProfile = json['doctor_profile'] != null
        ? PatientProfile.fromJson(json['doctor_profile'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    if (patientProfile != null) {
      data['patient_profile'] = patientProfile!.toJson();
    }
    if (doctorProfile != null) {
      data['doctor_profile'] = doctorProfile!.toJson();
    }
    return data;
  }
}

class PatientProfile {
  String? username;
  String? email;
  String? image;
  String? name;
  String? bio;
  String? location;
  String? birthDate;

  PatientProfile(
      {this.username,
      this.email,
      this.image,
      this.name,
      this.bio,
      this.location,
      this.birthDate});

  PatientProfile.fromJson(Map<String, dynamic> json) {
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
