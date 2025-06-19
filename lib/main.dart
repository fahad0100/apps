import 'package:consultant_app/services/setup.dart';
import 'package:consultant_app/styles/theme_app.dart';
import 'package:consultant_app/ui/screens/home/home_screen.dart';
import 'package:consultant_app/ui/screens/loading_screen.dart';
import 'package:consultant_app/ui/screens/login/login_screen.dart';
import 'package:consultant_app/ui/screens/signup/sign_up_screen.dart';
import 'package:flutter/material.dart';

import 'package:go_router/go_router.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await setup();

  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(routerConfig: routes, theme: ThemeApp.lightMode);
  }
}

GoRouter routes = GoRouter(
  routes: [
    GoRoute(path: '/', builder: (context, state) => LoadingScreen()),
    GoRoute(path: '/loading', builder: (context, state) => LoadingScreen()),
    GoRoute(path: '/login', builder: (context, state) => LoginScreen()),
    GoRoute(path: '/signup', builder: (context, state) => SignupScreen()),
    GoRoute(path: '/home', builder: (context, state) => HomeScreen()),
  ],
);
