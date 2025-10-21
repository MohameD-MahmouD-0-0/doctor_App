import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../di.dart';
import '../cuibt/specialization_state.dart';
import '../cuibt/specialization_view_model.dart';
import 'doctor_speciality_list.dart';
import 'doctor_speciality_shimmer.dart';

class SpecialityBloc extends StatelessWidget {
  SpecializationCubit viewModel = SpecializationCubit(
    specializationRepository: injectSpecializationReposatiortContract());

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SpecializationCubit, SpecializationState>(
      bloc: viewModel..getSpecializations(),
      builder: (context, state) {
        if (state is SpecializationLoadingState) {
          return ShimmerDoctorSpecialityList();
        } else if (state is SpecializationError) {
          return Column(children: [Text('Error')]);
        } else if (state is SpecializationSuccess) {
          return Column(
            children: [
              DoctorSpecialityList(
                specialization_response: state.specializationDataResponseLsit,
              ),
            ],
          );
        }
        return Container();
      },
    );
  }
}