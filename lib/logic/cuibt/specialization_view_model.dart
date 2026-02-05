import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../logic/Home/Reposatiory/specialization_reposatiory_contract.dart';
import 'specialization_state.dart';
import '../../../data/home/specialization/specialization_response.dart';

class SpecializationCubit extends Cubit<SpecializationState> {
  final SpecializationReposaitoryContract specializationRepository;

  SpecializationCubit({required this.specializationRepository})
    : super(SpecializationLoadingState());

  void getSpecializations() async {
    emit(SpecializationLoadingState());
    final either = await specializationRepository.get_specialization();
    either.fold(
      (l) => emit(SpecializationError(errorMessage: l.errorMessage)),
      (response) {
        emit(
          SpecializationSuccess(
            specializationDataResponseLsit: response.data ?? [],
          ),
        );
      },
    );
  }
}

class DoctorCubit extends Cubit<DoctorState> {
  final SpecializationReposaitoryContract specializationRepository;

  List<Data>? allSpecializations;
  int selectedIndex = 0;

  DoctorCubit({required this.specializationRepository})
    : super(DoctorLoading());

  void loadAllData() async {
    emit(DoctorLoading());
    final either = await specializationRepository.get_specialization();

    either.fold((l) => emit(DoctorError(errorMessage: l.errorMessage)), (
      response,
    ) {
      allSpecializations = response.data ?? [];
      final doctors = allSpecializations!.first.doctors ?? [];
      List<Doctors> allDoctors = [];
      for (var specialization in allSpecializations!) {
        if (specialization.doctors != null) {
          allDoctors.addAll(specialization.doctors!);
        }
      }
      emit(
        doctors.isEmpty
            ? DoctorError(errorMessage: "No doctors found")
            : DoctorSuccess(doctorList: doctors),
      );
    });
  }

  void getDoctorsBySpecializationId(int specializationId) async {
    final specialization = allSpecializations!.firstWhere(
      (s) => s.id == specializationId,
      orElse: () => Data(),
    );

    final doctors = specialization.doctors ?? [];
    emit(
      doctors.isEmpty
          ? DoctorError(errorMessage: "No doctors found")
          : DoctorSuccess(doctorList: doctors),
    );
  }

  void getAllDoctors() async {
    emit(DoctorLoading());
    final either = await specializationRepository.get_specialization();

    either.fold((l) => emit(DoctorError(errorMessage: l.errorMessage)), (
      response,
    ) {
      allSpecializations = response.data ?? [];
      List<Doctors> allDoctors = [];
      for (var specialization in allSpecializations!) {
        if (specialization.doctors != null) {
          allDoctors.addAll(specialization.doctors!);
        }
        emit(
          allDoctors.isEmpty
              ? DoctorError(errorMessage: "No doctors found")
              : DoctorSuccess(doctorList: allDoctors),
        );
      }
    });
  }

  void getDoctorByName(String doctorName) {
    List<Doctors> filterDoctors = [];
    final specialization = allSpecializations;
    if (specialization == null || specialization.isEmpty) {
      emit(DoctorNotFound());
      return;
    }
    final query = doctorName.trim().toLowerCase();

    filterDoctors = specialization
        .expand((s) => s.doctors!).where((doctor)=>
        doctor.name!.toLowerCase().contains(query)).toList();
    if (filterDoctors.isEmpty) {
      emit(DoctorNotFound());
    }
    emit(DoctorSuccess(doctorList: filterDoctors));
  }
}
