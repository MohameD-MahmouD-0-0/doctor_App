import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../di.dart';
import '../cuibt/specialization_state.dart';
import '../cuibt/specialization_view_model.dart';
import 'doctor_speciality_list.dart';
import 'doctors_list.dart';

class DoctorAndSpecialityBloc extends StatelessWidget{
  SpecializationViewModel viewModel = SpecializationViewModel(
    specializationReposaitoryContract:
    injectSpecializationReposatiortContract(),
  );
  @override
  Widget build(BuildContext context) {
     return BlocBuilder<SpecializationViewModel, SpecializationState>(
      bloc: viewModel..get_specialization(),
      builder: (context, state) {
        if (state is SpecializationLoadingState) {
          return CircularProgressIndicator();
        } else if (state is SpecializationError) {
          return Column(children: [Text('Error')]);
        } else if (state is SpecializationSuccess) {
          return Expanded(
            child: Column(
              children: [
                DoctorSpecialityList(
                  specialization_response: state.specializationResponse,
                ),
                DoctorsList(
                  docList:
                  state.specializationResponse.data![0].doctors!,
                ),
              ],
            ),
          );
        }
        return Container();
      });}}