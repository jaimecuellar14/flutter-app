import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:internetstores/models/BikeModel.dart';

class BikeInfo extends StatefulWidget{
  final BikeModel bike;
  BikeInfo(this.bike);
  @override
  State<StatefulWidget> createState() {
    return new BikeInfoState(bike);
  }

}
/**
 * Widget that will show the data from the clicked bike on the list.
 **/
class BikeInfoState extends State<BikeInfo>{
  final BikeModel bike;
  BikeInfoState(this.bike);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:Text("${bike.name}"),backgroundColor: Colors.black,),
      body: Container(
        child: Center(
          child: Column(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(top:30),
                child:Image.network("${bike.photoUrl}"),
              ),
              Column(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(top: 20),
                    child: Text("${bike.name}", style: TextStyle(fontSize: 20, letterSpacing: 3),),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 20),
                    child: Text("${bike.description}"),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top:20),
                    child: Column(
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Icon(Icons.location_on, color: Colors.black,),
                            Text("${bike.location}")
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Icon(Icons.monetization_on, color:Colors.black),
                            Text("${bike.priceRange}"),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Icon(Icons.category, color:Colors.black),
                            Text("${bike.category}")
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Icon(Icons.format_size, color:Colors.black),
                            Text("Frame size: ${bike.framesize}")
                          ],
                        )
                      ],
                    )
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

}