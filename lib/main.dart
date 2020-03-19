import 'package:flutter/material.dart';
import 'package:flutter_map_marker_cluster/flutter_map_marker_cluster.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong/latlong.dart';
import 'package:map_markers/map_markers.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        cursorColor: Colors.red,
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          FlutterMap(
            options: MapOptions(
              center: LatLng(3.028061, 101.718550),
              zoom: 12.0,
            ),
            layers: [
              TileLayerOptions(
                // urlTemplate: 'https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png',
                urlTemplate:
                    'https://maps.wikimedia.org/osm-intl/{z}/{x}/{y}.png',
                subdomains: ['a', 'b', 'c'],
              ),

              // MarkerLayerOptions(markers: <Marker>[
              //   Marker(
              //     height: 200.0,
              //     width: 200.0,
              //     point: LatLng(3.028061, 101.718550),
              //     builder: (context) => BubbleMarker(
              //       bubbleColor: Colors.white,
              //       bubbleContentWidgetBuilder: (BuildContext context) {
              //         return InkWell(child: Text("JT Apps"), onTap: (){print("Hi");},);
              //       },
              //     ),
              //   ),
              // ]),
              MarkerLayerOptions(
                markers: [
                  Marker(
                    width: 80.0,
                    height: 80.0,
                    point: LatLng(3.028061, 101.718550),
                    builder: (ctx) => Container(
                      child: BubbleMarker(
                        bubbleColor: Colors.white,
                        bubbleContentWidgetBuilder: (BuildContext context) {
                          return InkWell(
                            child: Text("JT Apps"),
                            onTap: () {
                              print("Hi");
                            },
                          );
                        },
                      ),

                      // InkWell(
                      //     onTap: () {
                      //       BubbleMarker(
                      //         bubbleColor: Colors.white,
                      //         bubbleContentWidgetBuilder: (BuildContext context) {
                      //           return InkWell(
                      //             child: Text("JT Apps"),
                      //             onTap: () {
                      //               print("Hi");
                      //             },
                      //           );
                      //         },
                      //       );
                      //     },
                      //     child: Icon(
                      //       Icons.location_on,
                      //       color: Colors.red,
                      //     ),),
                    ),
                  ),
                  Marker(
                    width: 35.0,
                    height: 35.0,
                    point: LatLng(48.886463, 2.341169),
                    builder: (BuildContext context) {
                      return PhotoMarker(
                        // imageAsset: "assets/images/whatsapp.png",
                        name: "Montmartre",
                        widgetBuilder: (BuildContext context) {
                          return Icon(Icons.location_on,
                              size: 35.0, color: Colors.orangeAccent);
                        },
                        // routeBuilder: (BuildContext context) =>
                        //     Navigator.of(context).push(
                        //         MaterialPageRoute(builder: (BuildContext context) {

                        // })),
                      );
                    },
                  )
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
