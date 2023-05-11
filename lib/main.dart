import 'package:flutter/material.dart';
import 'package:tkfoodadmin/config/config.dart';
import 'firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'screens/screens.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
   await Firebase.initializeApp(
   options: DefaultFirebaseOptions.currentPlatform,
 );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TKFood Admin',
      debugShowCheckedModeBanner: false,
      theme: theme(),
      initialRoute: MenuScreen.routeName,
      routes: {
        MenuScreen.routeName: (context) => const MenuScreen(),
        // '/dash': (context) => const DashboardScreen(),
        // '/opening-hours': (context) => const OpeningHoursScreen(),
      },
    );
  }
}
