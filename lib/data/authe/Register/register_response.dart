/// message : "Loggedin Successfuly"
/// data : {"token":"eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3ZjYXJlLmludGVncmF0aW9uMjUuY29tL2FwaS9hdXRoL3JlZ2lzdGVyIiwiaWF0IjoxNzY3OTYyNTI3LCJleHAiOjE3NjgwNDg5MjcsIm5iZiI6MTc2Nzk2MjUyNywianRpIjoiWnVIaUNVM2JWMU9SRkQ0TCIsInN1YiI6IjYyMzIiLCJwcnYiOiIyM2JkNWM4OTQ5ZjYwMGFkYjM5ZTcwMWM0MDA4NzJkYjdhNTk3NmY3In0.aUOkZnCokSiQxzgLX_FTrPBxnAhr7kjQBUbgyae_Syw","username":"diaaa"}
/// status : true
/// code : 200

class RegisterResponse {
  RegisterResponse({
      this.message, 
      this.data, 
      this.status, 
      this.code,});

  RegisterResponse.fromJson(dynamic json) {
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

/// token : "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3ZjYXJlLmludGVncmF0aW9uMjUuY29tL2FwaS9hdXRoL3JlZ2lzdGVyIiwiaWF0IjoxNzY3OTYyNTI3LCJleHAiOjE3NjgwNDg5MjcsIm5iZiI6MTc2Nzk2MjUyNywianRpIjoiWnVIaUNVM2JWMU9SRkQ0TCIsInN1YiI6IjYyMzIiLCJwcnYiOiIyM2JkNWM4OTQ5ZjYwMGFkYjM5ZTcwMWM0MDA4NzJkYjdhNTk3NmY3In0.aUOkZnCokSiQxzgLX_FTrPBxnAhr7kjQBUbgyae_Syw"
/// username : "diaaa"

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