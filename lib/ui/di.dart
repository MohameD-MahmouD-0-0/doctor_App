import 'package:doctor/data/feature/api_manager.dart';
import 'package:doctor/ui/Login/authe_datasource.dart';
import 'package:doctor/ui/Login/authe_datasource_imp.dart';
import 'package:doctor/ui/Login/authe_reposatiory_contract.dart';

import 'Login/authe_reposatiory_imp.dart';


  AutheReposatioryContract injectReposatiortContract() {
    return AutheReposatioryImp(autheRemoteDataSource: injectRemoteDataSource());
  }

  AutheRemoteDataSource injectRemoteDataSource() {
    return AutheDataSourceImp(apiManager: ApiManager.getinstance());
  }

