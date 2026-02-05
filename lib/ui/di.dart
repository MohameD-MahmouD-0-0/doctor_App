import 'package:doctor/data/feature/api_manager.dart';
import 'package:doctor/logic/Home/Data_source/appointment_data_source.dart';
import 'package:doctor/logic/Home/Data_source/appointment_data_source_imp.dart';
import 'package:doctor/logic/Home/Reposatiory/appointment_reposatiory_imp.dart';
import 'package:doctor/logic/Home/Data_source/specialization_data_source.dart';
import 'package:doctor/logic/Home/Data_source/authe_datasource.dart';
import 'package:doctor/logic/Home/Data_source/authe_datasource_imp.dart';
import 'package:doctor/logic/Home/Reposatiory/authe_reposatiory_contract.dart';
import 'package:doctor/logic/Home/Reposatiory/register_reposatiory_contract.dart';
import '../logic/Home/Data_source/register_data_source.dart';
import '../logic/Home/Data_source/register_data_source_imp.dart';
import '../logic/Home/Data_source/specialization_data_source_imp.dart';
import '../logic/Home/Reposatiory/appointment_reposatiory_contrat.dart';
import '../logic/Home/Reposatiory/register_reposatiory_imp.dart';
import '../logic/Home/Reposatiory/specialization_reposatiory_contract.dart';
import '../logic/Home/Reposatiory/specialization_reposatiory_imp.dart';
import '../logic/Home/Reposatiory/authe_reposatiory_imp.dart';

AutheReposatioryContract injectAutheReposatiortContract() {
  return AutheReposatioryImp(
    autheRemoteDataSource: injectAutheRemoteDataSource(),
  );
}

AutheRemoteDataSource injectAutheRemoteDataSource() {
  return AutheDataSourceImp(apiManager: ApiManager.getinstance());
}

SpecializationReposaitoryContract injectSpecializationReposatiortContract() {
  return SpecializationReposatioryImp(
    specializationDataSource: injectSpecializationRemoteDataSource(),
  );
}
SpecializationDataSource injectSpecializationRemoteDataSource() {
  return SpecializationDataSourceImp(apiManager: ApiManager.getinstance());
}

AppointmentDataSource injectAppointmentRemoteDataSource() {
  return AppointmentDataSourceImp(apiManager: ApiManager.getinstance());
}

AppointmentReposatioryContrat injectAppointmentReposatiortContract() {
  return AppointmentReposatioryImp(
    appointmentDataSource: injectAppointmentRemoteDataSource(),
  );
}

MyAppointmentDataSource injectMyAppointmentRemoteDataSource() {
  return MyAppointmentDataSourceImp(apiManager: ApiManager.getinstance());
}

MyAppointmentReposatioryContrat injectMyAppointmentReposatiortContract() {
  return MyAppointmentReposatioryImp(
    MyappointmentDataSource: injectMyAppointmentRemoteDataSource(),
  );
}

RegisterDataSource injectRegisterRemoteDataSource() {
  return RegisterDataSourceImp(apiManager: ApiManager.getinstance());
}

RegisterReposatioryContract injectRegisterReposatiortContract() {
  return RegisterReposatioryImp(
    registerDataSource: injectRegisterRemoteDataSource(),
  );
}