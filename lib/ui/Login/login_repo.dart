// import 'package:dartz/dartz.dart';
// import 'package:doctor/data/feature/api_manager.dart';
//
// import '../../data/Failer.dart';
// import '../../data/authe/Login_response.dart';
//
// class LoginReposatiory {
//   ApiManager apiManager;
//
//   LoginReposatiory({required this.apiManager});
//
//   Future<Either<Failer, LoginResponse>> Login (
//     String Email,
//     String Password,
//   ) async {
//     var eiher = await apiManager.Login(Email, Password);
//     return eiher.fold(
//       (l) {
//         return Left(Failer(errorMessage: l.errorMessage));
//       },
//       (response) {
//         return Right(response);
//       },
//     );
//   }
// }
