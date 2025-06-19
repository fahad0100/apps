import 'package:consultant_app/styles/colors_app.dart';
import 'package:consultant_app/ui/screens/signup/bloc/sign_up_bloc.dart';
import 'package:consultant_app/ui/widgets/bottomsheet/display_verify_auth.dart';
import 'package:consultant_app/ui/widgets/buttons/custom_button_next.dart';
import 'package:consultant_app/ui/widgets/fields/custom_field.dart';
import 'package:consultant_app/ui/widgets/icons/language_icon.dart';
import 'package:consultant_app/ui/widgets/labels/custom_label.dart';
import 'package:consultant_app/ui/widgets/labels/text_Custom.dart';
import 'package:consultant_app/ui/widgets/segment/gender_widget.dart';
import 'package:consultant_app/utils/extension/nav.dart';
import 'package:consultant_app/utils/extension/screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignUpBloc(),
      child: Builder(
        builder: (context) {
          final bloc = context.read<SignUpBloc>();
          return Scaffold(
            resizeToAvoidBottomInset: false,
            body: SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(24.0),
                child: SingleChildScrollView(
                  child: SizedBox(
                    height: context.getSizeHeight(size: 0.82),
                    child: Stack(
                      children: [
                        BlocBuilder<SignUpBloc, SignUpState>(
                          builder: (context, state) {
                            return Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                LanguageIcon(onTap: () {}),
                                SizedBox(height: 20),

                                CustomLabel(
                                  title: "Create account",
                                  isHeadLine: true,
                                ),
                                SizedBox(height: 18),
                                CustomField(
                                  withExt: false,
                                  title: "Name",
                                  hintField: "Full name",
                                  controller: bloc.controllerFullName,
                                  statusValidation: bloc.nameState,
                                  onChange: (p0) {
                                    bloc.validationNameWhenChange(text: p0);

                                    return null;
                                  },
                                ),
                                SizedBox(height: 18),

                                CustomField(
                                  hintField: "Ex: example@example.com",
                                  title: "Email",
                                  controller: bloc.controllerEmail,

                                  statusValidation: bloc.emailState,
                                  onChange: (p0) {
                                    bloc.validationEmailWhenChange(text: p0);

                                    return null;
                                  },
                                ),
                                SizedBox(height: 18),

                                GenderWidget(
                                  selected: bloc.selectGender,
                                  onTapSelect: bloc.changeGender,
                                ),

                                // Spacer(),
                              ],
                            );
                          },
                        ),
                        Positioned(
                          bottom: 0,
                          child: Column(
                            children: [
                              TextCustom(
                                titleFirst: 'You dont have an account?',
                                titleSecond: 'Log in',
                                onTap: () {
                                  context.moveAndRemove(routeName: '/login');
                                },
                              ),
                              SizedBox(height: 24),
                              BlocBuilder<SignUpBloc, SignUpState>(
                                builder: (context, state) {
                                  return CustomButtonNext(
                                    isEnable: bloc.isEnableSignUp,
                                    onTap: () {
                                      return showModalBottomSheet(
                                        context: context,
                                        backgroundColor: ColorsApp.systemWhite,
                                        showDragHandle: true,
                                        builder: (context) => BlocProvider.value(
                                          value: bloc,
                                          child: VerifyOtpSheet(
                                            controllerResend:
                                                bloc.controllerResend,
                                            emailOrPhone:
                                                bloc.controllerEmail!.text,
                                            onTapResend: () {
                                              //

                                              // bloc.controllerResend.reset();
                                              // bloc.controllerResend.start();
                                            },

                                            onCompleted: (otp) {
                                              context.moveAndRemove(
                                                routeName: '/home',
                                              );
                                            },
                                          ),
                                        ),
                                      );
                                    },
                                  );
                                },
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

//-------

//


//

//


//
