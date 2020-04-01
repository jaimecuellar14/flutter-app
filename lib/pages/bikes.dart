import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:internetstores/models/BikeModel.dart';
import 'package:internetstores/pages/BikeCard.dart';

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
    List<BikeModel> jsonResponse = (json.decode(data) as List)
                    .map((bike)=> BikeModel.fromJson(bike))
                    .toList();
    
    //print(jsonResult);
    setState((){
      bikeData = jsonResponse;
    });
  }
  @override
  void initState(){
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await loadBikesData();
    });
  }

  void addBike(){
    setState(() {
      int size = bikeData.length;
      bikeData.add(new BikeModel(size+1,"test","test","test","test","test","test","test"));
    });

    print(bikeData);
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
        child: ListView.builder(itemCount: bikeData.length,
            itemBuilder: (BuildContext context, int index)
            {
              return Center(
                child: BikeCard(bikeData[index]),
              );
            },
            ),
      ),
      floatingActionButton: FloatingActionButton(onPressed: (){addBike();}, child: Icon(Icons.add,color: Colors.white,),backgroundColor: Colors.blue,),
    );
  }

}