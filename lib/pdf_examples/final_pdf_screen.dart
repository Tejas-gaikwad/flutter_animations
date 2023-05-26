import 'dart:typed_data';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:permission_handler/permission_handler.dart';

import 'pdf_example_2/widgets/average_glucose/average_glucose_screen.dart';
import 'pdf_example_2/widgets/diet_score_graph_widget.dart';
import 'pdf_example_2/widgets/pdfUI.dart';
import 'pdf_example_2/widgets/time_in_range_widget/time_in_range_widget.dart';
import 'pdf_example_2/widgets/typical_day/typical_day_graph_screen.dart';

class FinalPdfScren extends StatefulWidget {
  const FinalPdfScren({super.key});

  @override
  State<FinalPdfScren> createState() => _FinalPdfScrenState();
}

class _FinalPdfScrenState extends State<FinalPdfScren> {
  static GlobalKey previewContainer1 = new GlobalKey();
  static GlobalKey previewContainer2 = new GlobalKey();
  static GlobalKey previewContainer3 = new GlobalKey();

  Uint8List? screenshot1;
  Uint8List? screenshot2;
  Uint8List? screenshot3;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          child: SingleChildScrollView(
            child: Column(
              children: [
                InkWell(
                  onTap: () async {
                    screenshot1 = await takescrshot(previewContainer1);
                    screenshot2 = await takescrshot(previewContainer2);
                    screenshot3 = await takescrshot(previewContainer3);

                    Permission.storage;
                    final pdfFile = await DietScoreWithGraphWidget
                        .generateUIFileOfExternalPackage(
                      screenshot1: screenshot1!,
                      screenshot2: screenshot2!,
                      screenshot3: screenshot3!,
                    );
                    print('pdfFile  =>>  $pdfFile');
                    PdfUI.openFile(pdfFile);
                    setState(() {});
                  },
                  child: Container(
                    padding: EdgeInsets.all(20.0),
                    color: Colors.blue,
                    child: Text('Take Screenshot and make a pdf'),
                  ),
                ),
                // InkWell(
                //     onTap: () async {
                //       screenShotOutput = await takescrshot();
                //     },
                //     child: Container(
                //       padding: const EdgeInsets.all(20.0),
                //       color: Colors.amber,
                //       child:
                //           const Text('GENERATE EXTERNAL PACKAGE EXAMPLe PDF'),
                //     )),
                // screenshot1 != null ? Image.memory(screenshot1!) : SizedBox(),
                // screenshot2 != null ? Image.memory(screenshot2!) : SizedBox(),
                // screenshot3 != null ? Image.memory(screenshot3!) : SizedBox(),
                RepaintBoundary(
                  key: previewContainer1,
                  child: TypicalDayScreen(),
                ),
                RepaintBoundary(
                  key: previewContainer2,
                  child: AverageGlucoseScreen(),
                ),
                RepaintBoundary(
                  key: previewContainer3,
                  child: TimeInRangeGraph(),
                ),
              ],
            ),
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

    setState(() {});

    return pngBytes;
  }
}
