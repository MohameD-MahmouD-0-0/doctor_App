import 'package:dartz/dartz.dart';
import 'package:doctor/data/feature/Failer.dart';
import 'package:doctor/data/feature/api_manager.dart';
import 'package:doctor/data/home/specialization/specialization_response.dart';
import 'package:doctor/logic/Home/Data_source/specialization_data_source.dart';

class SpecializationDataSourceImp implements SpecializationDataSource {
  ApiManager apiManager;
  SpecializationDataSourceImp({required this.apiManager});

  @override
  Future<Either<Failer, SpecializationResponse>> get_specialization() async {
    var eiher = await apiManager.get_specialization();
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
