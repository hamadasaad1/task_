import 'package:dio/dio.dart';

import 'failure.dart';


/// It handles the error and returns a Failure object
class ErrorHandler implements Exception {
  late Failure failure;
  ErrorHandler.handle(dynamic error) {
    if (error is DioError) {
      failure = _handleError(error);
    } else {
      failure = DataSource.DEFAULT.getFailure();
    }
  }

  Failure _handleError(DioError error) {
    switch (error.type) {
      case DioErrorType.connectTimeout:
        return DataSource.CONNECT_TIMEOUT.getFailure();
      case DioErrorType.sendTimeout:
        return DataSource.SEND_TIMEOUT.getFailure();
      case DioErrorType.receiveTimeout:
        return DataSource.RECEIVE_TIMEOUT.getFailure();
      case DioErrorType.response:
        if (error.response != null &&
            error.response?.statusCode != null &&
            error.response?.statusMessage != null) {
          return Failure(
              code: error.response?.statusCode ?? ResponseCode.DEFAULT,
              message:
                  error.response!.statusMessage ?? ResponseMessage.DEFAULT);
        } else {
          return DataSource.DEFAULT.getFailure();
        }
      case DioErrorType.cancel:
        return DataSource.CANCEL.getFailure();
      case DioErrorType.other:
        return DataSource.DEFAULT.getFailure();
    }
  }
}

enum DataSource {
  SUCCESS,
  NO_CONTENT,
  BAD_REQUEST,
  FORBIDDEN,
  UNAUTHORIZED,
  NOT_FOUND,
  INTERNAL_SERVER_ERROR,
  CONNECT_TIMEOUT,
  CANCEL,
  RECEIVE_TIMEOUT,
  SEND_TIMEOUT,
  CASH_ERROR,
  NO_INTERNET_CONNECTION,
  DEFAULT,
}
/// An extension method.

extension DataSourceExtension on DataSource {
  Failure getFailure() {
    switch (this) {
      case DataSource.SUCCESS:
        return Failure(
            code: ResponseCode.SUCCESS, message: ResponseMessage.SUCCESS);

      case DataSource.NO_CONTENT:
        return Failure(
            code: ResponseCode.NO_CONTENT, message: ResponseMessage.NO_CONTENT);

      case DataSource.BAD_REQUEST:
        return Failure(
            code: ResponseCode.BAD_REQUEST,
            message: ResponseMessage.BAD_REQUEST);
      case DataSource.FORBIDDEN:
        return Failure(
            code: ResponseCode.FORBIDDEN, message: ResponseMessage.FORBIDDEN);
      case DataSource.UNAUTHORIZED:
        return Failure(
            code: ResponseCode.UNAUTHORIZED,
            message: ResponseMessage.UNAUTHORIZED);
      case DataSource.NOT_FOUND:
        return Failure(
            code: ResponseCode.NOT_FOUND, message: ResponseMessage.NOT_FOUND);
      case DataSource.INTERNAL_SERVER_ERROR:
        return Failure(
            code: ResponseCode.INTERNAL_SERVER_ERROR,
            message: ResponseMessage.INTERNAL_SERVER_ERROR);
      case DataSource.CONNECT_TIMEOUT:
        return Failure(
            code: ResponseCode.CONNECT_TIMEOUT,
            message: ResponseMessage.CONNECT_TIMEOUT);
      case DataSource.CANCEL:
        return Failure(
            code: ResponseCode.CANCEL, message: ResponseMessage.CANCEL);
      case DataSource.RECEIVE_TIMEOUT:
        return Failure(
            code: ResponseCode.RECEIVE_TIMEOUT,
            message: ResponseMessage.RECEIVE_TIMEOUT);
      case DataSource.SEND_TIMEOUT:
        return Failure(
            code: ResponseCode.SEND_TIMEOUT,
            message: ResponseMessage.SEND_TIMEOUT);
      case DataSource.CASH_ERROR:
        return Failure(
            code: ResponseCode.CASH_ERROR, message: ResponseMessage.CASH_ERROR);
      case DataSource.NO_INTERNET_CONNECTION:
        return Failure(
            code: ResponseCode.NO_INTERNET_CONNECTION,
            message: ResponseMessage.NO_INTERNET_CONNECTION);
      case DataSource.DEFAULT:
        return Failure(
            code: ResponseCode.DEFAULT,
            message: ResponseMessage.DEFAULT);
    }
  }
}

class ResponseCode {
  static const int SUCCESS = 200; //success with data
  static const int NO_CONTENT = 201; //success no data
  static const int BAD_REQUEST = 400; //failure api rejected request
  static const int FORBIDDEN = 401; //failure api user not auth
  static const int UNAUTHORIZED = 403; //failure api rejected request
  static const int INTERNAL_SERVER_ERROR = 500; //crash in server side
  static const int NOT_FOUND = 404; // api not found in rote of server
//local status code

  static const int CONNECT_TIMEOUT = -1;
  static const int CANCEL = -2;
  static const int RECEIVE_TIMEOUT = -3;
  static const int SEND_TIMEOUT = -4;
  static const int CASH_ERROR = -5;
  static const int NO_INTERNET_CONNECTION = -6;
  static const int DEFAULT = -7;
}

class ResponseMessage {
  static const String SUCCESS = 'success'; //success with data
  static const String NO_CONTENT = 'success'; //success no data
  static const String BAD_REQUEST =
      'Bad Request, Try again later'; //failure api rejected request
  static const String FORBIDDEN =
      'Forbidden Request, Try again later'; //failure api user not auth
  static const String UNAUTHORIZED =
      'User is unauthorized, Try again later'; //failure api rejected request
  static const String INTERNAL_SERVER_ERROR =
      'Something went wrong, Try again later '; //crash in server side
  static const String NOT_FOUND =
      'Not found, Try again later '; // api not found in rote of server
//local status code

  static const String CONNECT_TIMEOUT = 'Time out error, Try again later ';
  static const String CANCEL = 'Request was cancelled, Try again later ';
  static const String RECEIVE_TIMEOUT = 'Time out error, Try again later ';
  static const String SEND_TIMEOUT = 'Time out error, Try again later ';
  static const String CASH_ERROR = 'Cache error, Try again later ';
  static const String NO_INTERNET_CONNECTION =
      'Please check your internet connection ';
  static const String DEFAULT = 'Something went wrong, Try again later';
}

class ApiInternalStatus {
  static const int SUCCESS = 0;
  static const int FAILURE = 1;
}
