import 'dart:io';

import 'package:consultant_app/models/education_models/education_model.dart';
import 'package:consultant_app/repository/apis/base_api.dart';
import 'package:dio/dio.dart';

class EducationApi {
  final BaseApi _baseApi = BaseApi();
  Future<List<EducationModel>> getEducations({required String token}) async {
    try {
      final response = await _baseApi.dio.get(
        _baseApi.endPointLogin,
        options: Options(headers: {"Authorization": "Bearer $token"}),
      );

      List<EducationModel> listData = List.from(
        response.data ?? [],
      ).map((item) => EducationModel.fromJson(item)).toList();

      return listData;
    } on DioException catch (error) {
      throw FormatException(error.response?.data["message"]);
    } on SocketException catch (_) {
      throw FormatException("Check your internet");
    } catch (_) {
      throw FormatException("The is error with login your account");
    }
  }
}
