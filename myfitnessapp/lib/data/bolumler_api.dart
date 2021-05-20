import 'package:http/http.dart' as http;

class BolumlerApi {
  static Future getBolumler() async {
    return http.get(Uri.parse("http://10.0.2.2:3000/bolumler"));
  }
}