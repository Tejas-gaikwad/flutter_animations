import 'package:flutter/material.dart';

class FirstPage extends StatelessWidget {
  const FirstPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Container(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: [
          const Align(
              alignment: Alignment.center,
              child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 30.0),
                  child: Text('ANALYSIS REPORT', style: TextStyle(fontSize: 30, color: Color(0XFF1c2c3b), fontWeight: FontWeight.w700),))),
          Row(
            children: [
              Container(
                height: 50,
                width: MediaQuery.of(context).size.width / 1.5,
                child: const Text(''),
              ),
              Expanded(
                child: Container(
                  alignment: Alignment.centerRight,
                  height: 50,
                  child: const Text('Page No', style: TextStyle(fontWeight: FontWeight.w700),),
                ),
              ),
            ],
          ),

          FirstPageSingleRowComponent(context: context, first_text: '1. Summary', second_text: '1'),
          FirstPageSingleRowComponent(context: context, first_text: '2. Average Glucose', second_text: '2'),
          FirstPageSingleRowComponent(context: context, first_text: '3. Time in Range Over Time', second_text: '3'),
          FirstPageSingleRowComponent(context: context, first_text: '4. Typical Day', second_text: '4'),
          FirstPageSingleRowComponent(context: context, first_text: '5. Average Diet Score', second_text: '5'),
          FirstPageSingleRowComponent(context: context, first_text: '6. Diet Catalog(Morning)', second_text: '6'),

        ],
      ),
    );
  }

  Widget FirstPageSingleRowComponent(
      {required BuildContext context, required String first_text, required String second_text}) {
    return      Row(
      children: [
        Container(
          height: 50,
          width: MediaQuery.of(context).size.width / 1.5,
          child: Text(first_text, style: TextStyle(fontWeight: FontWeight.w500, color: Color(0XFF1c2c3b)),),
        ),
        Expanded(
          child: Container(
            alignment: Alignment.centerRight,
            height: 50,
            child: Text(second_text, style: TextStyle( color: Color(0XFF608ab3)),),
          ),
        ),
      ],
    );
  }
}



