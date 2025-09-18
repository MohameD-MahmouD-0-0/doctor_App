import 'package:doctor/data/feature/api_manager.dart';
import 'package:doctor/ui/Home_Page/specialization_data_source.dart';
import 'package:doctor/ui/Home_Page/specialization_data_source_imp.dart';
import 'package:doctor/ui/Home_Page/specialization_reposatiory_contract.dart';
import 'package:doctor/ui/Home_Page/specialization_reposatiory_imp.dart';
import 'package:doctor/ui/Login/authe_datasource.dart';
import 'package:doctor/ui/Login/authe_datasource_imp.dart';
import 'package:doctor/ui/Login/authe_reposatiory_contract.dart';

import 'Login/authe_reposatiory_imp.dart';

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
