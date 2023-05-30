import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('SOS App'),
        ),
        body: Container(
          child: GestureDetector(
            onLongPress: () async {
              Map<String, dynamic> positionMap = await _sendSOS();
              String latitude = positionMap['lat'];
              String longitude = positionMap['long'];

              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: Text('SOS Location'),
                    content: Column(
                      children: [
                        Text('Latitude: $latitude'),
                        Text('Longitude: $longitude'),
                      ],
                    ),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: Text('Close'),
                      ),
                    ],
                  );
                },
              );
            },
            child: Container(
              width: 200,
              height: 200,
              color: Colors.blue,
              child: Center(
                child: Text(
                  'Long press for SOS',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<Map<String, dynamic>> _sendSOS() async {
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    print(position);
    Map<String, dynamic> positionMap = {
      'lat': position.latitude.toString(),
      'long': position.longitude.toString(),
    };
    return positionMap;
  }
}
