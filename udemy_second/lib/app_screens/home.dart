import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
          alignment: Alignment.center,
          color: Colors.deepPurple,
          padding: EdgeInsets.only(top: 100.0),
          child: Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  Expanded(
                      child: Text("Col 1 Row 1",
                          textAlign: TextAlign.center,
                          textDirection: TextDirection.ltr,
                          style: TextStyle(
                              decoration: TextDecoration.none,
                              fontSize: 35.0,
                              color: Colors.white,
                              fontFamily: 'ChakraPetch',
                              fontWeight: FontWeight.w300))),
                  Expanded(
                      child: Text(
                    "This is 1st description. So how it is?",
                    textAlign: TextAlign.center,
                    textDirection: TextDirection.ltr,
                    style: TextStyle(
                        decoration: TextDecoration.none,
                        fontSize: 20.0,
                        color: Colors.white,
                        fontFamily: 'ChakraPetch',
                        fontWeight: FontWeight.w300),
                  ))
                ],
              ),
              Row(
                children: <Widget>[
                  Expanded(
                      child: Text("Col 2 Row 1",
                          textAlign: TextAlign.center,
                          textDirection: TextDirection.ltr,
                          style: TextStyle(
                              decoration: TextDecoration.none,
                              fontSize: 35.0,
                              color: Colors.white,
                              fontFamily: 'ChakraPetch',
                              fontWeight: FontWeight.w300))),
                  Expanded(
                      child: Text(
                    "This is 2nd description. So how it is?",
                    textAlign: TextAlign.center,
                    textDirection: TextDirection.ltr,
                    style: TextStyle(
                        decoration: TextDecoration.none,
                        fontSize: 20.0,
                        color: Colors.white,
                        fontFamily: 'ChakraPetch',
                        fontWeight: FontWeight.w300),
                  ))
                ],
              ),
              MyImageAsset(),
              MyButton()
            ],
          )),
    );
  }
}

class MyImageAsset extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    AssetImage assetImage = AssetImage("images/M.jpg");
    Image image = Image(
      image: assetImage,
      width: 250.0,
      height: 250.0,
    );
    return Container(
      child: image,
      margin: EdgeInsets.only(top: 50.0, bottom: 50.0),
    );
  }
}

class MyButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200.0,
      height: 50.0,
      child: RaisedButton(
          color: Colors.blue,
          textColor: Colors.white,
          child: Text(
            "Click Button",
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 16.0,
                fontFamily: 'ChakraPetch',
                fontWeight: FontWeight.w300),
          ),
          elevation: 6.0,
          onPressed: () => performAction(context)),
    );
  }

  void performAction(BuildContext context) {
    var alertDialog = AlertDialog(
      title: Text("Action performed successfully."),
      content: Text("This is the content."),
    );
    showDialog(
        context: context, builder: (BuildContext context) => alertDialog);
  }
}
