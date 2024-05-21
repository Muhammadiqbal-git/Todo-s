import 'package:todos_porto_2/core/exceptions/error_code.dart';

class AppException implements Exception{
  final String message;
  final String code;

  AppException(this.message, this.code);
  @override
  String toString() {
    return "AppException: $message (code: $code)";
  }
}

class NetworkException extends AppException{
  NetworkException(String message) : super(message, ErrorCode.networkError);
}
class NotFoundException extends AppException{
  NotFoundException(String message) : super(message, ErrorCode.notFound);
    
}class UnAuthorizedException extends AppException{
  UnAuthorizedException(String message) : super(message, ErrorCode.unauthorized);
}