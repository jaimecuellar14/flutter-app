import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BikeState extends StatefulWidget{
  final String data;

  BikeState(this.data);
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new Bikes(data);
  }

}

class Bikes extends State<BikeState>{
  final String data;
  Bikes(this.data);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text("${data} page"),
        backgroundColor: Colors.black,
        
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Text("The lenguage of this page is ${data}"),
          ],
        ),
      )
    );
  }

}