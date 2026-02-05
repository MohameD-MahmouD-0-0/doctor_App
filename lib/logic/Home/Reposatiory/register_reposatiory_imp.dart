import 'package:dartz/dartz.dart';
import 'package:doctor/data/authe/Register/register_response.dart';
import 'package:doctor/data/feature/Failer.dart';
import 'package:doctor/logic/Home/Data_source/register_data_source.dart';
import 'package:doctor/logic/Home/Reposatiory/register_reposatiory_contract.dart';

class RegisterReposatioryImp implements RegisterReposatioryContract {
  RegisterDataSource registerDataSource;

  RegisterReposatioryImp({required this.registerDataSource});

  @override
  Future<Either<Failer, RegisterResponse>> register(
    String name,
    String email,
    String phone,
    String gender,
    String password,
    String password_confirmation,
  ) {
    return registerDataSource.register(
      name,
      email,
      phone,
      gender,
      password,
      password_confirmation,
    );
  }
}
