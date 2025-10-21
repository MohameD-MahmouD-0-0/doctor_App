import 'package:doctor/data/home/specialization_response.dart';
abstract class SpecializationState {}
class SpecializationLoadingState extends SpecializationState {}
class SpecializationError extends SpecializationState {
  String errorMessage;

  SpecializationError({required this.errorMessage});
}
class SpecializationSuccess extends SpecializationState {
  List<Data> specializationDataResponseLsit;

  SpecializationSuccess({required this.specializationDataResponseLsit});
}
class DoctorResponseError extends SpecializationState {
  String errorMessage;

  DoctorResponseError({required this.errorMessage});
}
abstract class DoctorState {}
class DoctorLoading extends DoctorState {}
class DoctorError extends DoctorState {
  final String errorMessage;
  DoctorError({required this.errorMessage});
}
class DoctorSuccess extends DoctorState {
  final List<Doctors> doctorList;
  DoctorSuccess({required this.doctorList});
}