import 'package:dartz/dartz.dart';
import 'package:doctor/data/feature/Failer.dart';
import 'package:doctor/data/home/oppintment_response/appointmentResponse.dart';
import '../../../data/home/oppintment_response/my_appointment_response.dart';
import '../Data_source/appointment_data_source.dart';
import 'appointment_reposatiory_contrat.dart';

class AppointmentReposatioryImp implements AppointmentReposatioryContrat {
  AppointmentDataSource appointmentDataSource;

  AppointmentReposatioryImp({required this.appointmentDataSource});

  @override
  Future<Either<Failer, AppointmentResponse>> appointmentPay(
    int DoctorId,
    String appointmentTime,
  ) {
    return appointmentDataSource.appointmentPay(DoctorId, appointmentTime);
  }
}

class MyAppointmentReposatioryImp implements MyAppointmentReposatioryContrat {
  MyAppointmentDataSource MyappointmentDataSource;

  MyAppointmentReposatioryImp({required this.MyappointmentDataSource});

  @override
  Future<Either<Failer, MyAppointmentResponse>> Myappointment() {
    return MyappointmentDataSource.Myappointment();
  }
}