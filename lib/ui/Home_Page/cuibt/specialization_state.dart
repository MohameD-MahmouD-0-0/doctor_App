import 'package:doctor/data/home/specialization_response.dart';

abstract class SpecializationState {}

class SpecializationLoadingState extends SpecializationState {}

class SpecializationError extends SpecializationState {
  String errorMessage;

  SpecializationError({required this.errorMessage});
}

class SpecializationSuccess extends SpecializationState {
  SpecializationResponse specializationResponse;
  SpecializationSuccess({required this.specializationResponse});
}
