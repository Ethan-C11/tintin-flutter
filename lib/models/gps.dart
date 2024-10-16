class GPS {
  late double _latitude;
  late double _longitude;

  GPS(double lat, double long) {
    _latitude = lat;
    _longitude = long;
  }

  double getLatitude(){
    return _latitude;
  }

  double getLongitude(){
    return _longitude;
  }
}