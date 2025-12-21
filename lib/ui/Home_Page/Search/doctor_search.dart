import 'package:doctor/ui/Home_Page/Search/doctor_search_item.dart';
import 'package:doctor/ui/Home_Page/cuibt/specialization_state.dart';
import 'package:doctor/ui/app_color.dart';
import 'package:doctor/ui/di.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../Widgets/doctor_list_shimmer.dart';
import '../cuibt/specialization_view_model.dart';

class DoctorSearchPage extends StatefulWidget {
  static const String routName = 'search_doctor';

  @override
  State<DoctorSearchPage> createState() => _DoctorSearchPageState();
}

class _DoctorSearchPageState extends State<DoctorSearchPage> {

  @override
  DoctorCubit viewModel = DoctorCubit(
    specializationRepository: injectSpecializationReposatiortContract(),
  );
  @override
  void initState() {
    super.initState();
    viewModel.getAllDoctors();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.only(left: 4, top: 4, bottom: 4),
          child: InkWell(
            onTap: () => Navigator.pop(context),
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
              child: const Padding(
                padding: EdgeInsets.only(left: 10),
                child: Icon(
                  Icons.arrow_back_ios,
                  size: 20,
                  color: Colors.black,
                ),
              ),
            ),
          ),
        ),
        title: const Text(
          'Recommendation Doctor',
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
              child: Center(child: Icon(Icons.more_horiz, size: 25.h)),
            ),
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: TextField(
                      onChanged: (value) {
                        viewModel.getDoctorByName(value);
                      },
                      decoration: InputDecoration(
                        hintStyle: TextStyle(
                          color: AppColor.grey.withAlpha(150),
                          fontSize: 15,
                        ),
                        filled: true,
                        hintText: 'Search',
                        prefixIcon: Image.asset(
                          'assets/images/search-normal.png',
                          color: AppColor.grey.withAlpha(150),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.transparent),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.transparent),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        fillColor: AppColor.grey.withAlpha(20),
                      ),
                    ),
                  ),
                ),
                Image.asset('assets/images/sort.png'),
              ],
            ),
          ),
          SizedBox(height: 20.h),

          Expanded(
            child: BlocBuilder<DoctorCubit, DoctorState>(
              bloc: viewModel,
              builder: (context, state) {
                if (state is DoctorLoading) {
                  return ShimmerDoctorsList();
                } else if (state is DoctorSuccess) {
                  return DoctorSearchItem(docList: state.doctorList);
                } else if (state is DoctorNotFound) {
                  return const Center(child: Text('No doctors found'));
                } else if (state is DoctorError) {
                  return Center(child: Text('Error: ${state.errorMessage}'));
                }
                return const SizedBox();
              },
            ),
          ),
        ],
      ),
    );
  }
}