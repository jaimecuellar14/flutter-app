import 'package:flutter/material.dart';

class Home extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(bottom: 30),
              child: Text("Select the lenguage your preffer", style: TextStyle(color: Colors.white, letterSpacing: 2),),
            ),
            RaisedButton.icon(
              onPressed: (){Navigator.pushNamed(context, '/bikes',arguments: "Deutsch");}, 
              color: Colors.black,
              icon: Icon(
                Icons.airplay,
                color:Colors.blue,
              ), 
              label: Text("Deutsch", style:TextStyle(color:Colors.white),)
              ),
            RaisedButton.icon(
              onPressed: (){Navigator.pushNamed(context, '/bikes',arguments:'English');},
              color: Colors.black,
              icon: Icon(
                Icons.add_circle_outline,
                color:Colors.blue
              ), 
              label: Text("English", style: TextStyle(color:Colors.white),)
              ),
          ],
        ),
      ),
    );
  }

}