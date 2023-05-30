import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class HomeContent extends StatefulWidget {
  @override
  _HomeContentState createState() => _HomeContentState();
}

class _HomeContentState extends State<HomeContent> {
  void click(String h) {
    print(h);
  }

  /// Determine the current position of the device.
  ///
  /// When the location services are not enabled or permissions
  /// are denied the `Future` will return an error.
  Future<Position> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Location services are not enabled don't continue
      // accessing the position and request users of the
      // App to enable the location services.
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // Permissions are denied, next time you could try
        // requesting permissions again (this is also where
        // Android's shouldShowRequestPermissionRationale
        // returned true. According to Android guidelines
        // your App should show an explanatory UI now.
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    // When we reach here, permissions are granted and we can
    // continue accessing the position of the device.
    return await Geolocator.getCurrentPosition();
  }

  Future _sendSOS() async {
    _determinePosition();
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    print(position);
    Map<String, dynamic> positionMap = {
      'lat': position.latitude.toString(),
      'long': position.longitude.toString(),
    };
    return positionMap;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Text(
            "Home Screen",
            style: TextStyle(fontSize: 48),
          ),
          SizedBox(
            height: 50,
          ),
          GestureDetector(
            onTap: () => showDialog<String>(
              context: context,
              builder: (BuildContext context) => AlertDialog(
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('Trying to send an SOS?',
                        style: TextStyle(fontWeight: FontWeight.bold)),
                  ],
                ),
                content:
                    const Text('Press and hold to successfully send an SOS'),
                actions: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextButton(
                        onPressed: () => Navigator.pop(context, 'OK'),
                        child: const Text('OK'),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            onLongPress: () async {
              Map<String, dynamic> positionMap = await _sendSOS();
              String latitude = positionMap['lat'];
              String longitude = positionMap['long'];

              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text('SOS Sent',
                            style: TextStyle(fontWeight: FontWeight.bold)),
                      ],
                    ),
                    content: Text('${latitude}; ${longitude}'),
                    actions: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          TextButton(
                            onPressed: () => Navigator.pop(context, 'OK'),
                            child: const Text('OK'),
                          ),
                        ],
                      ),
                    ],
                  );
                },
              );
            },
            child: Container(
              width: 200,
              height: 200,
              child: Icon(
                Icons.sos,
                size: 150,
                color: Colors.white,
              ),
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.red,
                  boxShadow: [
                    BoxShadow(
                      color: Color.fromARGB(130, 237, 125, 58),
                      blurRadius: 15,
                      spreadRadius: 15,
                    )
                  ]),
            ),
          ),
        ],
      ),
    );
  }
}
