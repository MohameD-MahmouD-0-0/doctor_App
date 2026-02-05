class ApiConstant {
  static const String ApiBaseUrl = 'vcare.integration25.com';
  static const String LoginUrl = 'api/auth/login';
  static const String RegisterUrl = 'api/auth/register';
  static const String specializationUrl = 'api/specialization/index';
  static const String appointmentPayUrl = 'api/appointment/store';
  static const String logoutUrl = 'api/auth/logout';
  static const String myAppointmentUrl = 'api/appointment/index';
}
class SharedPreferenceHelper {
  static String userToken = 'user_token';
}
