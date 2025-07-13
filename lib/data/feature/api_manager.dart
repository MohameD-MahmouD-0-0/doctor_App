import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:doctor/data/Failer.dart';
import 'package:doctor/data/authe/Login_request.dart';
import 'package:doctor/data/authe/Login_response.dart';
import 'package:doctor/data/feature/api_constant.dart';
import 'package:http/http.dart' as http;

class ApiManager {
  ApiManager._();
 static ApiManager? _instance;
  static ApiManager getinstance(){
    _instance??=ApiManager._();
    return _instance!;
  }
  Future<Either<Failer, LoginResponse>> Login(
    String Email,
    String Password,
  ) async {
    try {
      var url = Uri.https(ApiConstant.ApiBaseUrl, ApiConstant.LoginUrl);
      var requestBody = LoginRequest(email: Email, password: Password);
      var request = http.MultipartRequest('Post', url);
      request.fields.addAll(  requestBody.toJson().map((key, value) => MapEntry(key, value.toString())),
      );
      var streamedResponse = await request.send();
      var response = await http.Response.fromStream(streamedResponse);
      var responseString = response.body.toString();
      var json = jsonDecode(responseString);
      var loginResponse = LoginResponse.fromJson(json);

      if (response.statusCode >= 200 && response.statusCode < 300) {
        return Right(loginResponse);
      } else {
        return Left(Failer(errorMessage: loginResponse.message!));
      }
    } catch (e) {
      return Left(Failer(errorMessage: e.toString()));
    }
  }
}
