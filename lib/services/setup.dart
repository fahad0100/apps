import 'package:consultant_app/repository/apis/api_network.dart';
import 'package:get_it/get_it.dart';
import 'package:get_storage/get_storage.dart';

Future<void> setup() async {
  await GetStorage.init();
  GetIt.I.registerSingleton<GetStorage>(GetStorage());
  GetIt.I.registerSingleton<ApiNetwork>(ApiNetwork());
}
