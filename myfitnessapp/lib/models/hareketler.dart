class Hareketler{

  int id;
  int bolumId;
  String hareketAdi;
  String hareketUrl;

  Hareketler(this.id, this.bolumId, this.hareketAdi, this.hareketUrl);

  Hareketler.fromJson(Map json) {
    id = json["id"];
    bolumId = json["bolumId"];
    hareketAdi = json["hareketAdi"];
    hareketUrl = json["hareketUrl"];
  }

  Map toJson() {
    return {
      "id": id,
      "bolumId": bolumId,
      "hareketAdi": hareketAdi,
      "hareketUrl": hareketUrl
    };
  }
}