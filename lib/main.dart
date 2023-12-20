import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state_management_project/provider/auth_provider.dart';
import 'package:state_management_project/provider/count_provider.dart';
import 'package:state_management_project/provider/example_one_provider.dart';
import 'package:state_management_project/provider/favourite_provider.dart';
import 'package:state_management_project/provider/theme_changer_provider.dart';
import 'package:state_management_project/screen/favourite/login.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => CountProvider()),
        ChangeNotifierProvider(create: (_) => ExampleOneProvider()),
        ChangeNotifierProvider(create: (_) => FavouriteProvider()),
        ChangeNotifierProvider(create: (_) => ThemeChangerProvider()),
        ChangeNotifierProvider(create: (_) => AuthProvider()),
      ],
      child: Builder(
        builder: (BuildContext context) {
          final themeChanger = Provider.of<ThemeChangerProvider>(context);
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            themeMode: themeChanger.themeMode,
            theme: ThemeData(
              brightness: Brightness.light,
              primarySwatch: Colors.blue,
            ),
            darkTheme: ThemeData(
              brightness: Brightness.dark,
              primarySwatch: Colors.pink,
            ),
            title: 'Provider State Management',
            home: const LoginScreen(),
          );
        },
      ),
    );
  }
}
