import 'package:flutter/material.dart';
import 'package:prjct223_d1_24/common/widgets/bottom_bar.dart';
import 'package:prjct223_d1_24/constants/universal_var.dart';
import 'package:prjct223_d1_24/features/admin/screens/admin_screens.dart';
import 'package:prjct223_d1_24/features/auth/auth_screen.dart';
import 'package:prjct223_d1_24/features/services/auth_service.dart';
// import 'package:prjct223_d1_24/home/screens/home_screens.dart';
import 'package:prjct223_d1_24/provider/user_provider.dart';
import 'package:prjct223_d1_24/routers.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(
      create: (context) => UserProvider(),
    ),
  ], child: const MyApp()));
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

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme:
            const ColorScheme.light(primary: UniversalVariable.secondaryColor),
        appBarTheme: const AppBarTheme(
            elevation: 0, iconTheme: IconThemeData(color: Colors.black)),
      ),
      onGenerateRoute: (settings) => generateRoutes(settings),
      home: Provider.of<UserProvider>(context).user.token.isNotEmpty
          ? Provider.of<UserProvider>(context).user.type == 'user'
              ? const BottomBar()
              : const AdminScreens()
          : const AuthScreen(),
    );
  }
}
