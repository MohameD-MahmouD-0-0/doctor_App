import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:doctor/data/Failer.dart';
import 'package:doctor/data/authe/Login_request.dart';
import 'package:doctor/data/authe/Login_response.dart';
import 'package:doctor/data/feature/api_constant.dart';
import 'package:http/http.dart' as http;

import '../home/specialization_response.dart';

class ApiManager {
  ApiManager._();
 static ApiManager? _instance;
  static ApiManager getinstance(){
    _instance??=ApiManager._();
    return _instance!;
  }
  Future<Either<Failer, LoginResponse>> Login(String email, String password) async {
    try {
      var url = Uri.https(ApiConstant.ApiBaseUrl,ApiConstant.LoginUrl);
      var request = http.MultipartRequest('POST', url);
      var loginRequest = LoginRequest(email: email, password: password);
      request.fields.addAll(
          loginRequest.toJson().map((key, value) => MapEntry(key, value.toString()))
      );

      var streamedResponse = await request.send();
      var response = await http.Response.fromStream(streamedResponse);
      print(request.fields);
      var json = jsonDecode(response.body);

      if (response.statusCode >= 200 && response.statusCode < 300) {
        var loginResponse = LoginResponse.fromJson(json);
        return Right(loginResponse);
      } else {
        String errorMessage = json['message'] ?? 'Login failed';
        return Left(Failer(errorMessage: errorMessage));
      }
    } catch (e) {
      return Left(Failer(errorMessage: e.toString()));
    }
  }

  Future<Either<Failer, SpecializationResponse>> get_specialization() async {
    try {
      var url = Uri.https(ApiConstant.ApiBaseUrl, ApiConstant.specializationUrl);
      var response = await http.get(url,headers: {
        'Accept': 'application/json',
        'Authorization': 'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3ZjYXJlLmludGVncmF0aW9uMjUuY29tL2FwaS9hdXRoL2xvZ2luIiwiaWF0IjoxNzU4MTM0MzY2LCJleHAiOjE3NTgyMjA3NjYsIm5iZiI6MTc1ODEzNDM2NiwianRpIjoiUjJmb3lrRVJQMGVIVTNmNiIsInN1YiI6IjUxOTIiLCJwcnYiOiIyM2JkNWM4OTQ5ZjYwMGFkYjM5ZTcwMWM0MDA4NzJkYjdhNTk3NmY3In0.4BQm5XPy0jiquxe7uojkul1apUOpX_5OJQSZpVx0kjc'});
      var json = jsonDecode(response.body);

      if (response.statusCode >= 200 && response.statusCode < 300) {
        var specializationResponse = SpecializationResponse.fromJson(json);
        return Right(specializationResponse);
      } else {
        String errorMessage = json['message'] ?? 'Specialization failed';
        return Left(Failer(errorMessage: errorMessage));
      }
    } catch (e) {
      return Left(Failer(errorMessage: e.toString()));
    }
  }
}
