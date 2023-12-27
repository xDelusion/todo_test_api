import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:todo_test_api/providers/auth_provider.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  late Future<bool> isAuthinticated;
  @override
  void initState() {
    isAuthinticated = getAuthValue();
    super.initState();
  }

  Future<bool> getAuthValue() async {
    return await context.read<AuthProvider>().isAuth();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
          future: isAuthinticated,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            }
            if (snapshot.data == true) {
              WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
                GoRouter.of(context).goNamed('home');
                return;
              });
            }
            if (snapshot.data == false) {
              WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
                GoRouter.of(context).goNamed('signup');
                return;
              });
            }
            return Center(child: CircularProgressIndicator());
          }),
    );
  }
}
