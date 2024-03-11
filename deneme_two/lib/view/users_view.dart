import 'dart:io';

import 'package:deneme_two/cubit/users_cubit.dart';
import 'package:deneme_two/model/users.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UsersPage extends StatelessWidget {
  const UsersPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const UsersView();
  }
}

final class UsersView extends StatefulWidget {
  const UsersView({super.key});

  @override
  State<UsersView> createState() => _UsersViewState();
}

final class _UsersViewState extends State<UsersView> {
  late final PageController pageController;

  @override
  void initState() {
    super.initState();
    pageController = PageController();
  }

  @override
  void dispose() {
    super.dispose();
    pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UsersCubit, Users>(
      builder: (context, state) {
        return PageView.builder(
          controller: pageController,
          itemCount: Pages.values.length,
          itemBuilder: (context, index) {
            switch (Pages.values[index]) {
              case Pages.home:
                return MyWidget(pageController: pageController);
              case Pages.photoEdit:
                return MyWidget(pageController: pageController);
              case Pages.age:
                return const Placeholder();
              case Pages.name:
                return MyWidget(pageController: pageController);
            }
          },
        );
      },
    );
  }
}

enum Pages {
  home,
  photoEdit,
  age,
  name,
}

final class MyWidget extends StatelessWidget {
  const MyWidget({
    required this.pageController,
    super.key,
  });

  final PageController pageController;

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<UsersCubit>();
    final selectImage =
        context.select((UsersCubit cubit) => cubit.state.imageUrl);
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          if (selectImage.isNotEmpty)
            Image.file(
              File(selectImage),
              height: 200,
              width: 200,
            )
          else
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.image,
                size: 200,
              ),
            ),
          Center(
            child: ElevatedButton(
              onPressed: () async {
                final result = context.read<UsersCubit>().pickImage();
                final imageUrl = await result;
                context.read<UsersCubit>().changeImageUrl(imageUrl);
              },
              child: const Text('Select Image'),
            ),
          ),
        ],
      ),
    );
  }
}
