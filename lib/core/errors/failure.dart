import 'package:dio/dio.dart';

abstract class Failure {
  final String error;

  const Failure(this.error);
}

class ServerFailure extends Failure {
  ServerFailure(super.error);

  factory ServerFailure.fromDioError(DioError dioError) {
    switch (dioError.type) {
      case DioExceptionType.connectionTimeout:
        return ServerFailure('Connection time out');
      case DioExceptionType.sendTimeout:
        return ServerFailure('Send time out');
      case DioExceptionType.receiveTimeout:
        return ServerFailure('Receive time out');
      case DioExceptionType.badCertificate:
        return ServerFailure('Bad certificate');
      case DioExceptionType.badResponse:
        return ServerFailure.fromResponse(
          dioError.response!.statusCode!,
          dioError.response!.data,
        );
      case DioExceptionType.cancel:
        return ServerFailure('Request canceled');
      case DioExceptionType.connectionError:
        return ServerFailure('Connection error');
      case DioExceptionType.unknown:
        if (dioError.message!.contains('SocketException')) {
          return ServerFailure('No internet connection');
        }
        return ServerFailure('Unexpected error, try again');
      default:
        return ServerFailure('Oops, there has been an error');
    }
  }

  factory ServerFailure.fromResponse(
    int statusCode,
    Map<String, dynamic> josn,
  ) {
    if (statusCode == 400 || statusCode == 401 || statusCode == 403) {
      return ServerFailure(josn['error']['message']);
    } else if (statusCode == 404) {
      return ServerFailure('Not found, try later');
    } else if (statusCode == 500) {
      return ServerFailure('Internal server error, try later');
    }
    return ServerFailure('Oops there has been an error');
  }
}
