import 'package:dio/dio.dart';

abstract class Failure {
  final String errMessage;
  const Failure(this.errMessage);
}

class ServerFailure extends Failure {
  ServerFailure(super.errMessage);

  factory ServerFailure.fromDioError(DioException dioError) {
    // Check if response is null and handle it
    final response = dioError.response;
      
    if (response == null) {
      return ServerFailure('Error: No response received or connection failed');
    }

    switch (dioError.type) {
      case DioExceptionType.connectionTimeout:
        return ServerFailure('Connection timeout with ApiServer');

      case DioExceptionType.sendTimeout:
        return ServerFailure('Send timeout with ApiServer');

      case DioExceptionType.receiveTimeout:
        return ServerFailure('Receive timeout with ApiServer');

      case DioExceptionType.badResponse:
        // Now safely using the response as it's confirmed to be non-null
        return ServerFailure.fromResponse(response.statusCode, response.data);

      case DioExceptionType.cancel:
        return ServerFailure('Request to ApiServer was canceled');

      case DioExceptionType.unknown:
        if (dioError.error != null &&
            dioError.error.toString().contains('SocketException')) {
          return ServerFailure('No Internet Connection');
        }
        return ServerFailure('Unexpected Error, Please try again!');

      default:
        return ServerFailure('Oops, there was an error. Please try again.');
    }
  }

  factory ServerFailure.fromResponse(int? statusCode, dynamic response) {
    if (statusCode == null) {
      return ServerFailure('Error: Status code is null');
    }
    if (statusCode == 422) {
      return ServerFailure("Wrong Verification Code");
    }
    if (statusCode == 409) {
      return ServerFailure("You already have an account. Please login.");
    }
    // Check if response is null or does not contain 'error' or 'error' does not contain 'message'
    if (response == null ||
        response['error'] == null ||
        response['error']['message'] == null) {
      return ServerFailure('Some thing went wrong ):');
    }

    // Assuming response is a Map that contains an 'error' key with a 'message' subkey
    if (statusCode == 400 || statusCode == 401 || statusCode == 403) {
      return ServerFailure(response['error']['message'] ??
          'Error: Unknown authentication error');
    } else if (statusCode == 404) {
      return ServerFailure('Your request not found, Please try later!');
    } else if (statusCode == 500) {
      return ServerFailure('Internal Server error, Please try later');
    } else {
      return ServerFailure('Oops, there was an Error, Please try again');
    }
  }

  // factory ServerFailure.fromResponse(int? statusCode, dynamic response) {
  //   // Handle null statusCode or response safely
  //   if (statusCode == null) {
  //     return ServerFailure('Error: Status code is null');
  //   }

  //   // Assuming response is a Map that contains an 'error' key with a 'message' subkey
  //   if (statusCode == 400 || statusCode == 401 || statusCode == 403) {
  //     return ServerFailure(response['error']['message'] ??
  //         'Error: Unknown authentication error');
  //   } else if (statusCode == 404) {
  //     return ServerFailure('Your request not found, Please try later!');
  //   } else if (statusCode == 500) {
  //     return ServerFailure('Internal Server error, Please try later');
  //   } else {
  //     return ServerFailure('Oops, there was an Error, Please try again');
  //   }
  // }
}
