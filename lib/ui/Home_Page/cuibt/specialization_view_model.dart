import 'package:flutter_bloc/flutter_bloc.dart';
import '../specialization_reposatiory_contract.dart';
import 'specialization_state.dart';
import '../../../data/home/specialization_response.dart';

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
  bool isDataLoaded = false;
  int selectedIndex = 0;

  DoctorCubit({required this.specializationRepository}) : super(DoctorLoading());

  void loadAllData() async {
    emit(DoctorLoading());
    final either = await specializationRepository.get_specialization();

    either.fold(
          (l) => emit(DoctorError(errorMessage: l.errorMessage)),
          (response) {
        allSpecializations = response.data ?? [];
        isDataLoaded = true;

        final doctors = allSpecializations!.first.doctors ?? [];
        emit(
          doctors.isEmpty
              ? DoctorError(errorMessage: "No doctors found")
              : DoctorSuccess(doctorList: doctors),
        );
      },
    );
  }

  void getDoctorsBySpecializationId(int specializationId) async {


    final specialization = allSpecializations!
        .firstWhere((s) => s.id == specializationId, orElse: () => Data());

    final doctors = specialization.doctors ?? [];
    emit(
      doctors.isEmpty
          ? DoctorError(errorMessage: "No doctors found")
          : DoctorSuccess(doctorList: doctors),
    );
  }
}