import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'expA.dart';
import 'expB.dart';
import 'expC.dart';

final player=AudioPlayer();

void main() => runApp(MaterialApp(
  title: 'Flutter Demo',
  theme: ThemeData(
    primarySwatch: Colors.blue,
  ),
  home: MyApp(),
));

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Welcome to Flutter',
      home: Scaffold(
        appBar: AppBar(
          title: Text('실험진행을 위한 안내사항 전달'),
        ),
        body: Center(
          child: Column(
            children: [
              Spacer(),
              SizedBox(
                  width: 200,
                  height: 50,
                  child: OutlinedButton(onPressed:(){
                    player.play(AssetSource('before_exp.mp3'));
                  }, child: Text("실험 전 권고사항"),style: ButtonStyle(),)),
              Spacer(),
              SizedBox(
                width: 200,
                  height: 100,
                  child: OutlinedButton(onPressed:(){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>experA()));
                  }, child: Text("실험 A"),style: ButtonStyle(),)),
              Spacer(),
              SizedBox(
                  width: 200,
                  height: 100,
                  child: OutlinedButton(onPressed:(){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>experB()));
                  }, child: Text("실험 B"),style: ButtonStyle(),)),
              Spacer(),
              SizedBox(
                  width: 200,
                  height: 100,
                  child: OutlinedButton(onPressed:(){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>experC()));
                  }, child: Text("실험 C"),style: ButtonStyle(),)),
              Spacer(),
            ],
          )
        ),
      ),
    );
  }
}