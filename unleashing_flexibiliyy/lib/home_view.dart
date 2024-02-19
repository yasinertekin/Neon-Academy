import 'package:flutter/material.dart';
import 'package:unleashing_flexibiliyy/image_enum.dart';

/// The home view for the app.
final class HomeView extends StatelessWidget {
  /// Creates the home view.
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const _HomeAppBar(),
      body: Column(
        children: <Widget>[
          const Spacer(),
          Expanded(
            child: Image.network(
              fit: BoxFit.fill,
              ImageEnum.neonAppsLogo.value,
            ),
          ),
          const Spacer(),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(child: _CustomButton()),
              SizedBox(width: 10),
              Expanded(child: _CustomButton()),
            ],
          ),
          const Spacer(),
        ],
      ),
    );
  }
}

final class _CustomButton extends StatelessWidget {
  const _CustomButton();

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
      child: const Text('Button 1'),
    );
  }
}

final class _HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  const _HomeAppBar();

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text('Welcome to FinSmart'),
      bottom: const PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight),
        child: Text('Hello Andrew! Welcome Back'),
      ),
      actions: [
        ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Image.network(
            fit: BoxFit.fill,
            ImageEnum.appBarImage.value,
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
