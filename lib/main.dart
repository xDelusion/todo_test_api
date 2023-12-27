import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:todo_test_api/providers/auth_provider.dart';
import 'package:todo_test_api/providers/todo_provider.dart';
import 'package:todo_test_api/views/add_note.dart';
import 'package:todo_test_api/views/my_home_page.dart';
import 'package:todo_test_api/views/signin.dart';
import 'package:todo_test_api/views/signup.dart';
import 'package:todo_test_api/views/splash_screen.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (context) => TodoProvider()),
    ChangeNotifierProvider(create: (context) => AuthProvider()),
  ], child: MyApp()));
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Flutter Demo',
      theme: ThemeData(),
      routerConfig: _router,
    );
  }

  final _router = GoRouter(routes: [
    GoRoute(
        path: "/", name: "splash", builder: (context, state) => SplashScreen()),
    GoRoute(
        path: "/home", name: "home", builder: (context, state) => MyHomePage()),
    GoRoute(
      path: '/signup',
      name: "signup",
      builder: (context, state) => SignupPage(),
    ),
    GoRoute(
      path: '/signin',
      builder: (context, state) => SigninPage(),
    ),
    GoRoute(
        path: '/addNote',
        name: "addNote",
        builder: (context, state) => AddNote()),
  ]);
}
