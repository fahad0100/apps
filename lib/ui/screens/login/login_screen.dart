import 'package:consultant_app/models/auth_models/auth_model.dart';
import 'package:consultant_app/repository/apis/auth_method/auth_method.dart';
import 'package:consultant_app/styles/colors_app.dart';
import 'package:consultant_app/ui/screens/login/bloc/login_bloc.dart';
import 'package:consultant_app/ui/widgets/bottomsheet/display_verify_auth.dart';
import 'package:consultant_app/ui/widgets/buttons/custom_button_next.dart';
import 'package:consultant_app/ui/widgets/fields/custom_field.dart';
import 'package:consultant_app/ui/widgets/icons/language_icon.dart';
import 'package:consultant_app/ui/widgets/labels/custom_label.dart';
import 'package:consultant_app/ui/widgets/labels/text_Custom.dart';
import 'package:consultant_app/utils/extension/nav.dart';
import 'package:consultant_app/utils/extension/screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginBloc(),
      child: Builder(
        builder: (context) {
          final bloc = context.read<LoginBloc>();
          return Scaffold(
            body: SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(24.0),
                child: SingleChildScrollView(
                  child: SizedBox(
                    height: context.getSizeHeight(size: 0.82),
                    child: Stack(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            LanguageIcon(onTap: () {}),
                            SizedBox(height: 20),

                            CustomLabel(
                              title: "Log In 222222",
                              isHeadLine: true,
                            ),
                            SizedBox(height: 18),
                            BlocBuilder<LoginBloc, LoginState>(
                              builder: (context, state) {
                                return CustomField(
                                  withExt: false,
                                  title: "Email ........",
                                  hintField: "Email Login",
                                  statusValidation: bloc.emailState,
                                  controller: bloc.emailController,
                                  onChange: (p1) {
                                    bloc.validationEmailWhenChange(text: p1);
                                    return null;
                                  },
                                );
                              },
                            ),
                            SizedBox(height: 18),

                            // Spacer(),
                          ],
                        ),
                        Positioned(
                          bottom: 0,
                          child: Column(
                            children: [
                              TextCustom(
                                titleFirst: 'You don\'t have an account? ',
                                titleSecond: 'Create an account',
                                onTap: () {
                                  context.moveAndRemove(routeName: '/signup');
                                },
                              ),
                              SizedBox(height: 24),
                              BlocConsumer<LoginBloc, LoginState>(
                                listener: (context, state) {
                                  if (state is LoginSuccessState) {
                                    context.moveAndRemove(routeName: '/home');
                                  }
                                  if (state is LoadingState) {
                                    showDialog(
                                      context: context,

                                      builder: (context) => Center(
                                        child: CircularProgressIndicator(),
                                      ),
                                    );
                                  }
                                  if (state is ErrorState) {
                                    Navigator.pop(context);
                                    ScaffoldMessenger.maybeOf(
                                      context,
                                    )?.showSnackBar(
                                      SnackBar(
                                        backgroundColor: ColorsApp.systemRed,
                                        content: Text(
                                          state.msg,
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    );
                                  }
                                  if (state is SuccessState) {
                                    Navigator.pop(context);
                                    showModalBottomSheet(
                                      context: context,
                                      backgroundColor: ColorsApp.systemWhite,
                                      showDragHandle: true,
                                      builder: (context) => BlocProvider.value(
                                        value: bloc,
                                        child: VerifyOtpSheet(
                                          controllerResend:
                                              bloc.controllerResend,
                                          emailOrPhone:
                                              bloc.emailController.text,
                                          onTapResend: () {},

                                          onCompleted: (otp) {
                                            bloc.add(
                                              VerifyAccountEvent(otp: otp),
                                            );
                                          },
                                        ),
                                      ),
                                    );
                                  }
                                },
                                builder: (context, state) {
                                  return CustomButtonNext(
                                    isEnable: bloc.isEnableLogin,
                                    onTap: () {
                                      bloc.add(LoginAccountEvent());
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
