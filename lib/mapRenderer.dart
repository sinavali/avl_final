import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart' as latLng;

class MapRender extends StatelessWidget {
  final List firstPoint = [51.5, -0.09];
  final double zoom = 18;

  MapRender(firstPoint, zoom);

  @override
  Widget build(BuildContext context) {
    return FlutterMap(
      options: MapOptions(
        center: latLng.LatLng(firstPoint[0], firstPoint[1]),
        zoom: zoom,
      ),
      layers: [
        TileLayerOptions(
          urlTemplate: "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
          subdomains: ['a', 'b', 'c'],
        ),
        MarkerLayerOptions(
          markers: [
            Marker(
              width: 80.0,
              height: 80.0,
              point: latLng.LatLng(51.5, -0.09),
              builder: (ctx) => Container(
                child: FlutterLogo(),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
