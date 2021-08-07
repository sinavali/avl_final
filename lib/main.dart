import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import './mapRenderer.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: Scaffold(
        body: MyHomePage(title: 'Flutter Demo Home Page'),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List point = ['x', 'y'];

  void geoCheck() async {
    var newLoc = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    setState(() {
      point = [newLoc.latitude.toDouble(), newLoc.longitude.toDouble()];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
        height: 400,
        child: Row(
          children: [
            Expanded(
              child: Column(
                children: [
                  Container(
                    child: MapRender([point[0], point[1]], 18),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
