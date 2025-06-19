import 'package:consultant_app/repository/apis/auth_method/auth_method.dart';
import 'package:consultant_app/repository/apis/base_api.dart';
import 'package:consultant_app/repository/apis/consultant_method/consultant_method.dart';

class ApiNetwork {
  final AuthApi authApi = AuthApi();
  final ConsultantApi consultant = ConsultantApi();
}
