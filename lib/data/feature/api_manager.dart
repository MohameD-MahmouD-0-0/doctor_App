import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:doctor/data/Failer.dart';
import 'package:doctor/data/authe/Login_request.dart';
import 'package:doctor/data/authe/Login_response.dart';
import 'package:doctor/data/feature/api_constant.dart';
import 'package:doctor/data/home/oppintment_response/appointmentResponse.dart';
import '../../ui/shared_prefrence.dart';
import '../home/oppintment_response/appointment_request.dart';
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


  Future<Either<Failer, AppointmentResponse>> pay_doctor_appointment(int DoctorId , String appointmentTime) async {
    try {
      final secure_token = await SharedPrefsService.get_seuret_data(SharedPreferenceHelper.userToken);

      var headers = {
        'Accept': 'application/json',
        'Authorization': 'Bearer $secure_token'
      };
      var url = Uri.https(ApiConstant.ApiBaseUrl,ApiConstant.appointmentPayUrl);
      var request = http.MultipartRequest('POST', url);
      var appointmentRequest = AppointmentRequest(doctorId: DoctorId,startTime: appointmentTime);
      request.headers.addAll(headers);
      request.fields.addAll(
          appointmentRequest.toJson().map((key, value) => MapEntry(key, value.toString()))
      );

      var streamedResponse = await request.send();
      var response = await http.Response.fromStream(streamedResponse);
      var json = jsonDecode(response.body);
      var AppointmentRsponse = AppointmentResponse.fromJson(json);
      if (response.statusCode >= 200 && response.statusCode < 300) {
        return Right(AppointmentRsponse);

      } else {
        String errorMessage = json['message'] ?? 'Failed Appointment';
        return Left(Failer(errorMessage: errorMessage));
      }
    } catch (e) {
      return Left(Failer(errorMessage: e.toString()));
    }
  }
}