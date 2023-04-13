import 'package:flutter/material.dart';

class BookDetails{
  static  List myBookList=[]; 
}

class ColorSelection{
static Bgcolor(context){
  if(Theme.of(context).brightness==Brightness.light){
    return Color.fromARGB(255, 236, 215, 153);
  }
}
}

