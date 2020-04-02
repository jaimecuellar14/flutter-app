import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:internetstores/models/BikeModel.dart';

class BikeCard extends StatefulWidget{
  final BikeModel bike;
  BikeCard(this.bike);
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new BikeCardState(bike);
  }

}

class BikeCardState extends State<BikeCard>{
  @override
  final BikeModel bike;
  BikeCardState(this.bike);

  Widget build(BuildContext context) {
    // TODO: implement build
    return  Container(
    width: 200,
    child: Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      color: Colors.black,
      elevation: 10,
      child: InkWell(
        onTap: (){Navigator.pushNamed(context, '/bikeInfo', arguments: bike);},
        child:  Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
           ListTile(
            leading: Image.network(bike.photoUrl),
            title: Text('${bike.name}', style: TextStyle(color: Colors.white)),
            subtitle: Text('${bike.location}', style: TextStyle(color: Colors.white)),
          ),
          ButtonTheme.bar(
            child: ButtonBar(
              children: <Widget>[
                
                FlatButton(
                  child: const Text("Remove", style:TextStyle(color:Colors.white)),
                  onPressed: (){print("Removing : ${bike.id}");},
                )
              ],
            ),
          ),
        ],
        ),
      )
    ),
  );
  }

}