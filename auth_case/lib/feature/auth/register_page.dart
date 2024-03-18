import 'package:auth_case/feature/auth/verified_email/verified_email.page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const _RegisterView();
  }
}

final class _RegisterView extends StatelessWidget {
  const _RegisterView();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView(
        children: [
          FirebaseUIActions(
            actions: [
              AuthStateChangeAction<UserCreated>((context, state) {
                Navigator.of(context).push(
                  MaterialPageRoute<void>(
                    builder: (context) => const VerifiedEmailPage(),
                  ),
                );
              }),
            ],
            child: const _RegisterBody(),
          ),
        ],
      ),
    );
  }
}

final class _RegisterBody extends StatelessWidget {
  const _RegisterBody();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.1,
          ),
          const _FirebaseAuth(),
          const SizedBox(height: 16),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute<void>(
                    builder: (context) => const RegisterPage(),
                  ),
                );
              },
              child: const Text('Sign In'),
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
      action: AuthAction.signUp,
      showTitle: false,
      showAuthActionSwitch: false,
      auth: FirebaseAuth.instance,
      providers: FirebaseUIAuth.providersFor(
        FirebaseAuth.instance.app,
      ),
    );
  }
}
