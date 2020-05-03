import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new HomeState();
  }
}
    
class HomeState extends State<Home> {

  final TextEditingController _ageController = new TextEditingController();
  final TextEditingController _heightController = new TextEditingController();
  final TextEditingController _weightController = new TextEditingController();
  double result = 0.0;

  // double _showResultBMI = 0.0;

  // void _resultBMI() {
  //   setState(() {
  //     result = calculateBMI(_weightController.text, _heightController.text);
  //   });
  // }

  // double calculateBMI( String weight, String height) {

  //   if ((int.parse(weight).toString().isNotEmpty ||
  //   int.parse(weight) > 0) && 
  //   (int.parse(height).toString().isNotEmpty || 
  //   int.parse(height) > 0)) {

  //     return int.parse(weight) / (int.parse(height) * int.parse(height));
      
  //   } else {
  //     print("Wrong !");
  //     return double.parse("0.0");
  //   }

  // }

  void _calculateBMI() {

    setState(() {      
    
      int age = int.parse(_ageController.text);
      double height = double.parse(_heightController.text);
      double weight = double.parse(_weightController.text);

      if((_ageController.text.isNotEmpty || age > 0) 
        && ((_heightController.text.isNotEmpty || height > 0) 
          && (_weightController.text.isNotEmpty || weight > 0))) {

            result = weight / (height * height); //BMI
          } else {
            result = 0.0;
          }
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: new Text("BMI"),
        centerTitle: true,
        backgroundColor: Colors.pinkAccent,
      ),

      body: new Container(
        alignment: Alignment.topCenter,
        child: new ListView(
          padding: const EdgeInsets.all(2.0),
          children: <Widget>[
            new Image.asset(
              'images/bmilogo.png',
              height: 100.0,
              width: 250.0,
            ),

            new Container(
              color: Colors.grey.shade300,
              height: 245.0,
              width: 290.0,
              margin: EdgeInsets.all(5.0),
              child: new Column(
                children: <Widget>[
                  new TextField(
                    controller: _ageController,
                    keyboardType: TextInputType.number,
                    decoration: new InputDecoration(
                      labelText: 'Age',
                      hintText: 'eg: 23',
                      icon: new Icon(Icons.person_outline)
                    ),
                  ),

                  new TextField(
                    controller: _heightController,
                    keyboardType: TextInputType.number,
                    decoration: new InputDecoration(
                      labelText: 'Height in meters',
                      hintText: 'eg: 1.5',
                      icon: new Icon(Icons.insert_chart),
                    ),
                  ),

                  new TextField(
                    controller: _weightController,
                    keyboardType: TextInputType.number,
                    decoration: new InputDecoration(
                      labelText: 'Weight in kilograms',
                      hintText: 'eg: 50',
                      icon: new Icon(Icons.line_weight),
                    ),
                  ),

                  new Padding(padding: EdgeInsets.all(5.0)),

                  // Calculatee button
                  new RaisedButton(
                    onPressed:_calculateBMI, 
                    // onPressed:() => debugPrint("button pressed"),
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
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                new Text(
                  "Your BMI: $result", // Enter text
                  style: new TextStyle(
                    color: Colors.blueAccent,
                    fontStyle: FontStyle.italic,
                    fontSize: 19.9,
                    // fontWeight: FontWeight.w500,
                  ),
                ),

                new Padding(padding: const EdgeInsets.all(5.0)),

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

