import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../cuibt/specialization_state.dart';
import '../cuibt/specialization_view_model.dart';
import 'doctor_list_shimmer.dart';
import 'doctors_list.dart';

class DoctorBloc extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DoctorCubit, DoctorState>(
      builder: (context, state) {
        if(state is DoctorLoading)
          {
            return ShimmerDoctorsList();
          }
         if (state is DoctorError) {
          return Column(children: [Text('Error')]);
        } else if (state is DoctorSuccess) {
          return Expanded(
            child: Column(
              children: [
                DoctorsList(
                  docList: state.doctorList,
                ),
              ],
            ),
          );
        }
        return Container();
      },
    );
  }
}