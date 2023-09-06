import 'package:firebase_core/firebase_core.dart';
import 'package:luvit/constnts/text_constants.dart';
import 'package:luvit/firebase_options.dart';
import 'package:luvit/widgets/app_bar_widget.dart';
import 'package:luvit/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:luvit/widgets/nav_bar_widget.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: TextConst.appName,
      home: Scaffold(
        appBar: AppBarWidget.appBarLuvit(),
        backgroundColor: Colors.black,
        body: const HomeScreen(),
        bottomNavigationBar: NavBarWidget(),
      ),
    );
  }
}
