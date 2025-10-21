import 'package:doctor/data/home/specialization_response.dart';
import 'package:doctor/ui/app_color.dart';
import 'package:doctor/ui/di.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../cuibt/specialization_view_model.dart';

class DoctorSpecialityList extends StatefulWidget {
  final List<Data> specialization_response;

  DoctorSpecialityList({required this.specialization_response});

  final DoctorCubit viewModel = DoctorCubit(
    specializationRepository: injectSpecializationReposatiortContract(),
  );

  @override
  State<DoctorSpecialityList> createState() => _DoctorSpecialityListState();
}

class _DoctorSpecialityListState extends State<DoctorSpecialityList> {
  List<String> images = [
    'assets/images/Man Doctor Europe 1.png',
    'assets/images/Brain 1.png',
    'assets/images/Iamge.png',
    'assets/images/Kidneys 1.png',
    'assets/images/Man Doctor Europe 1.png',
    'assets/images/Brain 1.png',
    'assets/images/Iamge.png',
    'assets/images/Kidneys 1.png',
    'assets/images/Man Doctor Europe 1.png',
    'assets/images/Brain 1.png',
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 110.h,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              final selectedId = widget.specialization_response[index].id;
              if (selectedId != null) {
                context.read<DoctorCubit>().getDoctorsBySpecializationId(
                  selectedId,
                );
              }
              setState(() {
                widget.viewModel.selectedIndex = index;
              });
            },
            child: Container(
              padding: index == 0
                  ? EdgeInsets.all(0)
                  : EdgeInsets.only(left: 25),
              child: Column(
                children: [
                  widget.viewModel.selectedIndex == index
                      ? Container(
                          width: 60.0,
                          height: 60.0,
                          decoration: BoxDecoration(
                            color: AppColor.mainblue,
                            borderRadius: BorderRadius.all(
                              Radius.circular(50.0),
                            ),
                            border: Border.all(color: Colors.black, width: 3),
                          ),
                          child: CircleAvatar(
                            radius: 30,
                            backgroundColor: Colors.grey.withAlpha(20),
                            child: Image.asset(images[index]),
                          ),
                        )
                      : CircleAvatar(
                          radius: 28,
                          backgroundColor: Colors.grey.withAlpha(20),
                          child: Image.asset(images[index]),
                        ),
                  Text(
                    widget.specialization_response[index].name!,
                    style: TextStyle(
                      fontSize: widget.viewModel.selectedIndex == index
                          ? 14.sp
                          : 12.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
        itemCount: widget.specialization_response.length,
      ),
    );
  }
}
