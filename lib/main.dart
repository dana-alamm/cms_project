import 'package:cms_project_app/features/auth/controller/auth_provider.dart';
import 'package:cms_project_app/features/contacts/controller/contacts_provider.dart';
import 'package:cms_project_app/features/lookup/controller/lookup_provider.dart';
import 'package:cms_project_app/features/onboarding/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
void main() {
  runApp(
    // ChangeNotifierProvider(
    //   create: (context) => AuthProvider(),
    //   child: const MyApp(),
    // ),
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => AuthProvider()),
        ChangeNotifierProvider(create: (context) => LookupProvider()),
        ChangeNotifierProvider(create: ((context) => ContactsProvider())),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: navigatorKey,
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,

      home: SplashScreen(),
    );
  }
}
