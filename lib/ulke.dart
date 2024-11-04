class Ulke {
  String UlkeKodu;
  String isim;
  String baskent;
  String bolge;
  int nufus;
  String bayrak;
  var dil;

  Ulke.fropMap(Map<String,dynamic> ulkeMap):
      UlkeKodu=ulkeMap["cca2"] ?? "",
      isim=ulkeMap["name"]?["common"] ?? "",
      baskent=(ulkeMap["capital"] as List<dynamic>).isNotEmpty
            ? ulkeMap["capital"][0]
            : "",
      bolge=ulkeMap["region"],
      nufus=ulkeMap["population"],
      bayrak=ulkeMap["flags"]?["png"] ?? "",
      dil=ulkeMap["languages"];
}