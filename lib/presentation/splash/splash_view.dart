import 'dart:async';

import 'package:flutter/material.dart';
import 'package:task/presentation/resources/assets_manager.dart';

import '../resources/color_manager.dart';
import '../resources/constants_manager.dart';
import '../resources/routes_manager.dart';

class SplashView extends StatefulWidget {
  SplashView({Key? key}) : super(key: key);

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  Timer? _timer;
  
  _startDelay() {
    _timer = Timer( const Duration(seconds: AppConstants.splashDelay), _goNext);
  }

  _goNext() async {

    Navigator.pushReplacementNamed(context, Routes.mainRoute,);

   
  }

  @override
  void initState() {
    _startDelay();
    super.initState();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.primary,
      // body: const Center(
      //   child: Image(image: AssetImage(ImagesAssets.splashLogo)),
      // ),
    );
  }
}
