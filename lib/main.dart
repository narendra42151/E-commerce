import 'package:amazzon/common/widgets/bottom_bar.dart';
import 'package:amazzon/constants/global_variable.dart';
import 'package:amazzon/features/admin/screens/admin_screen.dart';
import 'package:amazzon/features/auth/screens/auth_screens.dart';
import 'package:amazzon/features/auth/services/auth_services.dart';
import 'package:amazzon/provider/provider.dart';
import 'package:amazzon/router.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(
      providers: [ChangeNotifierProvider(create: (context) => UserProvider())],
      child: const MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final AuthService authService = AuthService();

  @override
  void initState() {
    super.initState();
    authService.getUserData(context);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Amazzon',
        theme: ThemeData(
          colorScheme:
              ColorScheme.light(primary: GlobalVariables.secondaryColor),
          appBarTheme: AppBarTheme(
            elevation: 0,
            iconTheme: IconThemeData(color: Colors.black),
          ),
        ),
        onGenerateRoute: (settings) => generateRoute(settings),
        home: Provider.of<UserProvider>(context).user.token.isNotEmpty
            ? Provider.of<UserProvider>(context).user.type == 'user'
                ? const BottomBar()
                : const AdminScreen()
            : const AuthScreen());
  }
}
