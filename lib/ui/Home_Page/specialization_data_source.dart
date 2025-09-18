import 'package:dartz/dartz.dart';

import '../../data/Failer.dart';
import '../../data/home/specialization_response.dart';

abstract class SpecializationDataSource{
  Future<Either<Failer, SpecializationResponse>> get_specialization();
}