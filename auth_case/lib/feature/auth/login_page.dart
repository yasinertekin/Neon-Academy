import 'package:auth_case/feature/auth/register_page.dart';
import 'package:auth_case/feature/home/home_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:flutter/material.dart';

final class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const _LoginView();
  }
}

final class _LoginView extends StatelessWidget {
  const _LoginView();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
      ),
      body: FirebaseUIActions(
        actions: [
          AuthStateChangeAction<SignedIn>((context, state) {
            state.user != null
                ? Navigator.of(context).pushReplacement(
                    MaterialPageRoute<void>(
                      builder: (context) => const HomePage(),
                    ),
                  )
                : null;
          }),
        ],
        child: const SafeArea(
          child: Center(
            child: Expanded(
              child: _AuthBody(),
            ),
          ),
        ),
      ),
    );
  }
}

final class _AuthBody extends StatelessWidget {
  const _AuthBody();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const _FirebaseAuth(),
          const SizedBox(height: 16),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute<void>(
                    builder: (context) => const RegisterPage(),
                  ),
                );
              },
              child: const Text('Register'),
            ),
          ),
        ],
      ),
    );
  }
}

final class _FirebaseAuth extends StatelessWidget {
  const _FirebaseAuth();

  @override
  Widget build(BuildContext context) {
    return LoginView(
      action: AuthAction.signIn,
      showTitle: false,
      showAuthActionSwitch: false,
      auth: FirebaseAuth.instance,
      providers: FirebaseUIAuth.providersFor(
        FirebaseAuth.instance.app,
      ),
    );
  }
}
