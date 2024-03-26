// import 'package:api_case/feature/users/cubit/users_cubit.dart';
// import 'package:api_case/feature/users/cubit/users_state.dart';
// import 'package:api_case/product/service/food_service.dart';
// import 'package:dio/dio.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// class UsersPage extends StatelessWidget {
//   const UsersPage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider(
//       create: (context) => UsersCubit(
//         FoodServiceImpl(
//           service: Dio(
//             BaseOptions(
//               baseUrl: ServiceUrl.usersBaseUrl.value,
//             ),
//           ),
//         ),
//       ),
//       child: const UsersView(),
//     );
//   }
// }

// class UsersView extends StatelessWidget {
//   const UsersView({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       floatingActionButton: FloatingActionButton(
//         onPressed: () {
//           context.read<UsersCubit>().postUsers();
//         },
//         child: const Icon(Icons.refresh),
//       ),
//       body: BlocBuilder<UsersCubit, UsersState>(
//         builder: (context, state) {
//           if (state.isLoading) {
//             return const Center(
//               child: CircularProgressIndicator(),
//             );
//           } else if (state.error.isNotEmpty) {
//             return Center(
//               child: Text(state.error),
//             );
//           } else {
//             return ListView.builder(
//               itemCount: state.users.length,
//               itemBuilder: (context, index) {
//                 final user = state.users[index];
//                 return ListTile(
//                   title: Text(user.username ?? ''),
//                   subtitle: Text(user.description ?? ''),
//                   trailing: IconButton(
//                     icon: const Icon(Icons.link),
//                     onPressed: () {
//                       // Open the user's LinkedIn profile
//                     },
//                   ),
//                 );
//               },
//             );
//           }
//         },
//       ),
//     );
//   }
// }
