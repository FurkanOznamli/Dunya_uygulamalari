import 'package:dunya_ulkeleri/anasayfa.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(AnaUygulama());
}
 class AnaUygulama extends StatelessWidget {
 
   @override
   Widget build(BuildContext context) {
     return MaterialApp(
       home: Anasayfa(),
     );
   }
 }
 