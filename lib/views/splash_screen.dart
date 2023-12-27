import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:todo_test_api/providers/auth_provider.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
          future: context.read<AuthProvider>().isAuth(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            }
            if (snapshot.data == true) {
              GoRouter.of(context).pushNamed('home');
            }
            if (snapshot.data == false) {
              GoRouter.of(context).pushNamed('signup');
            }
            return Center(child: CircularProgressIndicator());
          }),
    );
  }
}
