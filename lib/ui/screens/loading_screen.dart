import 'package:consultant_app/services/setup.dart';
import 'package:consultant_app/styles/colors_app.dart';
import 'package:consultant_app/utils/extension/nav.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:get_storage/get_storage.dart';

class LoadingScreen extends StatelessWidget {
  const LoadingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 1), () async {
      if (!GetIt.I.isRegistered<GetStorage>()) {
        await setup();
      }
      final dataAuthSave = GetIt.I.get<GetStorage>().read("auth");

      if (dataAuthSave == null) {
        context.moveAndRemove(routeName: '/login');
        return;
      }

      context.moveAndRemove(routeName: '/home');
    });
    return Scaffold(
      body: const Center(
        child: CircularProgressIndicator(
          backgroundColor: ColorsApp.textButtonColor,
        ),
      ),
    );
  }
}
