import 'package:dartz/dartz.dart';
import 'package:doctor/data/Failer.dart';
import 'package:doctor/data/home/specialization_response.dart';
import 'package:doctor/ui/Home_Page/specialization_data_source.dart';
import 'package:doctor/ui/Home_Page/specialization_reposatiory_contract.dart';

class SpecializationReposatioryImp implements SpecializationReposaitoryContract {
  SpecializationDataSource specializationDataSource;
  SpecializationReposatioryImp({required this.specializationDataSource});
  @override
  Future<Either<Failer, SpecializationResponse>> get_specialization() {
   return specializationDataSource.get_specialization();
  }

}