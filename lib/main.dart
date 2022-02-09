import 'package:firebase_core/firebase_core.dart';
import 'package:flikk/model/provider_model.dart';
import 'package:flikk/screens/home_screen.dart';
import 'package:flikk/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<MoviesProvider>(
      create: (context) => MoviesProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        themeMode: ThemeMode.system,
        theme: lightTheme,
        darkTheme: darkTheme,
        home: HomePage(),
      ),
    );
  }
}
