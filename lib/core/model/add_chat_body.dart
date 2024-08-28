class AddChatBody {
  String? patient;
  String? doctor;

  AddChatBody({this.patient, this.doctor});

  AddChatBody.fromJson(Map<String, dynamic> json) {
    patient = json['patient'];
    doctor = json['doctor'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['patient'] = patient;
    data['doctor'] = doctor;
    return data;
  }
}
