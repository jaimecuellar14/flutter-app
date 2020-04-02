import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:internetstores/pages/BikeList.dart';

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
  @override
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
      body: Container(
        child: Center(
          child: BikeList(),
        ),
      ),
      /* Center(
        child: ListView.builder(itemCount: bikeData.length,
            itemBuilder: (BuildContext context, int index)
            {
              return Center(
                child: BikeCard(bikeData[index])
              );
            },
            ),
      ),*/
      //floatingActionButton: FloatingActionButton(onPressed: (){addBike();}, child: Icon(Icons.add,color: Colors.white,),backgroundColor: Colors.blue,),
    );
  }

}