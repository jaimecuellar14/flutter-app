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

  /**
   * Function to get the data from the .json file on the assets
   * to later add that information to firebase firestore service.
   */
  loadBikesData() async{
    String data = await rootBundle.loadString('lib/assets/ISBikesData.json');
    List<BikeModel> jsonResponse = (json.decode(data) as List)
                    .map((bike)=> BikeModel.fromJson(bike))
                    .toList();
      
    addToFireStore(jsonResponse);
  }
  @override
  void initState(){
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await loadBikesData();
    });
  }
  
  /**
   * Function getting a list of bikes
   * Then calling the database service to add the bike
   * to firebase
   */
  void addToFireStore(bikes){
    for (var i = 0; i < bikes.length; i++) {
      DatabaseService().addBikesToFireStore(bikes[i]);
    }
  }
  @override
  Widget build(BuildContext context) {
    /**
     * Widget using the StreamProvider Widget
     * so the Widget is "open" to reciving changes
     * from firebase.
     * 
     */
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