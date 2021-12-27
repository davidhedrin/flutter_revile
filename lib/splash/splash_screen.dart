import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_revile/screens/main_screen.dart';
import 'package:get_storage/get_storage.dart';

import 'on_board_screen.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  static const String id = 'splash-screen';

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final store = GetStorage();

  @override
  void initState() {
    Timer(
      const Duration(
        seconds: 3,
      ), (){
        bool? _boarding = store.read('onBoarding');
        _boarding == null ? Navigator.pushReplacementNamed(context, OnBoardScreen.id):
        _boarding == true ? Navigator.pushReplacementNamed(context, MainScreen.id):
        Navigator.pushReplacementNamed(context, OnBoardScreen.id);
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge, overlays: []);
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white12,
        body: Center(
          child: Image.asset('assets/images/logo.png', width: 80,),
        ),
      ),
    );
  }
}
