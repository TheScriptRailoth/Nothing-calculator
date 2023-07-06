import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';
import 'colors.dart';
void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home:Calculator()
    )
  );
}
class Calculator extends StatefulWidget {
  const Calculator({super.key});

  @override
  State<Calculator> createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {

  double firstNum=0.0;
  double secondNum=0.0;
  var input="  ";
  var output=" ";
  var operation = ' ';

  onButtonClick(value){

    if(value=="AC"){
      input="";
      output="";
    }
    else if(value=="<"){
        input= input.substring(0,input.length-1);
    }
    else if(value=="=")
      {
        var userInput=input;
        userInput= input.replaceAll("x", "*");
        Parser p= Parser();
        Expression expression=p.parse(userInput);
        ContextModel cm=ContextModel();
        var finalValue = expression.evaluate(type, context)
      }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundcolor,
      body: Column(
        children: [
          Expanded(child:
          Container(
            width: double.infinity,
            padding: EdgeInsets.all(12),
            color: numbackgroundcolor,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.end,
              children:[
                  Text(input, style: const TextStyle(
                    fontSize: 65,
                    color: blacknumkey,
                    fontFamily:'Nothing',
                  ),),
                SizedBox(
                  height: 30,
                ),
                Text(output, style: TextStyle(
                  fontSize: 48,
                  color: blacknumkey,
                  fontFamily:'Nothing',
                ),),
                SizedBox(
                  height: 40,
                ),
                ],
            ),
            ),
          ),
          Row(
            children: [
                button(text:"AC", tColor: whitenumkey, buttonBgColor: blacknumkey),
                button(text:"()", tColor: whitenumkey, buttonBgColor: blacknumkey),
                button(text:"%", tColor: whitenumkey, buttonBgColor: blacknumkey),
                button(text:" ", tColor: whitenumkey, buttonBgColor: blacknumkey),
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
         margin: const EdgeInsets.all(8),
         child: ElevatedButton(
           style: ElevatedButton.styleFrom(
             shape: const CircleBorder(

             ),
             padding: const EdgeInsets.all(22),
             primary: buttonBgColor,
           ),
           onPressed: ()=> onButtonClick(text),
           child:Text(text, style:TextStyle(
               fontSize: 30,
               fontWeight: FontWeight.bold,
               color: tColor,
               fontFamily: 'Nothing')),
         ),
       ),
     );
  }
}

