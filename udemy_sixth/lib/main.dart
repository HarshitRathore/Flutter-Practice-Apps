import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: "S.I. Calculator",
    home: SIForm(),
    theme: ThemeData(
        primaryColor: Colors.indigo,
        accentColor: Colors.indigoAccent,
        brightness: Brightness.light),
  ));
}

class SIForm extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _SIFormState();
  }
}

class _SIFormState extends State<SIForm> {
  var _currencies = ["Dollar", "Ruppee", "Euro", "Dinar", "Other"];
  var _initialDropDownValue = "";
  var opstr = "";
  var _formKey = GlobalKey<FormState>();

  TextEditingController principalController = TextEditingController();
  TextEditingController interestRateController = TextEditingController();
  TextEditingController termController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _initialDropDownValue = _currencies[0];
  }

  @override
  Widget build(BuildContext context) {
    TextStyle textStyle = Theme.of(context).textTheme.title;
    return Scaffold(
      backgroundColor: Colors.cyanAccent,
      appBar: AppBar(
        title: Text("Simple Interest Calculator"),
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: EdgeInsets.all(15.0),
          child: ListView(
            children: <Widget>[
              getHeadImageAsset(),
              Padding(
                padding: EdgeInsets.only(top: 5.0, bottom: 5.0),
                child: TextFormField(
                  keyboardType: TextInputType.number,
                  style: textStyle,
                  controller: principalController,
                  validator: (String userInput) {
                    if (userInput.isEmpty) {
                      return "Please enter principal amount";
                    }
                  },
                  decoration: InputDecoration(
                      labelText: "Principal",
                      hintText: "Enter Principal",
                      labelStyle: textStyle,
                      errorStyle: TextStyle(
                        color: Colors.yellowAccent,
                        fontSize: 15.0
                      ),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0))),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 5.0, bottom: 5.0),
                child: TextFormField(
                  keyboardType: TextInputType.number,
                  style: textStyle,
                  controller: interestRateController,
                  validator: (String userInput) {
                    if (userInput.isEmpty) {
                      return "Please enter interest rate";
                    }
                  },
                  decoration: InputDecoration(
                      labelText: "Rate Of Interest",
                      hintText: "In Percent",
                      labelStyle: textStyle,
                      errorStyle: TextStyle(
                          color: Colors.yellowAccent,
                          fontSize: 15.0
                      ),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0))),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 5.0, bottom: 5.0),
                child: Row(
                  children: <Widget>[
                    Expanded(
                        child: TextFormField(
                      keyboardType: TextInputType.number,
                      style: textStyle,
                      controller: termController,
                      validator: (String userInput) {
                        if (userInput.isEmpty) {
                          return "Please enter term";
                        }
                      },
                      decoration: InputDecoration(
                          labelText: "Term",
                          hintText: "Time in Years",
                          labelStyle: textStyle,
                          errorStyle: TextStyle(
                              color: Colors.yellowAccent,
                              fontSize: 15.0
                          ),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5.0))),
                    )),
                    Container(
                      width: 25.0,
                    ),
                    Expanded(
                        child: DropdownButton<String>(
                      style: textStyle,
                      items: _currencies.map((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value, style: textStyle),
                        );
                      }).toList(),
                      value: _initialDropDownValue,
                      onChanged: (String newValueSelected) {
                        setState(() {
                          this._initialDropDownValue = newValueSelected;
                        });
                      },
                    ))
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 5.0, bottom: 5.0),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: RaisedButton(
                          color: Theme.of(context).accentColor,
                          textColor: Theme.of(context).primaryColorDark,
                          elevation: 6.0,
                          child: Text(
                            "Calculate",
                            style: textStyle,
                          ),
                          onPressed: () {
                            setState(() {
                              if (_formKey.currentState.validate()){
                                this.opstr = _calculateTotalReturns();
                              }
                            });
                          }),
                    ),
                    Container(
                      width: 25.0,
                    ),
                    Expanded(
                      child: RaisedButton(
                          color: Colors.orange,
                          textColor: Colors.white,
                          elevation: 6.0,
                          child: Text(
                            "Reset",
                            style: textStyle,
                          ),
                          onPressed: () {
                            setState(() {
                              _reset();
                            });
                          }),
                    )
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.all(5.0),
                child: Text(
                  this.opstr,
                  style: textStyle,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget getHeadImageAsset() {
    AssetImage assetImage = AssetImage("images/head.jpg");
    Image image = Image(
      image: assetImage,
      width: 350.0,
      height: 150.0,
    );
    return Container(
      child: image,
      margin: EdgeInsets.all(15.0),
    );
  }

  String _calculateTotalReturns() {
    double principal = double.parse(principalController.text);
    double interestRate = double.parse(interestRateController.text);
    double term = double.parse(termController.text);

    double totalAmountPayable =
        principal + (principal * interestRate * term) / 100;

    String result =
        "After $term years, your investment will be worth $totalAmountPayable $_initialDropDownValue";
    return result;
  }

  void _reset() {
    principalController.text = "";
    interestRateController.text = "";
    termController.text = "";
    opstr = "";
    _initialDropDownValue = _currencies[0];
  }
}
