import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_test/features/assigned_tab.dart';
import 'package:provider_test/features/login.dart';
import 'package:provider_test/features/provider/assignment_provider.dart';
import 'package:provider_test/features/provider/home_provider.dart';
import 'package:provider_test/features/provider/login_provider.dart';
import 'package:provider_test/features/provider/signup_provider.dart';
import 'package:provider_test/features/test/pages/test_pages_provider.dart';
import 'package:provider_test/firebase_options.dart';
import 'package:provider_test/homepage.dart';


void main() 
  async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context)=>TestProvider()),
        ChangeNotifierProvider(create: (context)=>HomeProvider()),
        ChangeNotifierProvider(create: (context)=>LoginProvider()),
        ChangeNotifierProvider(create: (context)=>SignupProvider()),
        ChangeNotifierProvider(create: (context)=>AssignmentProvider()),
        //or any other provider u wnnt to call
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        ),
        home: Login1(),
      ),
    );
  }
}

