import 'package:doctor/ui/Home_Page/Book_Appointment/book_steps.dart';
import 'package:doctor/ui/Home_Page/Book_Appointment/first_book_check.dart';
import 'package:doctor/ui/Home_Page/Book_Appointment/second_book_check.dart';
import 'package:doctor/ui/Home_Page/Book_Appointment/third_book_check.dart';
import 'package:doctor/ui/Home_Page/cuibt/provider.dart';
import 'package:doctor/ui/Home_Page/home_screen.dart';
import 'package:doctor/ui/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../../data/home/specialization_response.dart';
import 'bootom_sheet_payment_info.dart';

class HomeBookAppointment extends StatefulWidget {
  static const String routeName = 'BookAppointment';

  @override
  State<HomeBookAppointment> createState() => _HomeBookAppointmentState();
}

class _HomeBookAppointmentState extends State<HomeBookAppointment> {
  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)!.settings.arguments as Doctors;
    var provider = Provider.of<ChoseDoctorMeet>(context, listen: false);

    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.only(left: 4, top: 4, bottom: 4),
          child: InkWell(
            onTap: resetBookingStep,
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
        title: Text(
          provider.currentStateIndex < 5 ? 'Book Appointment' : 'Details',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 25),
                child: provider.currentStateIndex < 5
                    ? Row(
                  children: [
                    BookSteps(
                      index: 1,
                      statement: 'Date & Time',
                      color: provider.currentStateIndex <= 1
                          ? AppColor.mainblue
                          : Colors.green,
                    ),
                    Container(width: 50, height: 2, color: AppColor.grey.withAlpha(80)),
                    BookSteps(
                      index: 2,
                      statement: 'Payment',
                      color: provider.currentStateIndex == 2
                          ? AppColor.mainblue
                          : provider.currentStateIndex > 2
                          ? Colors.green
                          : Colors.grey.withAlpha(80),
                    ),
                    Container(width: 50, height: 2, color: AppColor.grey.withAlpha(80)),
                    BookSteps(
                      index: 3,
                      statement: 'Summary',
                      color: provider.currentStateIndex == 3
                          ? AppColor.mainblue
                          : provider.currentStateIndex > 3
                          ? Colors.green
                          : Colors.grey.withAlpha(80),
                    ),
                  ],
                )
                    : Column(
                  children: [
                    Image.asset('assets/images/done.png'),
                    SizedBox(height: 10.h),
                    const Text(
                      'Booking Confirmed',
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 30.h),
              provider.currentStateIndex == 1
                  ? FirstBookCheck()
                  : provider.currentStateIndex == 2
                  ? SecondBookChech()
                  : ThirdBookCheck(
                doctorName: args.name!,
                email: args.email!,
                phone: args.phone!,
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Builder(
          builder: (context) {
            var provider = Provider.of<ChoseDoctorMeet>(context, listen: false);

            if (provider.currentStateIndex == 5) {
              return SizedBox(
                height: 60,
                child: ElevatedButton(
                  onPressed: () {
                    resetBookingStep();
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColor.mainblue,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: const Text(
                    'Done',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              );
            }

            if (provider.currentStateIndex == 1) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: SizedBox(
                  height: 60,
                  child: ElevatedButton(
                    onPressed: () {
                      provider.currentStateIndex++;
                      setState(() {});
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColor.mainblue,
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: const Text(
                      'Continue',
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
              );
            }

            return Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      provider.currentStateIndex--;
                      setState(() {});
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.grey[300],
                      foregroundColor: Colors.black,
                      padding: const EdgeInsets.symmetric(vertical: 18),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: const Text(
                      'Back',
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      if (provider.currentStateIndex == 2 ||
                          provider.currentStateIndex == 3) {
                        provider.currentStateIndex++;
                        setState(() {});
                        if (provider.currentStateIndex == 4) {
                          showPaymentInfooShhet();
                        }
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColor.mainblue,
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(vertical: 18),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: const Text(
                      'Continue',
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  void showPaymentInfooShhet() {
    var args = ModalRoute.of(context)!.settings.arguments as Doctors;
    showModalBottomSheet(
      context: context,
      builder: (context) => PaymentSheetBottom(doctor: args),
    );
  }

  void resetBookingStep() {
    var provider = Provider.of<ChoseDoctorMeet>(context, listen: false);
    Navigator.pop(context);
    provider.currentStateIndex = 1;
    provider.selectPayWay(ChoseDoctorMeet.payment);
    provider.saveTodayName(ChoseDoctorMeet.dayName);
    provider.saveday(ChoseDoctorMeet.selectedDay);
    provider.saveTime(ChoseDoctorMeet.selectedTime, 0);
    provider.selectMeetWay(ChoseDoctorMeet.selectedMeet);
  }
}
