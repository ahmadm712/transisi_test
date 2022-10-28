import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_transisi/cubits/auth_cubit/auth_cubit.dart';
import 'package:test_transisi/cubits/create_user_cubit/create_user_cubit.dart';
import 'package:test_transisi/cubits/detail_user_cubit/detail_user_cubit.dart';
import 'package:test_transisi/cubits/list_users_cubit/list_users_cubit.dart';
import 'package:test_transisi/services/api_services.dart';
import 'package:test_transisi/ui/pages/auth/login_page.dart';
import 'package:test_transisi/ui/pages/home/home_page.dart';
import 'package:test_transisi/utils/routes.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  // This widget is the root of your application.
  final ApiServices apiServices = ApiServices();
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AuthCubit(apiServices),
        ),
        BlocProvider(
          create: (context) => ListUsersCubit(apiServices)..fetchUsers(),
        ),
        BlocProvider(
          create: (context) => DetailUserCubit(apiServices),
        ),
        BlocProvider(
          create: (context) => CreateUserCubit(apiServices),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Transisi Test',
        theme: ThemeData(
          colorScheme:
              ColorScheme.fromSwatch().copyWith(primary: Colors.blueGrey),
        ),
        onGenerateRoute: mainRoutes,
        home: const LoginPage(),
      ),
    );
  }
}
