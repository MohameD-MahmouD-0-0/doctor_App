import 'package:doctor/data/home/oppintment_response/cuibt/appointment_view_model.dart';
import 'package:doctor/ui/di.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../data/home/oppintment_response/cuibt/appointment_states.dart';
import '../Home_Page/Doctor_Profil/doctor_tap_info.dart';
import '../Home_Page/root_screen.dart';
import '../app_color.dart';
import 'my_appointment_doctors.dart';

class AppointmentPage extends StatefulWidget {
  @override
  State<AppointmentPage> createState() => _AppointmentPageState();
}

class _AppointmentPageState extends State<AppointmentPage> {
  late MyAppointmentViewModel viewModel;

  @override
  void initState() {
    super.initState();
    viewModel = MyAppointmentViewModel(
      myAppointmentReposatioryContrat: injectMyAppointmentReposatiortContract(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.only(left: 4, top: 4, bottom: 4),
          child: InkWell(
            onTap: () => Navigator.of(context).pushNamed(RootScreen.routeName),
            borderRadius: BorderRadius.circular(20),
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color: AppColor.grey.withAlpha(50),
                  width: 2,
                ),
                borderRadius: BorderRadius.circular(13.r),
                color: Colors.white,
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Icon(
                  Icons.arrow_back_ios,
                  size: 20,
                  color: Colors.black,
                ),
              ),
            ),
          ),
        ),
        title: Text(
          'My Appointment',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
        ),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 15),
            child: Container(
              width: 50,
              height: 47,
              decoration: BoxDecoration(
                color: Colors.white.withAlpha(200),
                border: Border.all(
                  color: AppColor.grey.withAlpha(50),
                  width: 1,
                ),
                borderRadius: BorderRadius.circular(13.r),
              ),
              child: Center(
                child: Image.asset(
                  'assets/images/search-normal.png',
                  color: Colors.black,
                ),
              ),
            ),
          ),
        ],
      ),
      body: BlocConsumer<MyAppointmentViewModel, MyAppointmentState>(
        bloc: viewModel..getMyAppointment(),
        builder: (context, state) {
          if (state is LoadingMyAppointmentState) {
            return Center(child: CircularProgressIndicator());
          } else if (state is SuccessMyAppointmentState) {
            if (state.doctorList.isEmpty) {
              return Center(
                child: Text(
                  "No appointments available",
                  style: TextStyle(fontSize: 16, color: AppColor.grey),
                ),
              );
            }
            return ListView.builder(
              itemCount: state.doctorList.length,
              itemBuilder: (context, index) {
                return Container(
                  color: Colors.white.withAlpha(20),
                  margin: EdgeInsets.only(bottom: 10.h),
                  padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
                  child: MyDoctors(doctors: state.doctorList[index]),
                );
              },
            );
          } else if (state is ErrorMyAppointmentState) {
            return Center(
              child: Text(
                "Failed to load appointments",
                style: TextStyle(fontSize: 16, color: Colors.red),
              ),
            );
          }
          return Container();
        },
        listener: (context, state) {
          if (state is ErrorMyAppointmentState) {
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text(state.errorMessage)));
          }
        },
      ),
    );
  }
}
