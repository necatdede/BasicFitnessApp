import 'package:http/http.dart' as http;

class HareketlerApi {
  static Future getHareketler() {
    var url = Uri.parse("http://10.0.2.2:3000/hareketler");
    return http.get(url);
  }

  static Future getHareketlerBolumId(int bolumId) {
    var url = Uri.parse("http://10.0.2.2:3000/hareketler?bolumId=$bolumId");
    return http.get(url);
  }
}
