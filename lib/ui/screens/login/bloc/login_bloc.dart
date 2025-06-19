import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:consultant_app/repository/apis/api_network.dart';
import 'package:consultant_app/ui/screens/signup/bloc/sign_up_bloc.dart';
import 'package:consultant_app/ui/widgets/fields/custom_field.dart';
import 'package:flutter/widgets.dart';
import 'package:get_it/get_it.dart';
import 'package:get_storage/get_storage.dart';
import 'package:meta/meta.dart';
import 'package:otp_timer_button/otp_timer_button.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final TextEditingController emailController = TextEditingController(
    text: "alinyadriana@googl.win",
  );
  StatusValidationCustoMField emailState = StatusValidationCustoMField.nano;
  final controllerResend = OtpTimerButtonController();

  bool isEnableLogin = false;
  bool isEnableResend = true;

  LoginBloc() : super(LoginInitial()) {
    on<LoginAccountEvent>(loginMethod);
    on<VerifyAccountEvent>(verifyAMethod);
  }

  reload() {
    isEnableResend = true;

    emit(UpdateState());
  }

  FutureOr<void> loginMethod(
    LoginAccountEvent event,
    Emitter<LoginState> emit,
  ) async {
    try {
      emit(LoadingState());
      final loginData = await GetIt.I.get<ApiNetwork>().authApi.loginApi(
        email: emailController.text,
      );
      emit(SuccessState());
    } on FormatException catch (error) {
      emit(ErrorState(msg: error.message));
    } catch (error) {
      emit(ErrorState(msg: error.toString()));
    }
  }

  validationEmailWhenChange({String? text}) {
    validationEmail(
      text: text,
      onDone: (p0) {
        if (p0 == null) {
          emailState = StatusValidationCustoMField.nano;
          isEnableLogin = false;
        } else if (p0 == true) {
          emailState = StatusValidationCustoMField.pass;
          isEnableLogin = true;
        } else if (p0 == false) {
          emailState = StatusValidationCustoMField.error;
          isEnableLogin = false;
        }
        emit(UpdateState());
      },
    );
  }

  @override
  Future<void> close() {
    return super.close();
  }

  FutureOr<void> verifyAMethod(
    VerifyAccountEvent event,
    Emitter<LoginState> emit,
  ) async {
    try {
      emit(LoadingState());

      final tokenResult = await GetIt.I.get<ApiNetwork>().authApi.verifyApi(
        email: emailController.text,
        otp: event.otp,
        notificationID: "6f873b00-f705-4acb-bb5e-01a111a98fe6",
      );
      await GetIt.I.get<GetStorage>().write("auth", tokenResult.toJson());
      await GetIt.I.get<GetStorage>().save();

      emit(LoginSuccessState());
    } on FormatException catch (error) {
      emit(ErrorState(msg: error.message));
    } catch (error) {
      emit(ErrorState(msg: error.toString()));
    }
  }
}
