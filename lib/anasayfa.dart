import 'dart:convert';

import 'package:dunya_ulkeleri/favoriler.dart';
import 'package:dunya_ulkeleri/ortak_liste.dart';
import 'package:dunya_ulkeleri/ulke.dart';
import 'package:dunya_ulkeleri/ulke_detay.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'ulke.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Anasayfa extends StatefulWidget {
  @override
  State<Anasayfa> createState() => _AnasayfaState();
}

class _AnasayfaState extends State<Anasayfa> {
  final String _apiUrl = "https://restcountries.com/v3.1/all?fields=name,flags,cca2,capital,region,lenguages,population";

  List<Ulke> _butunulkeler = [];

  List<String> _favoriUlkeKodlari=[];

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _favorileriCihazHafizasindanCek().then((Value){
        _verileriIntCek();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppbar(context),
      body: _buildbody(),
    );
  }

  AppBar _buildAppbar(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.blueAccent,
      title: Text("Tüm Ülkeler"),
      centerTitle: true,
      actions: [
        IconButton(
            icon: Icon(
              Icons.favorite,
            color: Colors.red,
            ),
          onPressed: (){
              _favorilerSayfasiniAc(context);
          },
        ),
      ],
    );
  }

  Widget _buildbody() {
    return _butunulkeler.isEmpty
        ? Center(child: CircularProgressIndicator())
        : OrtakListe(_butunulkeler, _favoriUlkeKodlari);
  }



  void _verileriIntCek() async {
    Uri uri = Uri.parse(_apiUrl);
    http.Response response = await http.get(uri);

    List<dynamic> parsedResponse = jsonDecode(response.body);

    for (int i = 0; i < parsedResponse.length; i++) {
      Map<String, dynamic> ulkeMap = parsedResponse[i];
      Ulke ulke = Ulke.fropMap(ulkeMap);
      _butunulkeler.add(ulke);
    }
    setState(() {});
  }



  Future<void> _favorileriCihazHafizasindanCek()async{
    SharedPreferences prefs = await SharedPreferences.getInstance();

    List<String>? favoriler = prefs.getStringList("favoriler");

    if(favoriler!=null){
      for(String ulkeKodu in favoriler){
        _favoriUlkeKodlari.add(ulkeKodu);
      }
    }
  }

  void _favorilerSayfasiniAc(BuildContext context) {
    MaterialPageRoute sayfaYolu = MaterialPageRoute(
      builder: (context){
        return Favoriler(_butunulkeler,_favoriUlkeKodlari);
      },
    );
    Navigator.push(context, sayfaYolu);
  }
}

