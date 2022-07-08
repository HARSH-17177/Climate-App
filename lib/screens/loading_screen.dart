import 'package:climate_app/screens/location_screen.dart';
import 'package:climate_app/services/location.dart';
import 'package:climate_app/services/networking.dart';
import 'package:climate_app/services/weather.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:geolocator/geolocator.dart';

const apikey = '6274cd66d095aaf4b3b5918b6e5e08e3';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    super.initState();
    //
    getpermission();
    //Get the current location
    getlocationData();
  }

  Future<void> getlocationData() async {
    var weatherData =await WeatherModel().getLocationWeather(); //await is used as we know getlocation weather use future keyword

    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => LocationScreen(
                  locationweather: weatherData,
                ))); // here we are passing weather data from by means of constructor from loading page to weatherpage
  }

  @override
  void deactivate() {
    // performs the action while the widget is about to destroyed
    super.deactivate();
    print('deactivated');
  }

  Future<void> getpermission() async {
    LocationPermission permission = await Geolocator.requestPermission();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SpinKitSpinningLines(
      color: Colors.white,
      size: 200,
    )

        //  or

        // body: SpinKitDoubleBounce(
        //   color: Colors.white,
        //   size: 200,
        // ),
        );
  }
}
