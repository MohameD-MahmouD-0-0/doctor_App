import 'package:dartz/dartz.dart';
import 'package:doctor/data/Failer.dart';
import 'package:doctor/data/authe/Login_response.dart';
import 'package:doctor/ui/Login/authe_datasource.dart';
import 'package:doctor/ui/Login/authe_reposatiory_contract.dart';

class AutheReposatioryImp implements AutheReposatioryContract{
  AutheRemoteDataSource autheRemoteDataSource;
  AutheReposatioryImp({required this.autheRemoteDataSource});
  @override
  Future<Either<Failer, LoginResponse>> login(String Email, String Password) {
    return autheRemoteDataSource.login(Email, Password);
  }
}
