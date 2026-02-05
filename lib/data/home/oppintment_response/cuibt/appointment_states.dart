import 'package:doctor/data/home/oppintment_response/my_appointment_response.dart';

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

abstract class MyAppointmentState{}
class InitialMyAppointmentState extends MyAppointmentState{}

class LoadingMyAppointmentState extends MyAppointmentState{}

class ErrorMyAppointmentState extends MyAppointmentState{
  String errorMessage;
  ErrorMyAppointmentState({required this.errorMessage});
}

class SuccessMyAppointmentState extends MyAppointmentState{
  List<MyAppointmentDoctor> doctorList;
  SuccessMyAppointmentState(this.doctorList);
}
