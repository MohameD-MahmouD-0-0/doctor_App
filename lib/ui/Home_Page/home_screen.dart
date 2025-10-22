import 'package:doctor/ui/Home_Page/Widgets/speciality_bloc.dart';
import 'package:doctor/ui/Home_Page/Widgets/doctor_bloc.dart';
import 'package:doctor/ui/Home_Page/cuibt/specialization_view_model.dart';
import 'package:doctor/ui/app_color.dart';
import 'package:doctor/ui/di.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'Widgets/doctor_blue_container.dart';
import 'Widgets/doctor_speciality.dart';
import 'Widgets/tap_home_page.dart';

class HomeScreen extends StatelessWidget {
  static const String routeName = 'HomeScreen';

  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: BlocProvider<DoctorCubit>(
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
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Image.asset('assets/images/home-2.png'),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Image.asset('assets/images/message-text.png'),
            label: '',
          ),
          BottomNavigationBarItem(icon: SizedBox.shrink(), label: ''),
          BottomNavigationBarItem(
            icon: Image.asset('assets/images/calendar-2.png'),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person, color: Colors.grey),
            label: '',
          ),
        ],
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 12 , left: 25),
        child: Container(
          width: 80,
          height: 80,
          decoration: BoxDecoration(
            color:AppColor.mainblue,
            borderRadius: BorderRadius.circular(30.r),
          ),
          child:  Image.asset('assets/images/search-normal.png',),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
