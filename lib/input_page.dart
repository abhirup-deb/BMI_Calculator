import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

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
                  child:  ReusableCard(clr: Color(0xFF1D1E33),
                  cardChild:  IconContent(gender: 'MALE',sign: FontAwesomeIcons.mars,),
                  ),
                ),
                Expanded(
                  child: ReusableCard(clr: Color(0xFF1D1E33),cardChild: IconContent(gender: 'FEMALE',sign: FontAwesomeIcons.venus),),
                ),
              ],
            ),
          Expanded(
            child:ReusableCard(clr: Color(0xFF1D1E33),),
          ),
          Row(
            children: <Widget>[
              Expanded(
                child: ReusableCard(clr: Color(0xFF1D1E33),
                ),
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

class IconContent extends StatelessWidget {
 IconContent({@required this.gender,@required this.sign});
 final String gender;
 final IconData sign;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(
           sign,
          size: 60.0,
          color: Colors.white,
        ),
        SizedBox(
          height: 6.0,
        ),
        Text(gender,
        style: TextStyle(
          color: Color(0xFF70FFC0),
          height: 1.0,
        )),
      ],
    );
  }
}

class ReusableCard extends StatelessWidget {
  ReusableCard({@required this.clr, this.cardChild});
  final Color clr;
  final Widget cardChild;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: cardChild,
      height: 140.0,
      margin: EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        color: clr,
        borderRadius: BorderRadius.circular(10.0),
      ),
    );
  }
}