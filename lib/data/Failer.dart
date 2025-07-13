class Failer {
  String errorMessage;
  Failer({required this.errorMessage});
}
class NetworkEroor extends Failer {
  NetworkEroor({required super.errorMessage});
}
class ServerkEroor extends Failer {
  ServerkEroor({required super.errorMessage});
}