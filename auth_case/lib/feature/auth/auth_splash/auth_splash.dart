import 'package:auth_case/feature/auth/login_page.dart';
import 'package:auth_case/feature/crashlytics_case/crashlytics_case.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

final class AuthSplashView extends StatelessWidget {
  const AuthSplashView({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.data != null) {
          return const CrashlyticsCase();
        } else if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator.adaptive(),
          );
        }
        return const LoginPage();
      },
    );
  }
}
