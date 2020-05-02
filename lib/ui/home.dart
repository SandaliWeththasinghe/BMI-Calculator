import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new HomeState();
  }
}
    
class HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: new Text("BMI"),
        centerTitle: true,
        backgroundColor: Colors.pinkAccent,
      ),

      body: new Container(
        child: new ListView(
          children: <Widget>[
            new Image.asset(
              'images/bmilogo.png',
              height: 100.0,
              width: 250.0,
            ),

            new Container(
              color: Colors.grey,
              margin: EdgeInsets.all(5.0),
              child: new Column(
                children: <Widget>[
                  new TextField(
                    // controller: _weightController,
                    keyboardType: TextInputType.number,
                    decoration: new InputDecoration(
                      labelText: 'Age',                      
                      icon: new Icon(Icons.person_outline)
                    ),
                  ),

                  new TextField(
                    // controller: _weightController,
                    keyboardType: TextInputType.number,
                    decoration: new InputDecoration(
                      labelText: 'Height in meters',
                      icon: new Icon(Icons.line_weight),
                    ),
                  ),

                  new TextField(
                    // controller: _weightController,
                    keyboardType: TextInputType.number,
                    decoration: new InputDecoration(
                      labelText: 'Weight in kilograms',
                      icon: new Icon(Icons.line_weight),
                    ),
                  ),

                  new Padding(padding: EdgeInsets.all(5.0)),

                  new RaisedButton(
                    onPressed:() => debugPrint("Button pressed"),
                    color: Colors.pinkAccent,
                    child: new Text(
                      "Calculate",
                      style: new TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            new Column(
              children: <Widget>[
                new Text(
                  "Your BMI: ",
                  style: new TextStyle(
                    color: Colors.blue,
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.w500,
                  ),
                ),

                new Padding(padding: EdgeInsets.all(5.0)),

                new Text(
                  "Weight Catagory ",
                  style: new TextStyle(
                    color: Colors.pinkAccent,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),

          ],
        ),

      ),
    );
  }
}

