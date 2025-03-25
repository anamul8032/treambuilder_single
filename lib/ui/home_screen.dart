import 'dart:async';

import 'package:flutter/material.dart';

import '../common/common_widgets.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.greenAccent,
        title: Text("Stream Builder", style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Colors.white),),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextFormField(
              controller: textController,
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              decoration: InputDecoration(
                hintText: 'Enter Your Data'
              ),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
                onPressed: (){
                // final input = textController.text;
                // language.add(input);
                // streamController.sink.add(language);
                  addItem();
                textController.clear();
                }, child: Text("Add To Data", style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold, color: Colors.white),)),
            Expanded(child: StreamBuilder(stream: streamController.stream, builder: (context, snapshot){
              if(snapshot.hasData){
                return ListView.builder(
                  itemCount: language.length,
                    itemBuilder: (context, index){
                  return Card(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(snapshot.data[index], style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),),
                        IconButton(onPressed: (){
                          removeItem(index);
                        }, icon: Icon(Icons.delete, size: 40,color: Colors.redAccent,))
                      ],
                    ),
                  );
                });
              }else{
                return Center(child: Text("Empty Data!!", style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),));
              }
            }))
          ],
        ),
      ),
    );
  }
}
