import 'package:http/http.dart' as http;
import 'dart:convert';

class Networking {
  String _myAIPKey = '7ce105f0569a970aa6ab8c383b482f69';

  Future sendWeatherRequest(double lat, double long) async {
    var url = Uri.https('api.openweathermap.org', '/data/2.5/weather',
        {'lat': lat.toString(), 'lon': long.toString(), 'appid': _myAIPKey});
    http.Response response = await http.get(url);

    if (response.statusCode == 200) {
      String body = response.body;
      return jsonDecode(body);
    } else {
      print(response.statusCode);
    }
  }
}
