import 'package:dio/dio.dart';
import './dio_service.dart';

class DioServiceImpl implements DioService {
  @override
  Dio getDio() {
    return Dio(
      BaseOptions(
        baseUrl: 'http://localhost:8081/',
        connectTimeout: 30000,
        receiveTimeout: 30000,
      ),
    );
  }
}
