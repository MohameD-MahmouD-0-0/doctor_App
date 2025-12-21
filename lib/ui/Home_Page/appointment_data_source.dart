import 'package:dartz/dartz.dart';

import '../../data/Failer.dart';
import '../../data/home/oppintment_response/appointmentResponse.dart';

abstract class AppointmentDataSource {

  Future<Either<Failer,AppointmentResponse>> appointmentPay(int DoctorId , String appointmentTime);
}