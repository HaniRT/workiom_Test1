import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:workiom_test1/Api_Service/api.dart';
import 'package:workiom_test1/screens/sign_up_screen1.dart';

Future<void> main() async {
  final response = await Api().get2(
      uri:
          'http://api.workiom.site/api/services/app/Session/GetCurrentLoginInformations');
  bool checkIfThereIsTenant =
      response['result']['tenant'] == null ? true : false;
  //print('tenant ==== $response');
  runApp(MyApp(
    checkTenant: checkIfThereIsTenant,
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key, required this.checkTenant});

  final bool checkTenant;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
            textTheme: GoogleFonts.rubikTextTheme(Theme.of(context).textTheme)),
        home: checkTenant ? const SignUpPage() : const Scaffold(),
        debugShowCheckedModeBanner: false);
  }
}
