import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:internetstores/models/BikeModel.dart';
import 'package:internetstores/pages/firebase/FirebaseBikesList.dart';
import 'package:internetstores/services/Database.dart';
import 'package:provider/provider.dart';

class FireBaseBike extends StatefulWidget{
  final String data;
  FireBaseBike(this.data);
  @override
  State<StatefulWidget> createState() {
    return new _FireBaseBikeState(data);
  }
}

class _FireBaseBikeState extends State<FireBaseBike>{
  final String data;
  _FireBaseBikeState(this.data);

  @override
  void initState(){
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await loadBikesData();
    });
  }
  loadBikesData() async{
    String data = await rootBundle.loadString('lib/assets/ISBikesData.json');
    List<BikeModel> jsonResponse = (json.decode(data) as List)
                    .map((bike)=> BikeModel.fromJson(bike))
                    .toList();
    
    //print(jsonResult);
    addToFireStore(jsonResponse);
    //DatabaseService().getBikes();
  }
  void addToFireStore(bikes){
    for (var i = 0; i < bikes.length; i++) {
      DatabaseService().addBikesToFireStore(bikes[i]);
    }
  }
  @override
  Widget build(BuildContext context) {
   return StreamProvider<List<BikeModel>>.value(
      value: DatabaseService().bikes,
      child:Scaffold(
        appBar: AppBar(
          title:Text("$data page"),
          automaticallyImplyLeading: false,
          backgroundColor: Colors.black,
          centerTitle: true,
        ),
        body: FirebaseBikesList(),
      )
    );
  }

}