
import 'package:flutter/material.dart';
import 'package:internetstores/pages/home.dart';
import 'package:internetstores/pages/en/bikes.dart';
import 'package:internetstores/pages/de/deBikes.dart';

void main() => runApp(
  MaterialApp(
    onGenerateRoute: Router.generateRoute,
    initialRoute: '/',
  )
);

class Router{
  static Route<dynamic> generateRoute(RouteSettings settings){
    switch(settings.name){
      case '/':
        return MaterialPageRoute(builder: (_)=> Home());
      case '/bikes-en':
        return MaterialPageRoute(builder: (_)=>BikeState());
      case '/bikes-de':
        return MaterialPageRoute(builder:(_)=>deBikesState());
      default:
        return MaterialPageRoute(
          builder: (_)=> Scaffold(
            body: Text("Route not found for ${settings.name}"),
          )
        );
    }
  }
}