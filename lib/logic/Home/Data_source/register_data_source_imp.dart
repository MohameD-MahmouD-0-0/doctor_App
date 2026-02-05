import 'package:dartz/dartz.dart';
import 'package:doctor/data/authe/Register/register_response.dart';
import 'package:doctor/data/feature/Failer.dart';
import 'package:doctor/data/feature/api_manager.dart';
import 'package:doctor/logic/Home/Data_source/register_data_source.dart';

class RegisterDataSourceImp implements RegisterDataSource{
  ApiManager apiManager;
  RegisterDataSourceImp({required this.apiManager});

  @override
  Future<Either<Failer, RegisterResponse>> register(String name, String email, String phone, String gender, String password, String password_confirmation)
  async {
    var either = await apiManager.register(name, email, phone, gender, password, password_confirmation);
    return either.fold((l){
      return Left(Failer(errorMessage: l.errorMessage));
    }, (resonse){
      return Right(resonse);
    });
  }

}