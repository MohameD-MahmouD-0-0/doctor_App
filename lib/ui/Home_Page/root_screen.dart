import 'package:doctor/ui/Home_Page/Search/doctor_search.dart';
import 'package:doctor/ui/Home_Page/Widgets/speciality_bloc.dart';
import 'package:doctor/ui/Home_Page/Widgets/doctor_bloc.dart';
import 'package:doctor/ui/app_color.dart';
import 'package:doctor/ui/di.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../logic/cuibt/specialization_view_model.dart';
import '../Chat/chat_page.dart';
import '../Home/home_screen.dart';
import '../My_Appointment/appointment_of_doctors.dart';
import '../Profile/profile_page.dart';
import 'Widgets/doctor_blue_container.dart';
import 'Widgets/doctor_speciality.dart';
import 'Widgets/tap_home_page.dart';

class RootScreen extends StatefulWidget {
  static const String routeName = 'HomeScreen';

  @override
  State<RootScreen> createState() => _RootScreenState();
}

class _RootScreenState extends State<RootScreen> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(child: tabs[selectedIndex]),

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedIndex,
        onTap: (index) {
          setState(() {
            selectedIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Image.asset(
              'assets/images/home-2.png',
              color: selectedIndex == 0 ? AppColor.mainblue : Colors.grey,
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              'assets/images/message-text.png',
              color: selectedIndex == 1 ? AppColor.mainblue : Colors.grey,
            ),
            label: '',
          ),
          BottomNavigationBarItem(icon: SizedBox.shrink(), label: ''),
          BottomNavigationBarItem(
            icon: Image.asset(
              'assets/images/calendartransparent.png',
              color: selectedIndex == 3 ? AppColor.mainblue : Colors.grey,
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.person,
              color: selectedIndex == 4 ? AppColor.mainblue : Colors.grey,
            ),
            label: '',
          ),
        ],
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 12, left: 25),
        child: InkWell(
          onTap: () {
            Navigator.of(context).pushNamed(DoctorSearchPage.routName);
          },
          child: Container(
            width: 80,
            height: 80,
            decoration: BoxDecoration(
              color: AppColor.mainblue,
              borderRadius: BorderRadius.circular(30.r),
            ),
            child: Image.asset('assets/images/search-normal.png'),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

  List<Widget> tabs = [
    HomeScreen(),
    ChatPage(),
    InkWell(),
    AppointmentPage(),
    ProfilePage(),
  ];
}
