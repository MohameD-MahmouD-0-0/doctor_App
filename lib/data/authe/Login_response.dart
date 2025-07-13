/// message : "Loggedin Successfuly"
/// data : {"token":"eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3ZjYXJlLmludGVncmF0aW9uMjUuY29tL2FwaS9hdXRoL2xvZ2luIiwiaWF0IjoxNzUyMDUzMDIzLCJleHAiOjE3NTIxMzk0MjMsIm5iZiI6MTc1MjA1MzAyMywianRpIjoiU3FrdzBGTlhRRTROZjhibyIsInN1YiI6IjkwMCIsInBydiI6IjIzYmQ1Yzg5NDlmNjAwYWRiMzllNzAxYzQwMDg3MmRiN2E1OTc2ZjcifQ.Ju2qTV9KZ1awfq4vrJHfXI9s5vFRteo_GiSnvUp3fII","username":"diaa"}
/// status : true
/// code : 200

class LoginResponse {
  LoginResponse({
      this.message, 
      this.data, 
      this.status, 
      this.code,});

  LoginResponse.fromJson(dynamic json) {
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

/// token : "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3ZjYXJlLmludGVncmF0aW9uMjUuY29tL2FwaS9hdXRoL2xvZ2luIiwiaWF0IjoxNzUyMDUzMDIzLCJleHAiOjE3NTIxMzk0MjMsIm5iZiI6MTc1MjA1MzAyMywianRpIjoiU3FrdzBGTlhRRTROZjhibyIsInN1YiI6IjkwMCIsInBydiI6IjIzYmQ1Yzg5NDlmNjAwYWRiMzllNzAxYzQwMDg3MmRiN2E1OTc2ZjcifQ.Ju2qTV9KZ1awfq4vrJHfXI9s5vFRteo_GiSnvUp3fII"
/// username : "diaa"

class Data {
  Data({
      this.token, 
      this.username,});

  Data.fromJson(dynamic json) {
    token = json['token'];
    username = json['username'];
  }
  String? token;
  String? username;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['token'] = token;
    map['username'] = username;
    return map;
  }

}