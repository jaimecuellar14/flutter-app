import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:internetstores/models/BikeModel.dart';
import 'package:internetstores/services/Database.dart';
import 'package:provider/provider.dart';

class FirebaseBikesList extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _FirebaseBikesList();
  }

}

class _FirebaseBikesList extends State<FirebaseBikesList>{
  //List to store the data returned by firebase
  List<DocumentSnapshot> bikesData;
  

  /**
   * Function to get the bikes from  firebase
   * in order to get the number of bikes stored
   * so we can add a new one using the index
   * as id
   */
  void getBikes() async {
    final QuerySnapshot result =
          await Firestore.instance.collection('bikes').getDocuments();
    final List<DocumentSnapshot> documents = result.documents;
    int index = documents.length+1;
    BikeModel newBike = new BikeModel(index, "M", "Mountain", "Stuttgart", "Best bike", "https://images.internetstores.de/products//1066124/02/98ba28/Cube_Town_Hybrid_Pro_500_Easy_Entry_black_n_green[640x480].jpg?forceSize=true&forceAspectRatio=true&useTrim=true",
     "Normal", "The best bike");
    DatabaseService().addBikesToFireStore(newBike);
  }
  /**
   * Function called in widget to add a new bike
   */
  void addBike(){
    getBikes();
    showToast(context,"Bike added");
  }
  /**
   * Function called in widget to remove a bike
   */
  void removeBike(id){
    DatabaseService().deleteBike(id);
    showToast(context,"Bike deleted");
  }
  /**
   * Toast to inform of action
   * (add/remove bike)
   */
  void showToast(BuildContext context, String message){
    final scaffold = Scaffold.of(context);
    scaffold.showSnackBar(
      SnackBar(
        content: Text("$message"),
        action: SnackBarAction(
          label:"OK",
          onPressed: (){scaffold.hideCurrentSnackBar();},
        ),
      )
    );
    Timer(Duration(milliseconds:1500),()=>scaffold.hideCurrentSnackBar());
  }

  @override
  Widget build(BuildContext context) {
    /**
     * The Provider classed is used
     * To get the bikes from firebase (and changes)
     * To show them using the ListView widget
     */
    final bikes = Provider.of<List<BikeModel>>(context)??[];
    return Scaffold(
          body: ListView.builder(
        itemCount: bikes.length,
        itemBuilder: (BuildContext context, int index){
          return Container(
                width: 100,
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  color: Colors.grey[850],
                  elevation: 10,
                  child: InkWell(
                    onTap: (){Navigator.pushNamed(context, '/bikeInfo', arguments: bikes[index]);},
                    child:  Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          IconButton(icon: Icon(Icons.remove_circle,color:Colors.red[400]), onPressed: (){removeBike(bikes[index].id);}),
                        ],
                      ),
                      ListTile(
                        leading: Image.network(bikes[index].photoUrl),
                        title: Text('${bikes[index].name}', style: TextStyle(color: Colors.white)),
                        subtitle: Text('Category: ${bikes[index].category}', style: TextStyle(color: Colors.white)),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Text("Frame size: ${bikes[index].framesize}", style: TextStyle(color:Colors.white,)),
                          Text("Location: ${bikes[index].location}", style:TextStyle(color:Colors.white,)),
                        ],
                      ),
                      ButtonTheme.bar(
                        child: ButtonBar(
                          children: <Widget>[                          
                            
                          ],
                        ),
                      ),
                    ],
                    ),
                  )
                ),
              );
        }
      ),
      floatingActionButton:FloatingActionButton(onPressed: (){addBike();},child: Icon(Icons.add,color: Colors.white,),backgroundColor: Colors.blue[600],)
    );
  }

}