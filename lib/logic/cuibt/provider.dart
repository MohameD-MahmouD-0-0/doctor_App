import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';

class ChoseDoctorMeet extends ChangeNotifier {
   int currentStateIndex = 1;
   static String dayName = DateFormat('EEEE').format(DateTime.now());
   static String selectedDay = "${DateTime.now().year}-${DateTime.now().month}-${DateTime.now().day}";
  static int selectedTime = 8;
  static int mintes = 0;
  static String selectedMeet = "in person";
  static String payment = "Credit Card";

  void saveday(String chosenDay) {
    if (selectedDay == chosenDay) {
      return;
    } else {
      selectedDay = chosenDay;
      notifyListeners();
    }
  }

  void saveTodayName(String nameOfDay) {
    if (dayName == nameOfDay) {
      return;
    } else {
      dayName = nameOfDay;
      notifyListeners();
    }
  }

  void saveTime(int choseTime,int mint) {
    mintes = mint;
    if (selectedTime == choseTime ) {
      return;
    } else {
      selectedTime = choseTime;
      notifyListeners();
    }
  }

  void selectMeetWay(String meet) {
    if (selectedMeet == meet) {
      return;
    } else {
      selectedMeet = meet;
      notifyListeners();
    }
  }

  void selectPayWay(String cach) {
    if (payment == cach) {
      return;
    } else {
      payment = cach;
      notifyListeners();
    }
  }
}
