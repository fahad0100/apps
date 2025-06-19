import 'package:consultant_app/utils/extension/nav.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:get_storage/get_storage.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SizedBox(
          height: 300,
          width: 300,
          child: Column(
            children: [
              Text("Home Screen"),
              ElevatedButton(
                onPressed: () async {
                  await GetIt.I.get<GetStorage>().erase();
                  await GetIt.I.reset();
                  context.moveAndRemove(routeName: '/loading');
                },
                child: Text("Sign Out"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
