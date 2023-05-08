import 'dart:convert';
import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:amplify_datastore/amplify_datastore.dart';
import 'package:amplify_storage_s3/amplify_storage_s3.dart';
import 'package:flutter/material.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mysports/authentication/choise.dart';
import 'package:mysports/authentication/userdetails.dart';
import 'package:mysports/models/ModelProvider.dart';
import 'package:mysports/user/pages/home.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'amplifyconfiguration.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: GoogleFonts.lato().fontFamily,
        primaryColor: const Color.fromRGBO(80, 160, 96, 1),
        appBarTheme: const AppBarTheme(
          color: Color.fromRGBO(80, 160, 96, 1),
        ),
      ),
      home: const MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Future _configureAmplify() async {
    final datastorePlugin =
        AmplifyDataStore(modelProvider: ModelProvider.instance);
    final storage = AmplifyStorageS3();
    final auth = AmplifyAuthCognito();
    await Amplify.addPlugins([auth, storage, datastorePlugin]);
    try {
      await Amplify.configure(amplifyconfig);
    } on AmplifyAlreadyConfiguredException {
      safePrint(
          'Tried to reconfigure Amplify; this can occur when your app restarts on Android.');
    }
    _getdata();
  }

  Future _getdata() async {
    try {
      final result = await Amplify.Auth.fetchAuthSession();
      if (result.isSignedIn) {
        // ignore: use_build_context_synchronously
        SharedPreferences get = await SharedPreferences.getInstance();
        details.email = get.getString('email');
        details.name = get.getString('name');
        details.num = get.getString('num');
        details.type = get.getString('type');
        // ignore: use_build_context_synchronously
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
            builder: (BuildContext context) => const user_home(),
          ),
          (route) => false,
        );
      } else {
        // ignore: use_build_context_synchronously
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
            builder: (BuildContext context) => const choise(
              user: true,
            ),
          ),
          (route) => false,
        );
      }
    } catch (e) {
      print(e.toString());
    }
  }

  getdata() async {
    var json = await rootBundle.loadString('assets/sports/sports.json');
    details.sports_data = jsonDecode(json);
  }

  @override
  void initState() {
    _configureAmplify();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset(
          'assets/logos/transparent.png',
          width: 250,
        ),
      ),
    );
  }
}
