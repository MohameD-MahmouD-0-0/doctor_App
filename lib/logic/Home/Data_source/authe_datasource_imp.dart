import 'package:dartz/dartz.dart';
import 'package:doctor/data/feature/Failer.dart';
import 'package:doctor/data/authe/Login/Login_response.dart';
import 'package:doctor/data/feature/api_manager.dart';
import 'package:doctor/logic/Home/Data_source/authe_datasource.dart';

class AutheDataSourceImp implements AutheRemoteDataSource {
  ApiManager apiManager;

  AutheDataSourceImp({required this.apiManager});

  @override
  Future<Either<Failer, LoginResponse>> login(
    String Email,
    String Password,
  ) async {
    var eiher = await apiManager.login(Email, Password);
    return eiher.fold(
      (l) {
        return Left(Failer(errorMessage: l.errorMessage));
      },
      (response) {
        return Right(response);
      },
    );
  }
}
