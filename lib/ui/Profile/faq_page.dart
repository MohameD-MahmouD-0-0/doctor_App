import 'package:doctor/ui/Profile/custom_faq_row.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../app_color.dart';

class FaqPage extends StatelessWidget {
  static const String routeName = 'faq';

  @override
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
          'FAQ',
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
      body: SingleChildScrollView(
        child: Column(
          children: [
            CustomFaqRow(title: 'What should I expect during a doctors appointment?',
              description: 'During a doctors appointment, you can expect to discuss your medical history,'
                  ' current symptoms or concerns, and any medications or treatments you are taking. The doctor will'
                  ' likely perform a physical exam and may order additional tests or procedures if necessary.',),

            CustomFaqRow(title: 'What should I bring to my doctors appointment?',),
            CustomFaqRow(title: 'What if I need to cancel or reschedule my appointment?',),
            CustomFaqRow(title: 'How do I make an appointment with a doctor?',),
            CustomFaqRow(title: 'How early should I arrive for my doctors appointment?',),
            CustomFaqRow(title: 'How long will my doctors appointment take?',),
            CustomFaqRow(title: 'How much will my doctors appointment cost?',),
            CustomFaqRow(title: 'What should I look for in a good doctor?',),





          ]
        ),
      ),
    );
  }
}
