import 'package:dartz/dartz.dart';

import '../../../data/authe/Register/register_response.dart';
import '../../../data/feature/Failer.dart';

abstract class RegisterReposatioryContract{

  Future<Either<Failer, RegisterResponse>>register(String name, String email, String phone, String gender, String password, String password_confirmation);
}