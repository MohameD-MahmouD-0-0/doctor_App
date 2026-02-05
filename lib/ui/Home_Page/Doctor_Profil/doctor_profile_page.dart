import 'package:doctor/data/home/specialization/specialization_response.dart';
import 'package:doctor/ui/Home_Page/Doctor_Profil/doctor_tap_info.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../app_color.dart';
import '../Book_Appointment/Third_Check/home_book_Appointment.dart';
import 'doctor_review.dart';

class DoctoProfile extends StatelessWidget {
  static const String routeName = 'doctor_profile';

  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)!.settings.arguments as Doctors;

    return DefaultTabController(animationDuration: Duration(milliseconds: 700),
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          leading: Padding(
            padding: const EdgeInsets.only(left: 4, top: 4, bottom: 4),
            child: InkWell(
              onTap: () => Navigator.of(context).pop(),
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
            args.name ?? "Doctor Profile",
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
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 30.h),
          child: Column(
            children: [
              // Doctor Header
              // DoctorTapInfo(doctors: args),
              SizedBox(height: 20.h),
              TabBar(
                labelColor: Colors.blue,
                unselectedLabelColor: Colors.grey,
                indicator: UnderlineTabIndicator(
                  borderSide: BorderSide(width: 4, color: Colors.blue),
                  insets: EdgeInsets.symmetric(horizontal: 100.w),
                ),
                tabs: const [
                  Tab(text: "About"),
                  Tab(text: "Reviews"),
                ],
              ),
              Expanded(
                child: TabBarView(
                  children: [
                    SingleChildScrollView(
                      padding: EdgeInsets.only(top: 20.h),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "About me",
                            style: TextStyle(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          SizedBox(height: 8.h),
                          Text(
                            '${args.name}'
                            'is the top most Immunologists specialist in Christ Hospital at London. She achived several awards for her wonderful contribution in medical field. She is available for private consultation.',
                            style: TextStyle(
                              color: Colors.grey[700],
                              fontSize: 15.sp,
                              height: 1.4,
                            ),
                          ),
                          SizedBox(height: 20.h),
                          Text(
                            "Working Time",
                            style: TextStyle(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          SizedBox(height: 8.h),
                          Text(
                            '${args.startTime ?? "N/A"} - ${args.endTime ?? "N/A"}',
                            style: TextStyle(
                              color: Colors.grey[700],
                              fontSize: 15.sp,
                            ),
                          ),
                          SizedBox(height: 20.h),
                          Text(
                            "STR",
                            style: TextStyle(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          SizedBox(height: 8.h),
                          Text(
                            "${args.phone ?? "No phone number"}",
                            style: TextStyle(
                              color: Colors.grey[700],
                              fontSize: 15.sp,
                            ),
                          ),
                          SizedBox(height: 20.h),
                          Text(
                            "Pengalaman Praktik",
                            style: TextStyle(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          SizedBox(height: 8.h),
                          Text(
                            '${args.address ?? "Unknown"}',
                            style: TextStyle(
                              color: Colors.grey[700],
                              fontSize: 15.sp,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.only(top: 20),
                        child: Expanded(
                          child: Column(
                            children: [
                              ReviewItem(
                                image:' assets/images/Young male doctor in telemedicine concept stock….jpeg',
                                name: 'Jane Cooper',
                                review: 'As someone who lives in a remote area with limited access to healthcare, this telemedicine app has been a game changer for me. I can easily schedule virtual appointments with doctors and get the care I need without having to travel long distances.',
                                stars: 5,
                                time: 'Today',
                              ),
                              ReviewItem(
                                image:' assets/images/Young male doctor in telemedicine concept stock….jpeg',
                                name: 'Robert Fox',
                                review: 'I was initially skeptical about using a telemedicine app but this app has exceeded my expectations. The doctors are highly qualified and provide excellent care.',
                                stars: 4,
                                time: 'Today',
                              ),
                              ReviewItem(
                                image:' assets/images/Young male doctor in telemedicine concept stock….jpeg',
                                name: 'Jacob Jones',
                                review: 'As someone who lives in a remote area with limited access to healthcare, this telemedicine app has been a game changer for me. I can easily schedule virtual appointments with doctors and get the care I need without having to travel long distances.',
                                stars: 5,
                                time: 'Today',
                              ),
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 10.h),
                child: SizedBox(
                  width: double.infinity,
                  height: 50.h,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pushNamed(HomeBookAppointment.routeName,arguments: args);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.r),
                      ),
                    ),
                    child: Text(
                      "Make An Appointment",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}