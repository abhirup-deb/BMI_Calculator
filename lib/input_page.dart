import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {

  Color colour = Color(0xFF111328);
  Color fclr = Color(0xFF111328);
  Color mclr = Color(0xFF111328);
  Color active = Color(0xFF1D1E33);
  Color inactive = Color(0xFF111328);

  void Gesture(int gdr){
    if(gdr==1) {
      fclr=inactive;
      if (mclr == inactive)
        mclr = active;
      else
        mclr = inactive;
    }
    if(gdr==2) {
      mclr=inactive;
      if (fclr == inactive)
        fclr = active;
      else
        fclr = inactive;
    }
  }

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
                  child: GestureDetector(
                    onTap: (){
                      setState(() {
                        Gesture(1);
                      });
                    },
                    child: ReusableCard(clr: mclr,
                    cardChild:  IconContent(gender: 'MALE',sign: FontAwesomeIcons.mars,),
                    ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: (){
                      setState(() {
                        Gesture(2);
                      });
                    },
                      child: ReusableCard(
                        clr: fclr,
                        cardChild: IconContent(gender: 'FEMALE',sign: FontAwesomeIcons.venus),
                      )
                  ),
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