import 'dart:async';
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:internetstores/models/BikeModel.dart';

class BikeList extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return new BikeListState();
  }

}

class BikeListState extends State<BikeList>{
  //List of Bikes created
  //To be used as state for the widget
  List<BikeModel> bikesData;


  /**
   * Function that will get the .json file from assets
   * and set the state so that in any change of the state
   * the widget re-renders and show the data changes.
   */
  loadBikesData() async{
    String data = await rootBundle.loadString('lib/assets/ISBikesData.json');
    List<BikeModel> jsonResponse = (json.decode(data) as List)
                    .map((bike)=> BikeModel.fromJson(bike))
                    .toList();
    
    setState((){
      bikesData = jsonResponse;
    });
  }

  /**
   * The loadBikesData function is executed right when the widget starts
   */
  @override
  void initState(){
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await loadBikesData();
    });
  }

  /**
   * Function to add a bike
   * it's added using the setState so the widget re-renders
   * and shows the added bike
   */
  void addBike(){
    showToast(context, "Bike added");
    setState(() {
      int size = bikesData.length;
      bikesData.add(new BikeModel(size+1,"M", "Mountain", "Stuttgart", "Best bike", "https://images.internetstores.de/products//1066124/02/98ba28/Cube_Town_Hybrid_Pro_500_Easy_Entry_black_n_green[640x480].jpg?forceSize=true&forceAspectRatio=true&useTrim=true",
     "Normal", "The best bike"));
    });

    print(bikesData);
  }
  /**
   * function to delete a bike
   * setState is called so the widget re-renders
   * and the removed bike is not displayed anymore
   */
  void removeBike(id){
    showToast(context, "Bike removed");
    print(id);
    setState(() {
      bikesData.removeWhere((item)=> item.id==id);      
    });
  }
  /**
   * Function to show a simple toast
   * Informing of the action (add/remove)
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
     * Widget showing the data from the bikes list
     */
    return Scaffold(
      backgroundColor: Colors.grey[900],
      body: Center(
        child: ListView.builder(
          itemCount: bikesData.length,
          itemBuilder: (BuildContext context , int index){
            return Container(
              width: 100,
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                color: Colors.grey[850],
                elevation: 10,
                child: InkWell(
                  onTap: (){Navigator.pushNamed(context, '/bikeInfo', arguments: bikesData[index]);},
                  child:  Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        IconButton(icon: Icon(Icons.remove_circle,color:Colors.red[400]), onPressed: (){removeBike(bikesData[index].id);}),
                      ],
                    ),
                    ListTile(
                      leading: Image.network(bikesData[index].photoUrl),
                      title: Text('${bikesData[index].name}', style: TextStyle(color: Colors.white)),
                      subtitle: Text('Category: ${bikesData[index].category}', style: TextStyle(color: Colors.white)),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Text("Frame size: ${bikesData[index].framesize}", style: TextStyle(color:Colors.white,)),
                        Text("Location: ${bikesData[index].location}", style:TextStyle(color:Colors.white,)),
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
          })
      ),
      floatingActionButton:FloatingActionButton(onPressed: (){addBike();},child: Icon(Icons.add,color: Colors.white,),backgroundColor: Colors.blue[600],)
    );
  }

}