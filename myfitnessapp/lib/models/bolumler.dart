class Bolumler {
  int id;
  String bolumAdi;
  String bolumUrl;

  Bolumler(this.id, this.bolumAdi, this.bolumUrl);

  Bolumler.fromJson(Map json) {
    id = json["id"];
    bolumAdi = json["bolumAdi"];
    bolumUrl = json["bolumUrl"];
  }

  Map toJson() {
    return {"id": id, "bolumAdi": bolumAdi, "bolumUrl": bolumUrl};
  }
}
