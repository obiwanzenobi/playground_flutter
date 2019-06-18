import 'package:flutter/material.dart';
//import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'package:provider/provider.dart';
//import 'package:webview_flutter/webview_flutter.dart';
import 'package:camera/camera.dart';
import 'package:firebase_ml_vision/firebase_ml_vision.dart';

import 'main.dart';
import 'providers/base_provider.dart';

// obsluga webview
// ladowanie z piku
// lapanie bledow
// klawiatura
//

class TestPage extends StatefulWidget {
  @override
  _TestPageState createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> {
//  final flutterWebviewPlugin = new FlutterWebviewPlugin();
  CameraController cameraController;

  String text = "nic";
  bool isAnalyzing = false;

  _TestPageState() {
//    flutterWebviewPlugin.onUrlChanged.listen((String url) {
//      var cookies = flutterWebviewPlugin.getCookies();
//      String text = url;
//      var changed = text.trim();
//    });
  }

  @override
  void initState() {
    super.initState();
//    initCamera();
    cameraController = CameraController(cameras[0], ResolutionPreset.medium);
    cameraController.initialize().then((_) {
      if (!mounted) {
        return;
      }
      setState(() {});
      cameraController.startImageStream((image) {
        if(!isAnalyzing){
          scanForText(image);
        }
      });
    });
  }

  Future scanForText(CameraImage image) async {
    isAnalyzing = true;
    final FirebaseVisionImageMetadata metadata = FirebaseVisionImageMetadata(
        rawFormat: image.format.raw,
        size: Size(image.width.toDouble(), image.height.toDouble()),
        planeData: image.planes
            .map((currentPlane) => FirebaseVisionImagePlaneMetadata(
                bytesPerRow: currentPlane.bytesPerRow, height: currentPlane.height, width: currentPlane.width))
            .toList(),
        rotation: ImageRotation.rotation90);
    final FirebaseVisionImage visionImage = FirebaseVisionImage.fromBytes(image.planes[0].bytes, metadata);
    final TextRecognizer textRecognizer = FirebaseVision.instance.textRecognizer();
    final VisionText visionText = await textRecognizer.processImage(visionImage);

    debugPrint(visionText.text);
    isAnalyzing = false;
    setState(() {
    text = visionText.text;

    });
  }

  void initCamera() async {
    List<CameraDescription> cameras = await availableCameras();

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(text),
        ),
        body: !cameraController.value.isInitialized
            ? Container()
            : AspectRatio(
                aspectRatio: cameraController.value.aspectRatio,
                child: CameraPreview(cameraController),
              )
//      Builder(
//        builder: (BuildContext context) {
//          return WebviewScaffold(
//
//            appCacheEnabled: true,
//            clearCookies: false,
//            clearCache: false,
//            url: "http://ekovm02.eko-okna.winpro.be/?p=constructor&lvl=2&id=MENU_01_01_ROLET",
//          );
//        },
//      ),
        );
  }
}
