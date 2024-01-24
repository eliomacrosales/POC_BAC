import 'package:bac_poc_bloc/src/core/navigation/routes_names.dart';
import 'package:bac_poc_bloc/src/presentation/screens/home/home_page.dart';
import 'package:bac_poc_bloc/src/presentation/screens/login/login_view.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
final GoRouter router = GoRouter(routes: <GoRoute>[
  GoRoute(
    name: RoutesName.login,
    path: '/',
    builder: (BuildContext context, GoRouterState state) {
      return const LoginScreen();
    },
  ),
  GoRoute(
    name: RoutesName.home,
    path: '/home/:email',
    builder: (BuildContext context, GoRouterState state) {
      final email = state.pathParameters['email'] ?? 'unknown';
      return HomePage(email: email);
    },
  )
]);
