import 'package:dartz/dartz.dart';
import 'package:doctor/data/home/oppintment_response/my_appointment_response.dart';

import '../../../data/feature/Failer.dart';
import '../../../data/home/oppintment_response/appointmentResponse.dart';

abstract class AppointmentDataSource {

  Future<Either<Failer,AppointmentResponse>> appointmentPay(int DoctorId , String appointmentTime);
}
abstract class MyAppointmentDataSource {

  Future<Either<Failer,MyAppointmentResponse>> Myappointment();
}