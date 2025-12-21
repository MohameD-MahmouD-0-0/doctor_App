import 'package:dartz/dartz.dart';
import 'package:doctor/data/Failer.dart';
import 'package:doctor/data/home/oppintment_response/appointmentResponse.dart';

abstract class AppointmentReposatioryContrat {

  Future<Either<Failer,AppointmentResponse>> appointmentPay(int DoctorId , String appointmentTime);
}