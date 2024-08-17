abstract class Failure {
  final String errMessage;

  Failure({required this.errMessage});
}

class ServerFailure extends Failure {
  ServerFailure({required super.errMessage});

  factory ServerFailure.fromResponse(int statusCode, dynamic response) {
    if (statusCode == 400 || statusCode == 401 || statusCode == 403) {
      return ServerFailure(errMessage: response['message']);
    } else if (statusCode == 404) {
      return ServerFailure(
          errMessage: 'Your request not found, please try again later!');
    } else if (statusCode == 500) {
      return ServerFailure(
          errMessage: 'Internal server problem, please try again later!');
    } else {
      return ServerFailure(
          errMessage: 'Oops there was an error, please try again later!');
    }
  }
}
