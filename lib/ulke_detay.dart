import 'package:dunya_ulkeleri/ulke.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class UlkeDetaySayfasi extends StatelessWidget {
  final Ulke _ulke;

  UlkeDetaySayfasi(this._ulke);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: _buildBody(context),
    );
  }

  AppBar _buildAppBar(){
    return AppBar(
      backgroundColor: Colors.blueAccent ,
      title: Text(_ulke.isim),
      titleTextStyle: TextStyle(color: Colors.white,fontSize: 23),
      centerTitle: true,
    );
  }

  Widget _buildBody(BuildContext context){
    return Column(
      children: [
        SizedBox(width: double.infinity,
        height: 32,),
        _buildBayrak(context),
        SizedBox(height: 24),
        _buildUlkeIsmiText(),
        SizedBox(height: 36),
        _buildTumDetaylar(),
      ],
    );
  }

  Widget _buildTumDetaylar(){
    return Padding(
      padding: const EdgeInsets.only(left: 24),
      child: Column(
        children: [
          _buildDetayRow("Ülke İsmi", _ulke.isim),
          _buildDetayRow("Başkent", _ulke.baskent),
          _buildDetayRow("Bölge", _ulke.bolge),
          _buildDetayRow("Nüfus", _ulke.nufus.toString()),
        ],
      ),
    );
  }

  Widget _buildBayrak(BuildContext context){
    return Image.network(
        _ulke.bayrak,
        width:  MediaQuery.sizeOf(context).width/2,
        fit: BoxFit.fitWidth,
    );
  }

  Widget _buildUlkeIsmiText(){
    return Text(
        _ulke.isim,
        style: TextStyle(
          fontSize: 30,
          fontWeight: FontWeight.bold,
        ),
    );
  }

  Widget _buildDetayRow(String baslik,String detay){
    return Row(
       children: [
         Expanded(
        flex: 3,
        child: Text(
        baslik,
        style: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold
    ),
    ),
    ),
         Expanded(
        flex: 6,
        child: Text
          (detay,
          style: TextStyle(
              fontSize: 20
          ),
        ),
         ),
       ],
    );
  }
}
