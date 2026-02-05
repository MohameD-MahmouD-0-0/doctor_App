class RegisterRequest {
  RegisterRequest(
    this.name,
    this.email,
    this.phone,
    this.gender,
    this.password,
    this.password_confirmation,
  );

  RegisterRequest.fromJson(dynamic json) {
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
    gender = json['gender'];
    password = json['password'];
    password_confirmation = json['password_confirmation'];
  }

  String? name;
  String? email;
  String? phone;
  String? gender;
  String? password;
  String? password_confirmation;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = name;
    map['email'] = email;
    map['phone'] = phone;
    map['gender'] = gender;
    map['password'] = password;
    map['password_confirmation'] = password_confirmation;
    return map;
  }
}
