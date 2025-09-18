import 'package:doctor/ui/Home_Page/Widgets/doctor_and_speciality_bloc.dart';
import 'package:doctor/ui/Home_Page/cuibt/specialization_view_model.dart';
import 'package:doctor/ui/di.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'Widgets/doctor_blue_container.dart';
import 'Widgets/doctor_speciality.dart';
import 'Widgets/tap_home_page.dart';

class HomeScreen extends StatelessWidget {
  static const String routeName = 'HomeScreen';
  SpecializationViewModel viewModel = SpecializationViewModel(
    specializationReposaitoryContract:
        injectSpecializationReposatiortContract(),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.fromLTRB(20, 16, 20, 28),
          width: double.infinity,
          child: Column(
            children: [
              TapHomePage(),
              DoctorBlurContainer(),
              DoctorSpeciality(),
              SizedBox(height: 15),
              DoctorAndSpecialityBloc(),
              SizedBox(height: 15),
            ],
          ),
        ),
      ),
    );
  }
}
