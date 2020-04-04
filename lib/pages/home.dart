import 'package:flutter/material.dart';


class Home extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[600],
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(bottom: 30),
              child: Text("Select an implementation", style: TextStyle(color: Colors.white, letterSpacing: 2),),
            ),
            RaisedButton.icon(
              //Navigation to the firebase implementation
              //Passing one String as param
              onPressed: (){Navigator.pushNamed(context, '/firebaseBikes', arguments:"Firebase implementation");}, 
              color: Colors.black,
              icon: Icon(
                Icons.cloud_circle,
                color:Colors.blue,
              ), 
              label: Text("Firebase implementation", style:TextStyle(color:Colors.white),)
              ),
            RaisedButton.icon(
              //Navigation to the normal implementation
              //Passing one String as param
              onPressed: (){Navigator.pushNamed(context, '/bikes',arguments:'Normal implementation');},
              color: Colors.black,
              icon: Icon(
                Icons.computer,
                color:Colors.blue
              ), 
              label: Text("Regular implementation", style: TextStyle(color:Colors.white),)
              ),
          ],
        ),
      ),
    );
  }

}