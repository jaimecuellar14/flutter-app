import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:internetstores/models/BikeModel.dart';

class BikeInfo extends StatefulWidget{
  final BikeModel bike;
  BikeInfo(this.bike);
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new BikeInfoState(bike);
  }

}

class BikeInfoState extends State<BikeInfo>{
  final BikeModel bike;
  BikeInfoState(this.bike);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: SafeArea(
              child: Column(
              children: <Widget>[
                Text("${bike.name}"),
                Text("${bike.description}"),
                Text("${bike.framesize}"),
                Text("${bike.priceRange}"),
              ],
            ),
      ),
    );
  }

}