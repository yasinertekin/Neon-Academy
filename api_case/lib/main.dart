import 'package:api_case/feature/products/view/products_page.dart';
import 'package:api_case/feature/save_user/cubit/save_user_cubit.dart';
import 'package:api_case/feature/task_master/cubit/task_master_cubit.dart';
import 'package:api_case/product/service/cache_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => SaveUserCubit(),
        ),
        BlocProvider(
          create: (context) => TaskMasterCubit(
            PinnedCacheManager('task_master'),
          ),
        ),
      ],
      child: const _MyApp(),
    ),
  );
}

final class _MyApp extends StatelessWidget {
  const _MyApp();

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const ProductsPage(),
    );
  }
}
