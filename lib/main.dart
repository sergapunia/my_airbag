import 'package:airbag_project_new/go_router/go_router_navigation.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: GoRouterNavigation.router,
      debugShowCheckedModeBanner: false,
    );
  }
}
