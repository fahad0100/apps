import 'package:dio/dio.dart';

class BaseApi {
  final dio = Dio(
    BaseOptions(
      baseUrl: 'https://shork-api.onrender.com',
      receiveTimeout: Duration(seconds: 15),
    ),
  );

  final String endPointLogin = '/v1/auth/login';
  final String endPointSignUp = '/v1/auth/create';
  final String endPointLoginGuest = '/v1/auth/guest';
  final String endPointVerify = '/v1/auth/verify';
  final String endPointRefreshToken = '/v1/auth/refresh';
}
