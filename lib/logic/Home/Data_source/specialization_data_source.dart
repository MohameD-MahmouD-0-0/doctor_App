import 'package:dartz/dartz.dart';

import '../../../data/feature/Failer.dart';
import '../../../data/home/specialization/specialization_response.dart';

abstract class SpecializationDataSource{
  Future<Either<Failer, SpecializationResponse>> get_specialization();
}