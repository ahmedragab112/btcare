class SignupPatienBody {
  String? username;
  String? email;
  String? password;
  String? confirmPassword;

  SignupPatienBody(
      {this.username, this.email, this.password, this.confirmPassword});

  SignupPatienBody.fromJson(Map<String, dynamic> json) {
    username = json['username'];
    email = json['email'];
    password = json['password'];
    confirmPassword = json['confirm_password'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['username'] = username;
    data['email'] = email;
    data['password'] = password;
    data['confirm_password'] = confirmPassword;
    return data;
  }
}
