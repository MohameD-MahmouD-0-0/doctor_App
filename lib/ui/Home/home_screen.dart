import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../logic/cuibt/specialization_view_model.dart';
import '../Home_Page/Widgets/doctor_bloc.dart';
import '../Home_Page/Widgets/doctor_blue_container.dart';
import '../Home_Page/Widgets/doctor_speciality.dart';
import '../Home_Page/Widgets/speciality_bloc.dart';
import '../Home_Page/Widgets/tap_home_page.dart';
import '../di.dart';

class HomeScreen extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return BlocProvider<DoctorCubit>(
      create: (context) => DoctorCubit(
        specializationRepository: injectSpecializationReposatiortContract(),
      )..loadAllData(),
      child: Container(
        margin: EdgeInsets.fromLTRB(20, 16, 20, 28),
        width: double.infinity,
        child: Column(
          children: [
            TapHomePage(),
            DoctorBlurContainer(),
            DoctorSpeciality(),
            SizedBox(height: 15),
            SpecialityBloc(),
            DoctorBloc(),
          ],
        ),
      ),
    );

  }
}