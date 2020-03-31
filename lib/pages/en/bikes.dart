import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BikeState extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new Bikes();
  }

}

class Bikes extends State<BikeState>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("BIKES"),
      ),
      body: Text("bike page"),
    );
  }

}