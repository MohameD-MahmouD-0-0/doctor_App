import 'package:dartz/dartz.dart';
import 'package:doctor/data/authe/Login/Login_response.dart';

import '../../../data/feature/Failer.dart';

 abstract class AutheRemoteDataSource{
  Future<Either<Failer,LoginResponse>>login(String Email, String Password);
 }