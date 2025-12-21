import 'package:dartz/dartz.dart';

import 'package:doctor/data/Failer.dart';

import 'package:doctor/data/home/oppintment_response/appointmentResponse.dart';

import 'appointment_data_source.dart';
import 'appointment_reposatiory_contrat.dart';

class AppointmentReposatioryImp implements AppointmentReposatioryContrat {
  AppointmentDataSource appointmentDataSource;
  AppointmentReposatioryImp({required this.appointmentDataSource});
  @override
  Future<Either<Failer, AppointmentResponse>> appointmentPay(int DoctorId, String appointmentTime) {
    return appointmentDataSource.appointmentPay(DoctorId,appointmentTime);
  }

}