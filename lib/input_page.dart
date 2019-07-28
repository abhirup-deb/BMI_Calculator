import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'result_page.dart';

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
  int height = 160;
  int weight = 60;
  int age = 18;

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
            child:ReusableCard(clr: Color(0xFF1D1E33),
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text('HEIGHT'),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: <Widget>[
                      Text(height.toString(),style: TextStyle(
                        fontSize: 38.0,
                        fontWeight: FontWeight.w900,
                      ),),
                      Text('cm'),
                    ],),
                  Slider(
                    value: height.toDouble(),
                    min: 120,
                    max: 220,
                    activeColor: Color(0xFFEB1555),
                    inactiveColor: Color(0xFF8D8E98),
                    onChanged: (double newValue){
                      setState(() {
                        height= newValue.round();
                      });
                    },
                  ),
                ],
              ),
            ),
          ),
          Row(
            children: <Widget>[
              Expanded(
                child: ReusableCard(clr: Color(0xFF1D1E33),
                  cardChild: Column(
                    children: <Widget>[
                      SizedBox(
                        height: 7.0,
                      ),
                      Text('AGE'),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(age.toString(),style: TextStyle(fontWeight: FontWeight.w900,fontSize: 38.0),),
                          SizedBox(
                            width: 5.0,
                          ),
                          Text('yrs'),
                        ],
                      ),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          RoundIconButton(
                            icon: FontAwesomeIcons.plus,
                            onPressed: (){
                              setState((){
                                age++;
                              });
                            },
                          ),
                          SizedBox (
                            width: 5.0,
                          ),
                          RoundIconButton(
                            icon: FontAwesomeIcons.minus,
                            onPressed: (){
                              setState((){
                                if(age!=0)
                                  age--;
                              });
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: ReusableCard(clr: Color(0xFF1D1E33),
                  cardChild: Column(
                    children: <Widget>[
                      SizedBox(
                        height: 7.0,
                      ),
                      Text('WEIGHT'),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(weight.toString(),style: TextStyle(fontWeight: FontWeight.w900,fontSize: 38.0),),
                          SizedBox(
                            width: 5.0,
                          ),
                          Text('kg'),
                        ],
                      ),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          RoundIconButton(
                            icon: FontAwesomeIcons.plus,
                            onPressed: (){
                              setState((){
                                weight++;
                              });
                            },
                          ),
                          SizedBox (
                            width: 5.0,
                          ),
                          RoundIconButton(
                            icon: FontAwesomeIcons.minus,
                            onPressed: (){
                              setState((){
                                if(weight!=0)
                                  weight--;
                              });
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => Resultpage()),);
            },
            child: Container(
              color: Color(0xFFEB1555),
              margin: EdgeInsets.only(top: 1.0),
              width: double.infinity,
              height: 60.0,
              child: Center(child: Text('CALCULATE',style: TextStyle(fontSize: 28.0),),),
            ),
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

class RoundIconButton extends StatelessWidget {
  RoundIconButton({@required this.icon,@required this.onPressed});
  final IconData icon;
  final Function onPressed;
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      child: Icon(icon),
      onPressed: onPressed,
      elevation: 6.0,
      constraints: BoxConstraints.tightFor(height: 46.0, width: 46.0),
      shape: CircleBorder(),
      fillColor: Color(0xFF4C4F5E),
    );
  }
}
