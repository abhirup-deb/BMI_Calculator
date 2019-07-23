import 'package:flutter/material.dart';

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: new Center(child: Text('BMI CALCULATOR'),),
        
      ),
      body: Column(
        children: <Widget>[
          Row(
              children: <Widget>[
                Expanded(
                  child:  ReusableCard(clr: Color(0xFF1D1E33),),
                ),
                Expanded(
                  child: ReusableCard(clr: Color(0xFF1D1E33),),
                ),
              ],
            ),
          Expanded(
            child:ReusableCard(clr: Color(0xFF1D1E33),),
          ),
          Row(
            children: <Widget>[
              Expanded(
                child: ReusableCard(clr: Color(0xFF1D1E33),),
              ),
              Expanded(
                child: ReusableCard(clr: Color(0xFF1D1E33),),
              ),
            ],
          ),

        ],
      ),
    );
  }
}

class ReusableCard extends StatelessWidget {
  ReusableCard({@required this.clr});
  Color clr;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 140.0,
      margin: EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        color: clr,
        borderRadius: BorderRadius.circular(10.0),
      ),
    );
  }
}