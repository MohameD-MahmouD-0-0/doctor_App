import 'package:dartz/dartz.dart';
import 'package:doctor/data/feature/Failer.dart';
import 'package:doctor/data/home/oppintment_response/appointmentResponse.dart';

import '../../../data/home/oppintment_response/my_appointment_response.dart';

abstract class AppointmentReposatioryContrat {

  Future<Either<Failer,AppointmentResponse>> appointmentPay(int DoctorId , String appointmentTime);
}
abstract class MyAppointmentReposatioryContrat {

  Future<Either<Failer,MyAppointmentResponse>> Myappointment();
}
