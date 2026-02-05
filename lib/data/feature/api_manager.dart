import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:doctor/data/authe/Register/register_request.dart';
import 'package:doctor/data/authe/logout/log_out_response.dart';
import 'package:doctor/data/feature/Failer.dart';
import 'package:doctor/data/authe/Login/Login_response.dart';
import 'package:doctor/data/feature/api_constant.dart';
import 'package:doctor/data/home/oppintment_response/appointmentResponse.dart';
import '../../ui/shared_prefrence.dart';
import '../authe/Login/Login_request.dart';
import '../authe/Register/register_response.dart';
import '../home/oppintment_response/appointment_request.dart';
import '../home/oppintment_response/my_appointment_response.dart';
import '../home/specialization/specialization_response.dart';
import 'package:http/http.dart' as http;

class ApiManager {

  ApiManager._();

  static ApiManager? _instance;

  static ApiManager getinstance() {
    _instance ??= ApiManager._();
    return _instance!;
  }

  Future<Either<Failer, LoginResponse>> login(String email,
      String password,) async {
    try {
      var url = Uri.https(ApiConstant.ApiBaseUrl, ApiConstant.LoginUrl);
      var loginRequest = LoginRequest(email: email, password: password);
      var response = await http.post(url, body: loginRequest.toJson());
      var json = jsonDecode(response.body);

      if (response.statusCode >= 200 && response.statusCode < 300) {
        var loginResponse = LoginResponse.fromJson(json);
        SharedPrefsService.seuret_data(
          loginResponse.data!.token!,
          SharedPreferenceHelper.userToken,
        );
        return Right(loginResponse);
      } else {
        String errorMessage = json['message'] ?? 'Login failed';
        return Left(Failer(errorMessage: errorMessage));
      }
    } catch (e) {
      return Left(Failer(errorMessage: e.toString()));
    }
  }

  Future<Either<Failer, RegisterResponse>> register(String name,
      String email,
      String phone,
      String gender,
      String password,
      String password_confirmation,) async {
    try {
      Uri url = Uri.https(ApiConstant.ApiBaseUrl, ApiConstant.RegisterUrl);
      var request = http.MultipartRequest('POST', url);
      var registerRequest = RegisterRequest(
        name,
        email,
        phone,
        gender,
        password,
        password_confirmation,
      );
      var headers =
      {
        'Accept': 'application/json',
      };

      request.headers.addAll(headers);
      request.fields.addAll(
        registerRequest.toJson().map(
              (key, value) => MapEntry(key, value.toString()),
        ),
      );
      var streamResponse = await request.send();
      var response = await http.Response.fromStream(streamResponse);
      var json = jsonDecode(response.body);
      if (response.statusCode >= 200 && response.statusCode < 300) {
        var registerResponse = RegisterResponse.fromJson(json);
        return Right(registerResponse);
      }
      return Left(Failer(errorMessage: json['message'] ?? 'Register failed'));
    } catch (e) {
      return Left(Failer(errorMessage: e.toString()));
    }
  }

  Future<Either<Failer, SpecializationResponse>> get_specialization() async {
    try {
      final secure_token = await SharedPrefsService.get_seuret_data(
        SharedPreferenceHelper.userToken,
      );
      var url = Uri.https(
        ApiConstant.ApiBaseUrl,
        ApiConstant.specializationUrl,
      );
      var response = await http.get(
        url,
        headers: {
          'Accept': 'application/json',
          'Authorization': 'Bearer $secure_token',
        },
      );
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

  Future<Either<Failer, AppointmentResponse>> pay_doctor_appointment(
      int DoctorId,
      String appointmentTime,) async {
    try {
      final secure_token = await SharedPrefsService.get_seuret_data(
        SharedPreferenceHelper.userToken,
      );

      var headers = {
        'Accept': 'application/json',
        'Authorization': 'Bearer $secure_token',
      };
      var url = Uri.https(
        ApiConstant.ApiBaseUrl,
        ApiConstant.appointmentPayUrl,
      );
      var request = http.MultipartRequest('POST', url);
      var appointmentRequest = AppointmentRequest(
        doctorId: DoctorId,
        startTime: appointmentTime,
      );
      request.headers.addAll(headers);
      request.fields.addAll(
        appointmentRequest.toJson().map(
              (key, value) => MapEntry(key, value.toString()),
        ),
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

  Future<Either<Failer, LogOutResponse>> logOut() async {
    try {
      var url = Uri.https(ApiConstant.ApiBaseUrl, ApiConstant.logoutUrl);
      final secure_token = await SharedPrefsService.get_seuret_data(
        SharedPreferenceHelper.userToken,
      );
      var request = http.MultipartRequest('POST', url);
      var headers = {
        'Accept': 'application/json',
        'Authorization': 'Bearer $secure_token',
      };
      request.headers.addAll(headers);
      var streamedResponse = await request.send();
      var response = await http.Response.fromStream(streamedResponse);
      var json = jsonDecode(response.body);
      if (response.statusCode >= 200 || response.statusCode <= 300) {
        SharedPrefsService.remove(SharedPreferenceHelper.userToken);
        return Right(LogOutResponse.fromJson(json));
      }
      else {
        return Left(Failer(errorMessage: json['message'] ?? 'Logout failed'));
      }
    } catch (e) {
      return Left(Failer(errorMessage: e.toString()));
    }
  }


  Future<Either<Failer, MyAppointmentResponse>> getMyAppointment() async {
    Uri url = Uri.https(ApiConstant.ApiBaseUrl, ApiConstant.myAppointmentUrl);
    final secure_token = await SharedPrefsService.get_seuret_data(
      SharedPreferenceHelper.userToken,
    );
    var headers = {
      'Accept': 'application/json',
      'Authorization': 'Bearer $secure_token',
    };
    try {
      var response = await http.get(url, headers: headers);
      var json = jsonDecode(response.body);
      if (response.statusCode >= 200 && response.statusCode < 300) {
        var myAppointmentResponse = MyAppointmentResponse.fromJson(json);
        return Right(myAppointmentResponse);
      } else {
        return Left(
            Failer(errorMessage: json['message'] ?? 'Failed Appointment'));
      }
    }catch(e){
      return Left(Failer(errorMessage: e.toString()));
    }
  }
}