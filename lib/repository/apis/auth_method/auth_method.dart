import 'dart:developer';
import 'dart:io';

import 'package:consultant_app/models/auth_models/auth_model.dart';
import 'package:consultant_app/models/auth_models/login_model.dart';
import 'package:consultant_app/repository/apis/base_api.dart';
import 'package:dio/dio.dart';

class AuthApi {
  final BaseApi _baseApi = BaseApi();

  Future<LoginModel> loginApi({required String email}) async {
    try {
      final response = await _baseApi.dio.post(
        _baseApi.endPointLogin,
        data: {"email": email},
      );

      return LoginModel.fromJson(response.data["data"]);
    } on DioException catch (error) {
      throw FormatException(error.response?.data["message"]);
    } on SocketException catch (_) {
      throw FormatException("Check your internet");
    } catch (_) {
      throw FormatException("The is error with login your account");
    }
  }

  ///
  ///
  ///
  ///
  ///
  ///
  ///
  ///
  Future<AuthModel> verifyApi({
    required String email,
    required String otp,
    required String notificationID,
  }) async {
    try {
      final response = await _baseApi.dio.post(
        _baseApi.endPointVerify,
        data: {"email": email, "otp": otp, "notification_id": notificationID},
      );

      return AuthModel.fromJson(response.data["data"]);
    } on DioException catch (error) {
      print(error.response);
      throw FormatException(error.response?.data["message"]);
    } on SocketException catch (err) {
      print(err);
      throw FormatException("Check your internet");
    } catch (_) {
      throw FormatException("The is error with login your account");
    }
  }

  ///
  ///
  ///
  ///
  ///
  ///
  ///
  ///
  Future<LoginModel> signUpApi({
    required String fullName,
    required String email,
    required String type,
    required String gender,
  }) async {
    try {
      final response = await _baseApi.dio.post(
        _baseApi.endPointSignUp,
        data: {
          "full_name": fullName,
          "email": email,
          "gender": gender,
          "type": type,
        },
      );

      return LoginModel.fromJson(response.data["data"]);
    } on DioException catch (error) {
      throw FormatException(error.response?.data["message"]);
    } on SocketException catch (_) {
      throw FormatException("Check your internet");
    } catch (_) {
      throw FormatException("The is error with login your account");
    }
  }

  ///
  ///
  ///
  ///
  ///
  ///
  ///

  loginGuestApi() {}

  refreshApi() {}
}
