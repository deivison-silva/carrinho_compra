import 'package:dio/dio.dart';

class ProductException implements Exception {
  DioError error;
  StackTrace stackTrace;
  
  ProductException({
    required this.error,
    required this.stackTrace,
  });
}
