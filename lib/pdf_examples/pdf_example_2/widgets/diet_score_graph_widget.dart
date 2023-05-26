import 'dart:io';
import 'dart:typed_data';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/widgets.dart' as pw;

class DietScoreWithGraphWidget {
  static Future<File> generateUIFileOfExternalPackage({
    required Uint8List screenshot1,
    required Uint8List screenshot2,
    required Uint8List screenshot3,
  }) async {
    final pdf = pw.Document();

    pdf.addPage(
      index: 0,
      pw.MultiPage(
        build: (context) => [
          pw.Partition(
            width: 800.0,
            child: pw.Container(
              padding: pw.EdgeInsets.all(10.0),
              child: pw.Column(
                crossAxisAlignment: pw.CrossAxisAlignment.start,
                children: [
                  pw.Text('TEXT ', style: const pw.TextStyle(fontSize: 30)),
                  pw.Image(pw.MemoryImage(screenshot1)),
                  pw.Image(pw.MemoryImage(screenshot2)),
                  pw.Image(pw.MemoryImage(screenshot3)),
                ],
              ),
            ),
          ),
        ],
      ),
    );

    return saveDocument(name: 'example_pdf', pdf: pdf);
  }

  static Future<File> saveDocument(
      {required String name, required pw.Document pdf}) async {
    final bytes = await pdf.save();
    final appDocDir = await getApplicationDocumentsDirectory();
    final appDocPath = appDocDir.path;
    final file = File('$appDocPath/document.pdf');

    await file.writeAsBytes(bytes);
    await OpenFile.open(file.path);
    return file;
  }

  static Future openFile(File file) async {
    final url = file.path;
    print('url  =>>  ' + url);
    await OpenFile.open(url);
  }
}
