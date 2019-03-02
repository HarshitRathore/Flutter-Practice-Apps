import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Stateful Widget Demo",
      home: FavoriteCity(),
    )
  );
}

class FavoriteCity extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _FavoriteCityState();
  }

}

class _FavoriteCityState extends State<FavoriteCity> {

  String nameCity = "";
  var _currencies = ["Dollar", "Ruppees", "Pounds", "Dinar", "Other"];
  var _currentItemSelected = "Ruppees";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Favorite City App"),
      ),
      body: Container(
        margin: EdgeInsets.all(20.0),
        child: Column(
          children: <Widget>[
            TextField(
              onChanged: (String userInput) {
                setState(() {
                  nameCity = userInput;
                });
              },
              onSubmitted: (String userInput) {
                showAlert(context, userInput);
              },
            ),
            DropdownButton<String>(
              items: _currencies.map((String dropItem) {
                return DropdownMenuItem<String>(
                  value: dropItem,
                  child: Text(dropItem),
                );
              }).toList(),
              onChanged: (String newItemSelected) {
                _onDropDownItemSelected(newItemSelected);
              },
              value: _currentItemSelected,
            ),
            Padding(
              padding: EdgeInsets.all(30.0),
              child: Text(
                "Your city is $nameCity",
                style: TextStyle(
                    fontSize: 32.0
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  void showAlert(BuildContext context, String userInput) {
    var alertDialog = AlertDialog(
      title: Text(
        "ALERT!!",
        textAlign: TextAlign.center,
      ),
      content: Text("Input is given as $userInput"),
    );

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alertDialog;
      }
    );
  }

  void _onDropDownItemSelected(String newItemSelected) {
    setState(() {
      this._currentItemSelected = newItemSelected;
    });
  }

}