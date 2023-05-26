import 'dart:typed_data';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:permission_handler/permission_handler.dart';
import 'widgets/diet_catalog.dart';
import 'widgets/pdfUI.dart';
import 'widgets/per_day_analysis/per_day_analaysis_screen.dart';

class PDFExample2 extends StatefulWidget {
  const PDFExample2({super.key});

  @override
  State<PDFExample2> createState() => _PDFExample2State();
}

class _PDFExample2State extends State<PDFExample2> {
  var screenShotOutput;

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              PerDayAnalysis(),
              DietCatalogWidget(),

              // InkWell(
              //   onTap: () async {
              //     Permission.storage;
              //     final pdfFile = await PdfUI.generateUIFile(screenShotOutput);
              //     // print('pdfFile  =>>  $pdfFile');
              //     PdfUI.openFile(pdfFile);
              //   },
              //   child: Container(
              //     padding: const EdgeInsets.all(20.0),
              //     color: Colors.purple,
              //     child: const Text('GENERATE'),
              //   ),
              // ),
              // const SizedBox(height: 30),

              // SizedBox(height: 20),
              // screenShotOutput == null
              //     ? SizedBox()
              //     : Container(
              //         padding: const EdgeInsets.all(20.0),
              //         color: Colors.amber,
              //         child: Image.memory(Uint8List.fromList(screenShotOutput)),
              //       ),
              // SizedBox(height: 20),
              // InkWell(
              //     onTap: () async {
              //       screenShotOutput = await takescrshot();

              //       Permission.storage;
              //       final pdfFile = await DietScoreWithGraphWidget
              //           .generateUIFileOfExternalPackage(screenShotOutput!);
              //       print('pdfFile  =>>  $pdfFile');
              //       PdfUI.openFile(pdfFile);
              //       setState(() {});
              //     },
              //     child: Container(
              //       padding: const EdgeInsets.all(20.0),
              //       color: Colors.amber,
              //       child: const Text('GENERATE EXTERNAL PACKAGE EXAMPLe PDF'),
              //     )),
            ],
          ),
        ),
      ),
    );
  }

  Future<Uint8List?> takescrshot(
      GlobalKey<State<StatefulWidget>> keyName) async {
    RenderRepaintBoundary boundary =
        keyName.currentContext?.findRenderObject() as RenderRepaintBoundary;

    var image = await boundary.toImage();
    var byteData = await image.toByteData(format: ImageByteFormat.png);
    var pngBytes = byteData?.buffer.asUint8List();

    print(pngBytes);

    return pngBytes;
  }
}
