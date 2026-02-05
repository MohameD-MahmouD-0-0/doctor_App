import 'package:doctor/data/home/oppintment_response/cuibt/appointment_states.dart';
import 'package:doctor/data/home/oppintment_response/cuibt/appointment_view_model.dart';
import 'package:doctor/data/home/specialization/specialization_response.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import '../../../../logic/cuibt/provider.dart';
import '../../../app_color.dart';
import '../../../di.dart';

class PaymentSheetBottom extends StatefulWidget {
  Doctors doctor;

  PaymentSheetBottom({required this.doctor});

  @override
  State<PaymentSheetBottom> createState() => _PaymentSheetBottomState();
}

class _PaymentSheetBottomState extends State<PaymentSheetBottom> {
  AppointmentViewModel viewModel = AppointmentViewModel(
    appointmentReposatioryContrat: injectAppointmentReposatiortContract(),
  );

  @override
  Widget build(BuildContext context) {
    ChoseDoctorMeet obj = context.read<ChoseDoctorMeet>();

    return SizedBox(
      height: 300.h,
      width: double.infinity.w,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Payment Info',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            ),
            SizedBox(height: 10.h),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Subtotal',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: AppColor.grey.withAlpha(150),
                    ),
                  ),
                  Text(
                    '\$625',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 8.0,
                horizontal: 10,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Tax',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: AppColor.grey.withAlpha(150),
                    ),
                  ),
                  Text(
                    '\$160',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Payment Total',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                  ),
                  Text(
                    '\$785',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                width: double.infinity,
                child: BlocConsumer<AppointmentViewModel, AppointmentState>(
                  bloc: viewModel,
                  listener: (BuildContext context, AppointmentState state) {
                    if (state is SuccessAppointmentState) {
                      Navigator.pop(context);
                      obj.currentStateIndex++;
                    } else if (state is ErrorAppointmentState) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text(state.errorMessage)),
                      );
                    }
                  },
                  builder: (context, state) {
                    return ElevatedButton(
                      onPressed: () {
                        viewModel.appointmentDoctorPayment(
                          widget.doctor.id!,
                          ChoseDoctorMeet.selectedDay +
                              ' ' + '0${ChoseDoctorMeet.selectedTime}:00',
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColor.mainblue,
                        foregroundColor: Colors.white,
                        padding: EdgeInsets.symmetric(vertical: 18),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadiusGeometry.circular(10),
                        ),
                      ),
                      child: state is LoadingAppointmentState
                          ? CircularProgressIndicator(color: Colors.white)
                          : Text(
                              'Book Now',
                              style: TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
