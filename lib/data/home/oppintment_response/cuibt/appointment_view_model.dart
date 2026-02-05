import 'package:doctor/data/home/oppintment_response/my_appointment_response.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../logic/Home/Reposatiory/appointment_reposatiory_contrat.dart';
import 'appointment_states.dart';

class AppointmentViewModel extends Cubit<AppointmentState> {
  AppointmentReposatioryContrat appointmentReposatioryContrat;

  AppointmentViewModel({required this.appointmentReposatioryContrat})
    : super(InitialAppointmentState());

  void appointmentDoctorPayment(int DoctorId, String appointmentTime) async {
    emit(LoadingAppointmentState());
    var either = await appointmentReposatioryContrat.appointmentPay(
      DoctorId,
      appointmentTime,
    );
    either.fold(
      (l) {
        emit(ErrorAppointmentState(errorMessage: l.errorMessage));
      },
      (response) {
        emit(SuccessAppointmentState(response));
      },
    );
  }
}

class MyAppointmentViewModel extends Cubit<MyAppointmentState> {
  MyAppointmentReposatioryContrat myAppointmentReposatioryContrat;

  MyAppointmentViewModel({required this.myAppointmentReposatioryContrat})
    : super(LoadingMyAppointmentState());

  Future<void> getMyAppointment() async {
    emit(LoadingMyAppointmentState());
    var either = await myAppointmentReposatioryContrat.Myappointment();
    either.fold(
      (l) {
        emit(ErrorMyAppointmentState(errorMessage: l.errorMessage));
      },
      (response) {
        final List<MyAppointmentDoctor> doctors = [
          for (var appointment in response.data ?? []) ?appointment.doctor,
        ];
        print(doctors.length);
        emit(SuccessMyAppointmentState(doctors));
      },
    );
  }
}
