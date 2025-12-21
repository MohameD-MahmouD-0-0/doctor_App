import 'package:dartz/dartz.dart';
import 'package:doctor/data/Failer.dart';
import 'package:doctor/data/feature/api_manager.dart';
import 'package:doctor/data/home/oppintment_response/appointmentResponse.dart';
import 'appointment_data_source.dart';

class AppointmentDataSourceImp implements AppointmentDataSource {
  ApiManager apiManager;

  AppointmentDataSourceImp({required this.apiManager});

  @override
  Future<Either<Failer, AppointmentResponse>> appointmentPay(int DoctorId, String appointmentTime) async
  {
    var either = await apiManager.pay_doctor_appointment(DoctorId, appointmentTime);
    return either.fold(
      (l) {
        return Left(Failer(errorMessage: l.errorMessage));
      },
      (response) {
        return Right(response);
      },
    );
  }
}
