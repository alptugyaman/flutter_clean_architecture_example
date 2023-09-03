import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_clean_architecture/src/core/enums/enums.dart';

class NetworkException extends Equatable implements Exception {
  factory NetworkException(dynamic error) {
    late NetworkException serverException;

    try {
      if (error is DioException) {
        switch (error.type) {
          case DioExceptionType.cancel:
            serverException = NetworkException._(
              exceptionType: ServerExceptionType.requestCancelled,
              statusCode: error.response?.statusCode,
              message: 'Request to the server has been canceled',
            );

          case DioExceptionType.connectionTimeout:
            serverException = NetworkException._(
              exceptionType: ServerExceptionType.requestTimeout,
              statusCode: error.response?.statusCode,
              message: 'Connection timeout',
            );

          case DioExceptionType.receiveTimeout:
            serverException = NetworkException._(
              exceptionType: ServerExceptionType.recieveTimeout,
              statusCode: error.response?.statusCode,
              message: 'Receive timeout',
            );

          case DioExceptionType.sendTimeout:
            serverException = NetworkException._(
              exceptionType: ServerExceptionType.sendTimeout,
              statusCode: error.response?.statusCode,
              message: 'Send timeout',
            );

          case DioExceptionType.connectionError:
            serverException = NetworkException._(
              exceptionType: ServerExceptionType.connectionError,
              message: 'Connection error',
            );

          case DioExceptionType.badCertificate:
            serverException = NetworkException._(
              exceptionType: ServerExceptionType.badCertificate,
              message: 'Bad certificate',
            );

          case DioExceptionType.unknown:
            if (error.error
                .toString()
                .contains(ServerExceptionType.socketException.name)) {
              serverException = NetworkException._(
                statusCode: error.response?.statusCode,
                message: 'Verify your internet connection',
              );
            } else {
              serverException = NetworkException._(
                statusCode: error.response?.statusCode,
                message: 'Unexpected error',
              );
            }

          case DioExceptionType.badResponse:
            switch (error.response?.statusCode) {
              case 400:
                serverException = NetworkException._(
                  exceptionType: ServerExceptionType.badRequest,
                  message: 'Bad request.',
                );
              case 401:
                serverException = NetworkException._(
                  exceptionType: ServerExceptionType.unauthorisedRequest,
                  message: 'Authentication failure',
                );
              case 403:
                serverException = NetworkException._(
                  exceptionType: ServerExceptionType.unauthorisedRequest,
                  message: 'User is not authorized to access API',
                );
              case 404:
                serverException = NetworkException._(
                  exceptionType: ServerExceptionType.notFound,
                  message: 'Request ressource does not exist',
                );
              case 405:
                serverException = NetworkException._(
                  exceptionType: ServerExceptionType.unauthorisedRequest,
                  message: 'Operation not allowed',
                );
              case 415:
                serverException = NetworkException._(
                  exceptionType: ServerExceptionType.notImplemented,
                  message: 'Media type unsupported',
                );
              case 422:
                serverException = NetworkException._(
                  exceptionType: ServerExceptionType.unableToProcess,
                  message: 'validation data failure',
                );
              case 429:
                serverException = NetworkException._(
                  exceptionType: ServerExceptionType.conflict,
                  message: 'too much requests',
                );
              case 500:
                serverException = NetworkException._(
                  exceptionType: ServerExceptionType.internalServerError,
                  message: 'Internal server error',
                );
              case 503:
                serverException = NetworkException._(
                  exceptionType: ServerExceptionType.serviceUnavailable,
                  message: 'Service unavailable',
                );
              default:
                serverException = NetworkException._(
                  message: 'Unexpected error',
                );
            }
        }
      } else {
        serverException = NetworkException._(
          message: 'Unexpected error',
        );
      }
    } on FormatException catch (e) {
      serverException = NetworkException._(
        exceptionType: ServerExceptionType.formatException,
        message: e.message,
      );
    } on Exception catch (_) {
      serverException = NetworkException._(
        message: 'Unexpected error',
      );
    }
    return serverException;
  }
  NetworkException._({
    required this.message,
    this.exceptionType = ServerExceptionType.unexpectedError,
    int? statusCode,
  })  : statusCode = statusCode ?? 500,
        name = exceptionType.name;
  final String name;
  final String message;
  final int? statusCode;
  final ServerExceptionType exceptionType;

  @override
  List<Object?> get props => [name, statusCode, exceptionType];
}
