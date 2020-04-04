
import 'package:flutter/material.dart';
import 'package:internetstores/models/BikeModel.dart';
import 'package:internetstores/pages/firebase/firebaseBikes.dart';
import 'package:internetstores/pages/home.dart';
import 'package:internetstores/pages/normal/bikes.dart';
import 'package:internetstores/pages/BikeInfo.dart';

//We run  the app with an initial route
//That will render the Widget for that route.

void main() => runApp(
  MaterialApp(
    onGenerateRoute: Router.generateRoute,
    initialRoute: '/',
  )
);

class Router{
  //We declarate the routes for the application
  static Route<dynamic> generateRoute(RouteSettings settings){
    switch(settings.name){
      //First widget to be rendered
      case '/':
        return MaterialPageRoute(builder: (_)=> Home());
      case '/bikes':
        var data = settings.arguments as String;
        return MaterialPageRoute(builder: (_) => Bikes(data));
      case '/bikeInfo':
        var bike = settings.arguments as BikeModel;
        return MaterialPageRoute(builder: (_)=> BikeInfo(bike));
      case '/firebaseBikes':
        var data = settings.arguments as String;
        return MaterialPageRoute(builder: (_)=> FireBaseBike(data));
      default:
        return MaterialPageRoute(
          builder: (_)=> Scaffold(
            body: Text("Route not found for ${settings.name}"),
          )
        );
    }
  }
}