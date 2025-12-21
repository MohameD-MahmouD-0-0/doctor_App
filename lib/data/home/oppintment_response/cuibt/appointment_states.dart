import '../appointmentResponse.dart';

abstract class AppointmentState{}
class InitialAppointmentState extends AppointmentState{}

class LoadingAppointmentState extends AppointmentState{}

class ErrorAppointmentState extends AppointmentState{
   String errorMessage;
  ErrorAppointmentState({required this.errorMessage});
}

class SuccessAppointmentState extends AppointmentState{
   AppointmentResponse appointmentResponse;
  SuccessAppointmentState(this.appointmentResponse);
}
