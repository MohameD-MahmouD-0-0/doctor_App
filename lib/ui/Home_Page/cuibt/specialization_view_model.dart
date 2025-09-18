import 'package:doctor/ui/Home_Page/cuibt/specialization_state.dart';
import 'package:doctor/ui/Home_Page/specialization_reposatiory_contract.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SpecializationViewModel extends Cubit<SpecializationState> {
  SpecializationReposaitoryContract specializationReposaitoryContract;

  SpecializationViewModel({required this.specializationReposaitoryContract})
    : super(SpecializationLoadingState());

  void get_specialization() async {
    emit(SpecializationLoadingState());
    var either = await specializationReposaitoryContract.get_specialization();
    either.fold(
      (l) {
        emit(SpecializationError(errorMessage: l.errorMessage));
      },
      (response) {
        emit(SpecializationSuccess(specializationResponse: response));
      },
    );
  }
}
