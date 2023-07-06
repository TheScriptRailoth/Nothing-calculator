import 'package:flutter/material.dart';

import 'colors.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home:Calculator()
  ));
}
class Calculator extends StatefulWidget {
  const Calculator({super.key});

  @override
  State<Calculator> createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundcolor,
      body: Column(
        children: [
          Expanded(child: Container(color: numbackgroundcolor,)),
          Row(
            children: [
                button(text:"AC", tColor: whitenumkey, buttonBgColor: blacknumkey),
                button(text:"()", tColor: whitenumkey, buttonBgColor: blacknumkey),
                button(text:"%", tColor: whitenumkey, buttonBgColor: blacknumkey),
                button(text:"", tColor: whitenumkey, buttonBgColor: blacknumkey),
            ],
          ),
          Row(
            children: [
              button(text:"7", tColor: blacknumkey, buttonBgColor: whitenumkey),
              button(text:"8", tColor: blacknumkey, buttonBgColor: whitenumkey),
              button(text:"9", tColor: blacknumkey, buttonBgColor: whitenumkey),
              button(text:"x", tColor: whitenumkey, buttonBgColor: blacknumkey),
            ],
          ),
          Row(
            children: [
              button(text:"6", tColor: blacknumkey, buttonBgColor: whitenumkey),
              button(text:"5", tColor: blacknumkey, buttonBgColor: whitenumkey),
              button(text:"4", tColor: blacknumkey, buttonBgColor: whitenumkey),
              button(text:"-", tColor: whitenumkey, buttonBgColor: blacknumkey),
            ],
          ),
          Row(
            children: [
              button(text:"3", tColor: blacknumkey, buttonBgColor: whitenumkey),
              button(text:"2", tColor: blacknumkey, buttonBgColor: whitenumkey),
              button(text:"1", tColor: blacknumkey, buttonBgColor: whitenumkey),
              button(text:"+", tColor: whitenumkey, buttonBgColor: blacknumkey),
            ],
          ),
          Row(
            children: [
              button(text:"0", tColor: blacknumkey, buttonBgColor: whitenumkey),
              button(text:".", tColor: blacknumkey, buttonBgColor: whitenumkey),
              button(text:" ", tColor: blacknumkey, buttonBgColor: whitenumkey),
              button(text:"=", tColor: whitenumkey, buttonBgColor: rednumkey),
            ],
          ),
        ],
      ),
    );
  }

  Widget button({
      text, tColor, buttonBgColor}
      ){
     return Expanded(
       child: Container(
         margin: EdgeInsets.all(8),
         child: ElevatedButton(
           style: ElevatedButton.styleFrom(
             shape: CircleBorder(

             ),
             padding: EdgeInsets.all(22),
             primary: buttonBgColor,
           ),
           onPressed: (){},
           child:Text(text, style:TextStyle(
               fontSize: 25,
               fontWeight: FontWeight.bold,
               color: tColor)),
         ),
       ),
     );
  }
}

