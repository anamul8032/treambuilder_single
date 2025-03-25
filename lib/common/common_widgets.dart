import 'dart:async';

import 'package:flutter/cupertino.dart';

TextEditingController textController = TextEditingController();
List<String> language = [];
StreamController streamController = StreamController();

void addItem(){
  language.add(textController.text);
  streamController.add(List.from(language));
}
void removeItem(int index){
  if(language.isNotEmpty){
    language.removeAt(index);
    streamController.add(List.from(language));
  }
}