import 'package:bloc/bloc.dart';
import 'package:consultant_app/data/consultants_data.dart';
import 'package:consultant_app/models/auth_models/auth_model.dart';
import 'package:consultant_app/repository/apis/api_network.dart';
import 'package:get_it/get_it.dart';
import 'package:meta/meta.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());
  final getIt = GetIt.I;

  loadDataEducation() async {
    getIt.get<ConsultantData>().dataEducations = await getIt
        .get<ApiNetwork>()
        .education
        .getEducations(token: getIt.get<AuthModel>().token);
  }
}
