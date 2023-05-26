import 'dart:io';
import 'dart:typed_data';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart';

const PdfColor primaryColor = PdfColor.fromInt(0XFF1c2c3b);
const PdfColor secondColor = PdfColor.fromInt(0XFF5d89b1);

class PdfUI {
  static Future<File> generateUIFile(Uint8List screenshot) async {
    final pdf = Document();

    pdf.addPage(
      index: 0,
      MultiPage(
        build: (context) => [
          Partition(
            width: 300.0,
            child: Container(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Align(
                      alignment: Alignment.center,
                      child: Padding(
                          padding: EdgeInsets.symmetric(vertical: 30.0),
                          child: Text('ANALYSIS REPORT',
                              style: TextStyle(
                                  fontSize: 30,
                                  color: primaryColor,
                                  fontWeight: FontWeight.bold)))),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        height: 50,
                        width: 300,
                        child: Text(''),
                      ),
                      Expanded(
                        child: Container(
                          alignment: Alignment.centerRight,
                          height: 50,
                          child: Text(
                            'Page No',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ],
                  ),
                  firstPageSingleRowComponent(
                      first_text: '1. Summary', second_text: '1'),
                  firstPageSingleRowComponent(
                      first_text: '2. Average Glucose', second_text: '2'),
                  firstPageSingleRowComponent(
                      first_text: '3. Time in Range Over Time',
                      second_text: '3'),
                  firstPageSingleRowComponent(
                      first_text: '4. Typical Day', second_text: '4'),
                  firstPageSingleRowComponent(
                      first_text: '5. Average Diet Score', second_text: '5'),
                  firstPageSingleRowComponent(
                      first_text: '6. Diet Catalog(Morning)', second_text: '7'),
                  firstPageSingleRowComponent(
                      first_text: '7. Diet Catalog(Afternoon)',
                      second_text: '8'),
                  firstPageSingleRowComponent(
                      first_text: '8. Diet Catalog(Evenning)',
                      second_text: '9'),
                  firstPageSingleRowComponent(
                      first_text: '9. Day Specific Analysis',
                      second_text: '10'),
                ],
              ),
            ),
          ),
        ],
      ),
    );

    pdf.addPage(
      index: 1,
      MultiPage(
        build: (context) => [
          Container(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                        padding: EdgeInsets.symmetric(vertical: 30.0),
                        child: Text('Summary',
                            style: TextStyle(
                                fontSize: 30,
                                color: primaryColor,
                                fontWeight: FontWeight.bold)))),
                SizedBox(height: 20),
                circularElement(),
                Align(
                    alignment: Alignment.centerLeft,
                    child: Text('Time of Day(Average Meal Score)',
                        style: TextStyle(
                            fontSize: 20,
                            color: primaryColor,
                            fontWeight: FontWeight.bold))),
                SizedBox(height: 20),
                Container(
                    child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                      timeOfDayWidget(
                          headline: 'Morning',
                          time: '(6-10 AM)',
                          color: PdfColor.fromInt(0XFF3d9e72)),
                      timeOfDayWidget(
                          headline: 'Afternoon',
                          time: '(10-4 PM)',
                          color: PdfColor.fromInt(0XFFff4e4e)),
                      timeOfDayWidget(
                          headline: 'Evening',
                          time: '(4+ AM)',
                          color: PdfColor.fromInt(0XFFffc857)),
                    ])),
                SizedBox(height: 40),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      mealsState(
                          color: const PdfColor.fromInt(0XFF3d9e72),
                          headLine: 'Best Meals'),
                      mealsState(
                          headLine: 'Worst Meals',
                          color: const PdfColor.fromInt(0XFFff4e4e))
                    ])
              ],
            ),
          ),
        ],
      ),
    );

    pdf.addPage(
      index: 2,
      MultiPage(
        build: (context) => [
          Container(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 20.0),
                        child: Text('Average Glucose',
                            style: TextStyle(
                                fontSize: 30,
                                color: primaryColor,
                                fontWeight: FontWeight.bold)))),
                SizedBox(height: 20),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      graphRowWidget(
                          text: 'Higher Than Range',
                          color: const PdfColor.fromInt(0XFFff4e4e)),
                      graphRowWidget(
                          text: 'Optium Range',
                          color: const PdfColor.fromInt(0XFF3d9e72)),
                      graphRowWidget(
                          text: 'Lower Than Range',
                          color: const PdfColor.fromInt(0XFF0c69a2))
                    ]),
                SizedBox(height: 20),
                paragraphWidget(
                    headLine: 'Meaning:',
                    paragraph:
                        'Average glucose is the representation of overall glucose in your body on a specific day. The above analytics showcases how well you have been doing overall during the time of the service cycle. It is a great way to look if you have improved your glucose control over a period of time.'),
                SizedBox(height: 20),
                paragraphWidget(
                    headLine: 'Ideally:',
                    paragraph:
                        'Average glucose is the representation of overall glucose in your body on a specific day. The above analytics showcases how well you have been doing overall during the time of the service cycle. It is a great way to look if you have improved your glucose control over a period of time.'),
              ],
            ),
          ),
        ],
      ),
    );

    pdf.addPage(
      index: 3,
      MultiPage(
        build: (context) => [
          Container(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 20.0),
                        child: Text('Time in Range Over Time',
                            style: TextStyle(
                                fontSize: 30,
                                color: primaryColor,
                                fontWeight: FontWeight.bold)))),
                SizedBox(height: 400, width: 300),
                paragraphWidget(
                    headLine: 'Meaning:',
                    paragraph:
                        'Time in Range tells you how much percentage of your time in a day is spent in the controlled glucose range (i.e., 70 - 140 mg/dL). Staying in range reduces the detrimental effects of high and low glucose levels in your body'),
                SizedBox(height: 20),
                paragraphWidget(
                    headLine: 'Ideally:',
                    paragraph:
                        'You should always aim for a higher time in range value. Having time in range above 80% is great and lower than 30% might be an issue. The most essential part is to always aim for a higher value than the previous.'),
              ],
            ),
          ),
        ],
      ),
    );

    pdf.addPage(
      index: 4,
      MultiPage(
        build: (context) => [
          Container(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 20.0),
                        child: Text('Typical Day',
                            style: TextStyle(
                                fontSize: 30,
                                color: primaryColor,
                                fontWeight: FontWeight.bold)))),
                SizedBox(height: 200, width: 300),
                paragraphWidget(
                    headLine: 'Meaning:',
                    paragraph:
                        'Typical day provides you with an overview of how your glucose has been varying over a 24-hour time window for all the day. It enables you to understand at what time of your day generally your glucose levels are well managed and at what time there are a lot of  fluctuations in the glucose level. It is a great way to assess the daily routine of the individual and make necessary improvements at a specific time to improve glucosemanagement at that moment of the day.'),
                SizedBox(height: 20),
                paragraphWidget(
                    headLine: 'Ideally:',
                    paragraph:
                        'Ideally the optimum value for blood glucose is between 70 - 140 mg/dL. Glucose level above 140 mg/dL is considered a higher level and may lead to diabetes-related issues, especially after 180 mg/dL. Glucose levels below 70 mg/dL are also generally not preferable as having very low glucose, especially below 50 mg/dL might lead to energy shortage in the body, unconsciousness, and more.')
              ],
            ),
          ),
        ],
      ),
    );

    pdf.addPage(
      index: 5,
      MultiPage(
        build: (context) => [
          Container(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 20.0),
                        child: Text('Average Diet Score',
                            style: TextStyle(
                                fontSize: 30,
                                color: primaryColor,
                                fontWeight: FontWeight.bold)))),
                SizedBox(height: 40),
                paragraphWidget(
                    headLine: 'Meaning',
                    paragraph:
                        'Average diet score showcases the overall diet score of all the diets taken at a specified date. It is a possible indicator of which day has more bad diets consumed and which day contains mostly or almost all good diets. Here, diets are classified as good and bad diets based on the impact these diets generate on your metabolism. A good diet seems to impact very less on your metabolism whereas bad diets impact your metabolism more. With the help of this analysis, you will be able to pick out the dates where your eating habits are good for your metabolism as compared to dates where your eating habits are bad.'),
                SizedBox(height: 40),
                Row(children: [
                  paragraphWidget(
                      headLine: 'Good/Ideal Score:',
                      paragraph:
                          'Ideal score here is having a score between 7 - 10. Getting a score in range implies you are able to keep your glucose check very well by eating only the diets that are personally right for you.'),
                  SizedBox(width: 20),
                  circularNumberWidget(const PdfColor.fromInt(0XFF3d9e72)),
                ]),
                SizedBox(height: 20),
                Row(children: [
                  paragraphWidget(
                      headLine: 'Fine Score:',
                      paragraph:
                          'Fine score here is having a score between 4 - 7. Getting a score in this range implies you have one or more diets that are not working that great for you but you still doing just fine.'),
                  SizedBox(width: 20),
                  circularNumberWidget(const PdfColor.fromInt(0XFFffc857)),
                ]),
                SizedBox(height: 20),
                Row(children: [
                  paragraphWidget(
                      headLine: 'Bad/Concerning Score:',
                      paragraph:
                          'Bad Score here is having a score below 4. Getting this score implies that at that day many diets were not that great in respect to metabolism. And can impact the metabolism in a bad way'),
                  SizedBox(width: 20),
                  circularNumberWidget(const PdfColor.fromInt(0XFFff4e4e)),
                ])
              ],
            ),
          ),
        ],
      ),
    );

    pdf.addPage(
      index: 6,
      MultiPage(
        build: (context) => [
          Container(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 20.0),
                        child: Text('Average Diet Score',
                            style: TextStyle(
                                fontSize: 30,
                                color: primaryColor,
                                fontWeight: FontWeight.bold)))),
                SizedBox(height: 40),
              ],
            ),
          ),
        ],
      ),
    );

    pdf.addPage(
      index: 7,
      MultiPage(
        build: (context) => [
          Container(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 20.0),
                        child: Text('Diet Catalog- Morning',
                            style: TextStyle(
                                fontSize: 30,
                                color: primaryColor,
                                fontWeight: FontWeight.bold)))),
                SizedBox(height: 40),
                SizedBox(height: 300, width: 400),
                paragraphWidget(
                    headLine: 'Meaning',
                    paragraph:
                        'It showcases the impact of diets that you have consumed in the Afternoon time over your glucose levels. It is better to have diets that do not spike your glucose levels a lot and are nutritious as well.'),
                paragraphWidget(
                    headLine: 'Ideally',
                    paragraph:
                        'Looking from the perspective of diet score, which is a score developed internally at DietOsure. You should aim for a higher diet score. A diet having a score of 10 implies that the diet has contributed very less to glucose elevation and having a diet score of 0 implies that the diet is having a negative impact on metabolism and higher elevation of glucose.'),
              ],
            ),
          ),
        ],
      ),
    );

    pdf.addPage(
      index: 8,
      MultiPage(
        build: (context) => [
          Container(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 20.0),
                        child: Text('Diet Catalog- Afternoon',
                            style: TextStyle(
                                fontSize: 30,
                                color: primaryColor,
                                fontWeight: FontWeight.bold)))),
                SizedBox(height: 40),
                SizedBox(height: 300, width: 400),
                paragraphWidget(
                    headLine: 'Meaning',
                    paragraph:
                        'It showcases the impact of diets that you have consumed in the Afternoon time over your glucose levels. It is better to have diets that do not spike your glucose levels a lot and are nutritious as well.'),
                paragraphWidget(
                    headLine: 'Ideally',
                    paragraph:
                        'Looking from the perspective of diet score, which is a score developed internally at DietOsure. You should aim for a higher diet score. A diet having a score of 10 implies that the diet has contributed very less to glucose elevation and having a diet score of 0 implies that the diet is having a negative impact on metabolism and higher elevation of glucose.'),
              ],
            ),
          ),
        ],
      ),
    );

    pdf.addPage(
      index: 9,
      MultiPage(
        build: (context) => [
          Container(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 20.0),
                        child: Text('Diet Catalog- Evening',
                            style: TextStyle(
                                fontSize: 30,
                                color: primaryColor,
                                fontWeight: FontWeight.bold)))),
                SizedBox(height: 40),
                SizedBox(height: 300, width: 400),
                paragraphWidget(
                    headLine: 'Meaning',
                    paragraph:
                        'It showcases the impact of diets that you have consumed in the Afternoon time over your glucose levels. It is better to have diets that do not spike your glucose levels a lot and are nutritious as well.'),
                paragraphWidget(
                    headLine: 'Ideally',
                    paragraph:
                        'Looking from the perspective of diet score, which is a score developed internally at DietOsure. You should aim for a higher diet score. A diet having a score of 10 implies that the diet has contributed very less to glucose elevation and having a diet score of 0 implies that the diet is having a negative impact on metabolism and higher elevation of glucose.'),
              ],
            ),
          ),
        ],
      ),
    );

    pdf.addPage(
      index: 10,
      MultiPage(
        build: (context) => [
          Container(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 20.0),
                        child: Text('Per Day Analysis(29/05/22)',
                            style: TextStyle(
                                fontSize: 30,
                                color: primaryColor,
                                fontWeight: FontWeight.bold)))),
                SizedBox(height: 40),
                SizedBox(
                  height: 400,
                  width: 400,
                  child: Image(MemoryImage(screenshot)),
                ),
                paragraphWidget(
                    headLine: 'Meaning',
                    paragraph:
                        'It showcases the impact of diets that you have consumed in the Afternoon time over your glucose levels. It is better to have diets that do not spike your glucose levels a lot and are nutritious as well.'),
              ],
            ),
          ),
        ],
      ),
    );

    return saveDocument(name: 'example_pdf', pdf: pdf);
  }

  static Widget paragraphWidget(
      {required String headLine, required String paragraph}) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text(headLine,
          style: TextStyle(
              color: const PdfColor.fromInt(0XFF4c8db5),
              fontSize: 25,
              fontWeight: FontWeight.bold)),
      Container(
        width: 400,
        child: Text(paragraph,
            style: const TextStyle(color: primaryColor, fontSize: 12)),
      )
    ]);
  }

  static Widget graphRowWidget(
      {required String text, required PdfColor? color}) {
    return Row(children: [
      Container(
          padding: const EdgeInsets.all(10.0),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: color,
          )),
      SizedBox(width: 10),
      Text(text,
          style: const TextStyle(
            fontSize: 12,
            color: primaryColor,
          ))
    ]);
  }

  static Widget mealsState(
      {required String headLine, required PdfColor color}) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text(headLine,
          style: TextStyle(
              fontSize: 20, color: primaryColor, fontWeight: FontWeight.bold)),
      SizedBox(height: 20),
      Column(children: [
        singleMealStateWidget(
          index: 1,
          headline: 'Onion Salad, Paratha, Chhach',
          color: color,
        ),
        SizedBox(height: 15),
        singleMealStateWidget(
          index: 2,
          headline: 'Onion Salad, Paratha, Chhach',
          color: color,
        ),
        SizedBox(height: 15),
        singleMealStateWidget(
          index: 3,
          headline: 'Onion Salad, Paratha, Chhach',
          color: color,
        ),
      ])
    ]);
  }

  static Widget circularNumberWidget(
    PdfColor color,
  ) {
    return Container(
        padding: const EdgeInsets.all(10.0),
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: color, width: 5.0)),
        child: Text('10',
            style: TextStyle(
                fontSize: 18, color: color, fontWeight: FontWeight.bold)));
  }

  static Widget singleMealStateWidget(
      {required int index, required String headline, required PdfColor color}) {
    return Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text('$index  .'),
          timeOfDayWidget2(headline: headline, time: '', color: color),
        ]);
  }

  static Widget timeOfDayWidget(
      {required String headline,
      required String time,
      required PdfColor color}) {
    return Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
              padding: const EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: color, width: 5.0)),
              child: Text('10',
                  style: TextStyle(
                      fontSize: 18,
                      color: color,
                      fontWeight: FontWeight.bold))),
          SizedBox(width: 20),
          Container(
              width: 100,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(headline,
                        maxLines: 2,
                        style: TextStyle(
                            fontSize: 16,
                            color: primaryColor,
                            fontWeight: FontWeight.bold)),
                    Text(time,
                        style: TextStyle(
                            fontSize: 16,
                            color: primaryColor,
                            fontWeight: FontWeight.normal))
                  ]))
        ]);
  }

  static Widget timeOfDayWidget2(
      {required String headline,
      required String time,
      required PdfColor color}) {
    return Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
              padding: const EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: color, width: 5.0)),
              child: Text('10',
                  style: TextStyle(
                      fontSize: 18,
                      color: color,
                      fontWeight: FontWeight.bold))),
          SizedBox(width: 20),
          Container(
            width: 100,
            child: Text(headline,
                maxLines: 2,
                style: TextStyle(
                    fontSize: 16,
                    color: primaryColor,
                    fontWeight: FontWeight.bold)),
          )
        ]);
  }

  static Widget circularElement() {
    return Container(
        height: 200,
        width: 500,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            circularComponent(
                number: 99,
                subHeadLine: 'Total Activities',
                color: PdfColor.fromInt(0XFF1c2c3b)),
            circularComponent(
                number: 43,
                subHeadLine: 'Good Score Activities',
                color: PdfColor.fromInt(0XFF3d9e72)),
            circularComponent(
                number: 56,
                subHeadLine: 'Bad Score Activities',
                color: PdfColor.fromInt(0XFFff4e4e)),
          ],
        ));
  }

  static Widget circularComponent(
      {required int number,
      required String subHeadLine,
      required PdfColor? color}) {
    return Column(
      children: [
        Container(
          alignment: Alignment.center,
          width: 100,
          height: 100,
          decoration: BoxDecoration(shape: BoxShape.circle, color: color),
          child: Text(number.toString(),
              style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: const PdfColor.fromInt(0XFFffffff))),
        ),
        SizedBox(height: 20),
        Container(
          width: 100,
          child: Text(subHeadLine,
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.normal,
                  color: primaryColor)),
        )
      ],
    );
  }

  static Widget firstPageSingleRowComponent(
      {required String first_text, required String second_text}) {
    return Row(
      children: [
        Container(
          alignment: Alignment.centerLeft,
          height: 50,
          width: 300,
          child: Text(
            first_text,
            style: TextStyle(
                fontWeight: FontWeight.bold, color: primaryColor, fontSize: 20),
          ),
        ),
        Expanded(
          child: Container(
            alignment: Alignment.centerRight,
            height: 50,
            child: Text(
              second_text,
              style: const TextStyle(fontSize: 20, color: secondColor),
            ),
          ),
        ),
      ],
    );
  }

  static Future<File> saveDocument(
      {required String name, required Document pdf}) async {
    final bytes = await pdf.save();
    final appDocDir = await getApplicationDocumentsDirectory();
    final appDocPath = appDocDir.path;
    final file = File('$appDocPath/document.pdf');
    print('Save as file ${file.path} ...');
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
