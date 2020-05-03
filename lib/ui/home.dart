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
  String weightCategory = "";

  // void _resultBMI() {
  //   setState(() {
  //     result = calculateBMI(_weightController.text, _heightController.text);

      // if (result < 18.5) {
      //   weightCategory = "Underweight";
      // } else if (18.5 <= result && result < 24.9) {
      //   weightCategory = "Normal";
      // } else if (24.9 <= result && result < 29.9) {
      //   weightCategory = "Overweight";
      // } else if (29.9 <= result) {
      //   weightCategory = "Obese";
      // } else {
      //   weightCategory = "Wrong Inpt";
      // } 

  //   });
    
  // }

  // double calculateBMI( String weight, String height) {

  // if ((weight.isNotEmpty || double.parse(weight) > 0) && 
  //   (height.isNotEmpty || double.parse(height) > 0)) {

  //     return double.parse(weight) / (double.parse(height) * double.parse(height));
  
  //   } else {
  //     print("Wrong !");
  //     return double.parse("0.0");
  //   }

  // }

  String _finalResult;

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

      if (result < 18.5) {
        weightCategory = "Underweight";
      } else if (18.5 <= result && result < 24.9) {
        weightCategory = "Normal";
      } else if (24.9 <= result && result < 29.9) {
        weightCategory = "Overweight";
      } else if (29.9 <= result) {
        weightCategory = "Obese";
      } else {
        weightCategory = "Wrong Inpt";
      } 
    });

    _finalResult = "Your BMI: ${result.toStringAsFixed(1)}";
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

                  // Calculate button
                  new RaisedButton(
                    onPressed:_calculateBMI,
                    // onPressed:_resultBMI, 
                    // onPressed:() => debugPrint(""),
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
                  // "Your BMI: " + result.toStringAsFixed(1), // Enter text
                  // "Your BMI: $result", // Enter text
                  "$_finalResult",

                  style: new TextStyle(
                    color: Colors.blueAccent,
                    fontStyle: FontStyle.italic,
                    fontSize: 19.9,
                    fontWeight: FontWeight.w500,
                  ),
                ),

                new Padding(padding: const EdgeInsets.all(5.0)),

                new Text(
                  "Weight Catagory: $weightCategory",
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

