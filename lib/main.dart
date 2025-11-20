// lib/main.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:school_app/views/auth/login/login_page.dart';
import 'package:school_app/views/auth/splash_screen.dart';
import 'providers/auth_provider.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => AuthProvider()..checkLoginStatus(),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<AuthProvider>(
      builder: (context, authProvider, _) {
        return MaterialApp(
          navigatorKey: navigatorKey,
          debugShowCheckedModeBanner: false,
          routes: {'/login': (context) => const LoginPage()},
          // home: HomePage(),
          // home: LoginPage(),
          home: const SplashScreen(),
          // home: authProvider.isLoggedIn ? const HomePage() : const LoginPage(),
        );
      },
    );
  }
}
