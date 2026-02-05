import 'package:dartz/dartz.dart';
import 'package:doctor/data/feature/Failer.dart';
import 'package:doctor/data/home/specialization/specialization_response.dart';
import 'package:doctor/logic/Home/Reposatiory/specialization_reposatiory_contract.dart';

import '../Data_source/specialization_data_source.dart';


class SpecializationReposatioryImp implements SpecializationReposaitoryContract {
  SpecializationDataSource specializationDataSource;
  SpecializationReposatioryImp({required this.specializationDataSource});
  @override
  Future<Either<Failer, SpecializationResponse>> get_specialization() {
   return specializationDataSource.get_specialization();
  }

}