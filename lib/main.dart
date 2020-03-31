
import 'package:flutter/material.dart';
import 'package:internetstores/pages/home.dart';
import 'package:internetstores/pages/bikes.dart';

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
      case '/bikes':
        var data = settings.arguments as String;
        return MaterialPageRoute(builder: (_) => Bikes(data));
      default:
        return MaterialPageRoute(
          builder: (_)=> Scaffold(
            body: Text("Route not found for ${settings.name}"),
          )
        );
    }
  }
}