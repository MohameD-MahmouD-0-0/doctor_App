import 'package:dartz/dartz.dart';
import 'package:doctor/data/authe/Login_response.dart';

import '../../data/Failer.dart';

 abstract class AutheRemoteDataSource{
  Future<Either<Failer,LoginResponse>>login( String Email, String Password);

}