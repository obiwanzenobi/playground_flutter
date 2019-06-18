import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_playground/test_page.dart';
import 'package:provider/provider.dart';

import 'onboarding_page.dart';
import 'providers/base_provider.dart';

List<CameraDescription> cameras;

Future<void> main() async {
  cameras = await availableCameras();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ChangeNotifierProvider(
        child: OnboardingPage(),
        builder: (BuildContext context) => AppState(),
      ),
    );
  }
}
