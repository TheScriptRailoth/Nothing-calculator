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
  var input="";
  var output=" ";
  var operation = ' ';
  var hideinput=false;
  var outputSize=48.0;
  onButtonClick(value){

    if(value=="AC"){
      input="";
      output="";
    }
    else if(value=="<"){
      if(input.isNotEmpty) {
        input= input.substring(0,input.length-1);
      }
    }
    else if(value=="=")
      {
        if(input.isNotEmpty) {
          var userInput = input;
          userInput = input.replaceAll("x", "*");
          Parser p = Parser();
          Expression expression = p.parse(userInput);
          ContextModel cm = ContextModel();
          var finalValue = expression.evaluate(EvaluationType.REAL, cm);
          output = finalValue.toString();
          if(output.endsWith(".0")) {
            output=output.substring(0,output.length-2);
          }
          input=output;
          hideinput=true;
          outputSize=65;
        }
      }
    else{
      input=input+value;
      hideinput=false;
      outputSize=48;
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:const Text("CALCULATOR", style: TextStyle(color: blacknumkey, fontFamily:'Jane', fontSize: 30, fontWeight: FontWeight.normal)),
        leading: IconButton(
          padding: const EdgeInsets.only(left:20),
          icon: Image.asset('assests/drawer_icon.png'),
          onPressed: (){},
        ),
        actions: [
          Row(
            children: [
              IconButton(onPressed: (){}, icon: Image.asset('assests/history_icon.png'), padding:const EdgeInsets.only(right:30),),
            ],
          ),
        ],
        centerTitle: true,
        backgroundColor: backgroundcolor,
        elevation: 0,
      ),
      backgroundColor: backgroundcolor,
      body: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(30),
            child: Card(
              elevation: 0,
              child: Container(
              width: 350,
              height: 260,
              padding: EdgeInsets.all(12),
              color: numbackgroundcolor,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.end,
                children:[
                  const SizedBox(
                    height: 60,
                  ),
                    Expanded(
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        reverse: true,
                        child: Text(
                          hideinput? ' ':input,
                          style: const TextStyle(
                          fontSize: 65,
                          color: blacknumkey,
                          fontFamily:'Nothing',
                         ),
                        ),
                      ),
                    ),
                  const SizedBox(
                    height: 30,
                  ),
                Expanded(
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    reverse: true,
                    child:Text(output,
                        style:const TextStyle(
                          fontSize: 48,
                          color: blacknumkey,
                          fontFamily:'Nothing',
                        ),
                      ),
                  ),
                ),
                  const SizedBox(
                    height: 5,
                  ),
                  ],
              ),
              ),
            ),
          ),
          Row(
            children: [
                button(text:"AC", tColor: whitenumkey, buttonBgColor: blacknumkey),
                button(text:"( )", tColor: whitenumkey, buttonBgColor: blacknumkey),
                button(text:"%", tColor: whitenumkey, buttonBgColor: blacknumkey),
                button(text:"/", tColor: whitenumkey, buttonBgColor: blacknumkey),
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

          Expanded(
            child: Container(
            margin: const EdgeInsets.all(8),
            child: ElevatedButton(
            style: ElevatedButton.styleFrom(
            shape: const CircleBorder(),
            padding: const EdgeInsets.all(22),
            primary: whitenumkey,
            ),
            onPressed: ()=> onButtonClick("<"),
            child: Image.asset('assests/clear_icon.png'),
            ),
          ),
        ),



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

