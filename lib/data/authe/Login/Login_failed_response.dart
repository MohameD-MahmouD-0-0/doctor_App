/// message : "Unprocessable Entity"
/// data : {"name":["The name field is required."],"email":["The email field is required."],"phone":["The phone field is required."],"gender":["The sex field is required."],"password":["The password field is required."]}
/// status : false
/// code : 422

class LoginFailedResponse {
  LoginFailedResponse({
      this.message, 
      this.data, 
      this.status, 
      this.code,});

  LoginFailedResponse.fromJson(dynamic json) {
    message = json['message'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
    status = json['status'];
    code = json['code'];
  }
  String? message;
  Data? data;
  bool? status;
  int? code;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = message;
    if (data != null) {
      map['data'] = data?.toJson();
    }
    map['status'] = status;
    map['code'] = code;
    return map;
  }

}

/// name : ["The name field is required."]
/// email : ["The email field is required."]
/// phone : ["The phone field is required."]
/// gender : ["The sex field is required."]
/// password : ["The password field is required."]

class Data {
  Data({
      this.name, 
      this.email, 
      this.phone, 
      this.gender, 
      this.password,});

  Data.fromJson(dynamic json) {
    name = json['name'] != null ? json['name'].cast<String>() : [];
    email = json['email'] != null ? json['email'].cast<String>() : [];
    phone = json['phone'] != null ? json['phone'].cast<String>() : [];
    gender = json['gender'] != null ? json['gender'].cast<String>() : [];
    password = json['password'] != null ? json['password'].cast<String>() : [];
  }
  List<String>? name;
  List<String>? email;
  List<String>? phone;
  List<String>? gender;
  List<String>? password;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = name;
    map['email'] = email;
    map['phone'] = phone;
    map['gender'] = gender;
    map['password'] = password;
    return map;
  }

}