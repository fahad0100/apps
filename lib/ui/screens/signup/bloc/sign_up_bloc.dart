// ignore_for_file: invalid_use_of_visible_for_testing_member

import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:consultant_app/ui/widgets/fields/custom_field.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:otp_timer_button/otp_timer_button.dart';

part 'sign_up_event.dart';
part 'sign_up_state.dart';

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  TextEditingController? controllerFullName = TextEditingController();
  TextEditingController? controllerEmail = TextEditingController();
  StatusValidationCustoMField nameState = StatusValidationCustoMField.nano;
  StatusValidationCustoMField emailState = StatusValidationCustoMField.nano;
  final controllerResend = OtpTimerButtonController();
  int selectGender = 1;
  bool isEnableSignUp = false;

  SignUpBloc() : super(SignUpInitial()) {
    on<CreateAccountEvent>(createAccountMethod);
  }

  FutureOr<void> createAccountMethod(
    CreateAccountEvent event,
    Emitter<SignUpState> emit,
  ) {}

  validationNameWhenChange({String? text}) {
    print("------");
    if (text == null || text.isEmpty) {
      nameState = StatusValidationCustoMField.nano;
      emit(UpdateState());
      return;
    }

    final RegExp nameRegExp = RegExp(r'^[a-zA-Z]{4,}(?: [a-zA-Z]+){2,2}$');
    if (nameRegExp.hasMatch(text)) {
      nameState = StatusValidationCustoMField.pass;
    } else {
      nameState = StatusValidationCustoMField.error;
    }
    checkPass(nameState: nameState, emailState: emailState);

    emit(UpdateState());
  }

  validationEmailWhenChange({String? text}) {
    validationEmail(
      text: text,
      onDone: (p0) {
        if (p0 == null) {
          emailState = StatusValidationCustoMField.nano;
        } else if (p0 == true) {
          emailState = StatusValidationCustoMField.pass;
          isEnableSignUp = true;
        } else if (p0 == false) {
          emailState = StatusValidationCustoMField.error;
        }
      },
    );
    checkPass(nameState: nameState, emailState: emailState);

    emit(UpdateState());
  }

  checkPass({
    required StatusValidationCustoMField nameState,
    required StatusValidationCustoMField emailState,
  }) {
    if (nameState == StatusValidationCustoMField.pass &&
        emailState == StatusValidationCustoMField.pass) {
      isEnableSignUp = true;
    } else {
      isEnableSignUp = false;
    }
  }

  changeGender(int index) {
    selectGender = index;
    emit(UpdateState());
  }
}

//^([a-zA-Z]{2,}\s[a-zA-Z]{1,}'?-?[a-zA-Z]{2,}\s?([a-zA-Z]{1,})?)

//----

validationEmail({String? text, required Function(bool?) onDone}) {
  if (text == null || text.isEmpty) {
    onDone(null);
    return;
  }

  final RegExp nameRegExp = RegExp(
    r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+",
  );
  if (nameRegExp.hasMatch(text)) {
    onDone(true);
  } else {
    onDone(false);
  }
}
