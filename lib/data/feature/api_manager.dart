import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:doctor/data/Failer.dart';
import 'package:doctor/data/authe/Login_request.dart';
import 'package:doctor/data/authe/Login_response.dart';
import 'package:doctor/data/feature/api_constant.dart';
import '../../ui/shared_prefrence.dart';
import '../home/specialization_response.dart';
import 'package:http/http.dart' as http;

class ApiManager {
  ApiManager._();
 static ApiManager? _instance;
  static ApiManager getinstance(){
    _instance??=ApiManager._();
    return _instance!;
  }
  Future<Either<Failer, LoginResponse>> login(String email, String password) async {
    try {
      var url = Uri.https(ApiConstant.ApiBaseUrl,ApiConstant.LoginUrl);
      var request = http.MultipartRequest('POST', url);
      var loginRequest = LoginRequest(email: email, password: password);
      request.fields.addAll(
          loginRequest.toJson().map((key, value) => MapEntry(key, value.toString()))
      );

      var streamedResponse = await request.send();
      var response = await http.Response.fromStream(streamedResponse);
      var json = jsonDecode(response.body);

      if (response.statusCode >= 200 && response.statusCode < 300) {
        var loginResponse = LoginResponse.fromJson(json);
        // await SharedPrefsService.setData(SharedPreferenceHelper.userToken, loginResponse.data?.token);
        SharedPrefsService.seuret_data(loginResponse.data!.token!, SharedPreferenceHelper.userToken);
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
      final secure_token = await SharedPrefsService.get_seuret_data(SharedPreferenceHelper.userToken);
      var url = Uri.https(ApiConstant.ApiBaseUrl, ApiConstant.specializationUrl);
      var response = await http.get(url,headers: {
        'Accept': 'application/json',
        'Authorization': 'Bearer $secure_token'
      });
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