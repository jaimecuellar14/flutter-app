import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:internetstores/models/BikeModel.dart';

class BikeList extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new BikeListState();
  }

}

class BikeListState extends State<BikeList>{
  List<BikeModel> bikesData;


  loadBikesData() async{
    String data = await rootBundle.loadString('lib/assets/ISBikesData.json');
    List<BikeModel> jsonResponse = (json.decode(data) as List)
                    .map((bike)=> BikeModel.fromJson(bike))
                    .toList();
    
    //print(jsonResult);
    setState((){
      bikesData = jsonResponse;
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
      int size = bikesData.length;
      bikesData.add(new BikeModel(size+1,"test","test","test","test","test","test","test"));
    });

    print(bikesData);
  }
  void removeBike(id){
    print(id);
    setState(() {
      bikesData.removeWhere((item)=> item.id==id);      
    });
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
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