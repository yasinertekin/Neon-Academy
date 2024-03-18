import 'package:auth_case/feature/auth/login_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class VerifiedEmailPage extends StatelessWidget {
  const VerifiedEmailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const _VerifiedEmailView();
  }
}

final class _VerifiedEmailView extends StatelessWidget {
  const _VerifiedEmailView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Verified Email'),
      ),
      body: Column(
        children: [
          const Center(
            child: Text('Verified Email'),
          ),
          ElevatedButton(
            onPressed: () {
              FirebaseAuth.instance.currentUser?.sendEmailVerification();
              Navigator.push(
                context,
                MaterialPageRoute<void>(
                  builder: (context) => const LoginPage(),
                ),
              );
            },
            child: const Text('Verify Email'),
          ),
        ],
      ),
    );
  }
}
