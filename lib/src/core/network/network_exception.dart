import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_clean_architecture/src/core/enums/enums.dart';

class ServerException extends Equatable implements Exception {
  factory ServerException(dynamic error) {
    late ServerException serverException;

    try {
      if (error is DioException) {
        switch (error.type) {
          case DioExceptionType.cancel:
            serverException = ServerException._(
              exceptionType: ServerExceptionType.requestCancelled,
              statusCode: error.response?.statusCode,
              message: 'Request to the server has been canceled',
            );

          case DioExceptionType.connectionTimeout:
            serverException = ServerException._(
              exceptionType: ServerExceptionType.requestTimeout,
              statusCode: error.response?.statusCode,
              message: 'Connection timeout',
            );

          case DioExceptionType.receiveTimeout:
            serverException = ServerException._(
              exceptionType: ServerExceptionType.recieveTimeout,
              statusCode: error.response?.statusCode,
              message: 'Receive timeout',
            );

          case DioExceptionType.sendTimeout:
            serverException = ServerException._(
              exceptionType: ServerExceptionType.sendTimeout,
              statusCode: error.response?.statusCode,
              message: 'Send timeout',
            );

          case DioExceptionType.connectionError:
            serverException = ServerException._(
              exceptionType: ServerExceptionType.connectionError,
              message: 'Connection error',
            );

          case DioExceptionType.badCertificate:
            serverException = ServerException._(
              exceptionType: ServerExceptionType.badCertificate,
              message: 'Bad certificate',
            );

          case DioExceptionType.unknown:
            if (error.error
                .toString()
                .contains(ServerExceptionType.socketException.name)) {
              serverException = ServerException._(
                statusCode: error.response?.statusCode,
                message: 'Verify your internet connection',
              );
            } else {
              serverException = ServerException._(
                statusCode: error.response?.statusCode,
                message: 'Unexpected error',
              );
            }

          case DioExceptionType.badResponse:
            switch (error.response?.statusCode) {
              case 400:
                serverException = ServerException._(
                  exceptionType: ServerExceptionType.badRequest,
                  message: 'Bad request.',
                );
              case 401:
                serverException = ServerException._(
                  exceptionType: ServerExceptionType.unauthorisedRequest,
                  message: 'Authentication failure',
                );
              case 403:
                serverException = ServerException._(
                  exceptionType: ServerExceptionType.unauthorisedRequest,
                  message: 'User is not authorized to access API',
                );
              case 404:
                serverException = ServerException._(
                  exceptionType: ServerExceptionType.notFound,
                  message: 'Request ressource does not exist',
                );
              case 405:
                serverException = ServerException._(
                  exceptionType: ServerExceptionType.unauthorisedRequest,
                  message: 'Operation not allowed',
                );
              case 415:
                serverException = ServerException._(
                  exceptionType: ServerExceptionType.notImplemented,
                  message: 'Media type unsupported',
                );
              case 422:
                serverException = ServerException._(
                  exceptionType: ServerExceptionType.unableToProcess,
                  message: 'validation data failure',
                );
              case 429:
                serverException = ServerException._(
                  exceptionType: ServerExceptionType.conflict,
                  message: 'too much requests',
                );
              case 500:
                serverException = ServerException._(
                  exceptionType: ServerExceptionType.internalServerError,
                  message: 'Internal server error',
                );
              case 503:
                serverException = ServerException._(
                  exceptionType: ServerExceptionType.serviceUnavailable,
                  message: 'Service unavailable',
                );
              default:
                serverException = ServerException._(
                  message: 'Unexpected error',
                );
            }
        }
      } else {
        serverException = ServerException._(
          message: 'Unexpected error',
        );
      }
    } on FormatException catch (e) {
      serverException = ServerException._(
        exceptionType: ServerExceptionType.formatException,
        message: e.message,
      );
    } on Exception catch (_) {
      serverException = ServerException._(
        message: 'Unexpected error',
      );
    }
    return serverException;
  }
  ServerException._({
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
