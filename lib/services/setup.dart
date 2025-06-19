import 'package:consultant_app/data/consultants_data.dart';
import 'package:consultant_app/models/auth_models/auth_model.dart';
import 'package:consultant_app/repository/apis/api_network.dart';
import 'package:get_it/get_it.dart';
import 'package:get_storage/get_storage.dart';

Future<void> setup() async {
  await GetStorage.init();
  GetIt.I.registerSingleton<GetStorage>(GetStorage());
  GetIt.I.registerSingleton<ApiNetwork>(ApiNetwork());

  final dataAuthSave = GetIt.I.get<GetStorage>().read("auth");

  if (dataAuthSave != null) {
    final authDataModel = AuthModel.fromJson(dataAuthSave);
    GetIt.I.registerSingleton<AuthModel>(authDataModel);
    GetIt.I.registerSingleton<ConsultantData>(ConsultantData());
  }
}
