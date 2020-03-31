import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Bikes extends StatefulWidget{
  final String data;
  Bikes(this.data);
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new BikesState(data);
  }

}

class BikesState extends State<Bikes>{
  final String data;
  BikesState(this.data);
  dynamic bikeData;
  loadBikesData() async {
    String data = await rootBundle.loadString('lib/assets/ISBikesData.json');
    List<dynamic> jsonResult = json.decode(data);
    
    //print(jsonResult);
    setState((){
      bikeData = jsonResult;
    });
  }
  @override
  void initState(){
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await loadBikesData();
    });
  }

  void printData(){
    print(bikeData[0]);
  }
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
            FlatButton(
              onPressed: (){printData();}, child: Text("Ver data"),
            )
          ],
        ),
      )
    );
  }

}