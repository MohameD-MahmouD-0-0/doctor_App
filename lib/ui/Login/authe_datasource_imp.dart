import 'package:dartz/dartz.dart';
import 'package:doctor/data/Failer.dart';
import 'package:doctor/data/authe/Login_response.dart';
import 'package:doctor/data/feature/api_manager.dart';
import 'package:doctor/ui/Login/authe_datasource.dart';

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
