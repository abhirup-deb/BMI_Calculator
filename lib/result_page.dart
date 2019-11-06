import 'package:flutter/material.dart';
import 'input_page.dart';


class Resultpage extends StatelessWidget {
  Resultpage({@required this.bmiresult,@required this.resultText,@required this.interpretation});

  final String bmiresult;
  final String resultText;
  final String interpretation;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: new Center(child: Text('BMI CALCULATOR'),),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: Text('Your Result',style: TextStyle(
              fontSize: 38.0,
              fontWeight: FontWeight.w700,
            ),),
          ),
          Expanded(
            flex: 5,
            child: ReusableCard(clr: Color(0xFF1D1E33),
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Center(
                      child:  Text(resultText,style: TextStyle(color: Colors.white,fontSize: 18.0),),
                    ),
                    Center(child: Text(bmiresult,style: TextStyle(color: Colors.white,fontWeight: FontWeight.w900,fontSize: 85.0),)),
                    Center(child: Text(interpretation)),
                  ],
                )
            ),
          ),

          GestureDetector(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => InputPage()),);
            },
            child: Container(
              color: Color(0xFFEB1555),
              margin: EdgeInsets.only(top: 1.0),
              width: double.infinity,
              height: 60.0,
              child: Center(child: Text('RE-CALCULATE',style: TextStyle(fontSize: 28.0),),),
            ),
          ),
        ],
      ),
    );
  }
}
