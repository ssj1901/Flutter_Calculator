import 'package:flutter/material.dart';
import 'package:calculator/algo/checkOperation.dart';
import 'package:math_expressions/math_expressions.dart';
class Home extends StatefulWidget {
  Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  
  final List<String> buttons = ['C','⌫','%','/',
  '7','8','9','x',
  '4','5','6','-',
  '1','2','3','+',
  ' ','0','.','='];
   String equation = "0";
  String result = "0";
  String expression = "";
  double equationFontSize = 38.0;
  double resultFontSize = 48.0;

  buttonPressed(String buttonText){
    setState(() {
      if(buttonText == "C"){
        equation = "0";
        result = "0";
        equationFontSize = 38.0;
        resultFontSize = 48.0;
      }

      else if(buttonText == "⌫"){
        equationFontSize = 48.0;
        resultFontSize = 38.0;
        equation = equation.substring(0, equation.length - 1);
        if(equation == ""){
          equation = "0";
        }
      }

      else if(buttonText == "="){
        equationFontSize = 38.0;
        resultFontSize = 48.0;

        expression = equation;
        expression = expression.replaceAll('x', '*');
        expression = expression.replaceAll('÷', '/');

        try{
          Parser p = Parser();
          Expression exp = p.parse(expression);

          ContextModel cm = ContextModel();
          result = '${exp.evaluate(EvaluationType.REAL, cm)}';
        }catch(e){
          result = "Error";
        }

      }

      else{
        equationFontSize = 52.0;
        resultFontSize = 45.0;
        if(equation == "0"){
          equation = buttonText;
        }else {
          equation = equation + buttonText;
        }
      }
    });
  }
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(0,26,51,1),
       //backgroundColor: Color.fromRGBO(102,204,255,1),
        body: Column(
          children: <Widget>[
            Expanded(child: Container(
              child: Column(
                children:<Widget>[
                  SizedBox(height: 60,),
            Container(
            alignment: Alignment.centerRight,
            padding: EdgeInsets.fromLTRB(10, 20, 10, 0),
            child: Text(equation, style: TextStyle(fontSize: equationFontSize,color: Colors.white),),
          ),


          Container(
            alignment: Alignment.centerRight,
            padding: EdgeInsets.fromLTRB(10, 30, 10, 0),
            child: Text(result, style: TextStyle(fontSize: resultFontSize,color: Colors.white),),
          ),

                ]
              ),
            )),
          
            Expanded(flex: 2,
            child: Container(
             // padding: EdgeInsets.all(8),
              
              color: Color.fromRGBO(0,26,51,1),
               //color: Color.fromRGBO(33,69,89,1),
              child:GridView.builder(itemCount: buttons.length,gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4,
              childAspectRatio: MediaQuery.of(context).size.width/(MediaQuery.of(context).size.height/2)),
               itemBuilder: (BuildContext context,int index){
                return GestureDetector(
        onTap: () {
          buttonPressed(buttons[index]);
        },
          child: Container(
        //height: 20,
        //width: 20,
        padding: const EdgeInsets.all(4.0),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Container(
            color: check_Operator(buttons[index])? Colors.cyanAccent[400]:Color.fromRGBO(0,51, 102,1),
            child: Center(child: Text(buttons[index],style: TextStyle(color:Colors.white,fontSize: 28),),),
          )
        ),
      ),
    ) ;
                
               }
               )),)
          ],
    
       
      ),
    );
  }
}