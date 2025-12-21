import 'package:doctor/ui/Home_Page/appointment_reposatiory_contrat.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
