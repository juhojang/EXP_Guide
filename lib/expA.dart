import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

class experA extends StatefulWidget {
  const experA({Key? key}) : super(key: key);

  @override
  State<experA> createState() => _experAState();
}

class _experAState extends State<experA> {
  Timer? countdownTimer;
  Duration def=Duration(seconds: 0);
  final player=AudioPlayer();

  void initState(){
    super.initState();
  }

  void startTimer(int duration){
    def=Duration(seconds:duration);
    countdownTimer=
        Timer.periodic(Duration(seconds: 1),(_)=>setCountDown(def.inSeconds));
  }

  void setCountDown(int duration){
    def=Duration(seconds:duration);
    final reduceSecond=1;
    setState(() {
      int seconds=def.inSeconds-reduceSecond;
      if(seconds<0){
        countdownTimer!.cancel();
      }
      else{
        def=Duration(seconds:seconds);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    String strDigits(int n) => n.toString().padLeft(2, '0');
    final minutes = strDigits(def.inMinutes.remainder(60));
    final seconds = strDigits(def.inSeconds.remainder(60));
    return MaterialApp(
      title: 'Welcome to Flutter',
      home: Scaffold(
        appBar: AppBar(
          title: Text('실험 A'),
        ),
        body: Center(
          child:Column(
            children: [
              Spacer(),
              Row(
                children: [
                  Spacer(),
                  Text(
                    '$minutes:$seconds',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: minutes=='00'&&seconds=='00'?Colors.red:Colors.black,
                        fontSize: 50),
                  ),
                  Spacer(),
                  SizedBox(
                      width: 70,
                      height: 70,
                      child: OutlinedButton(onPressed:(){
                        player.stop();
                        countdownTimer?.cancel();
                      }, child: Text("Stop",style: TextStyle(color: Colors.red),),style: ButtonStyle(),)),
                  Spacer(),
                ],
              ),
              Spacer(),
              SizedBox(
                  width: 200,
                  height: 50,
                  child: OutlinedButton(onPressed:()async{
                    await player.play(AssetSource('Afirst_rest.mp3'));
                    sleep(Duration(milliseconds: 7956));
                    startTimer(31);
                  }, child: Text("시작 전 30초 휴식"),style: ButtonStyle(),)),
              Spacer(),
              SizedBox(
                  width: 200,
                  height: 50,
                  child: OutlinedButton(onPressed:()async{
                    await player.play(AssetSource('Asee.mp3'));
                    sleep(Duration(milliseconds: 2304));
                    startTimer(31);
                  }, child: Text("30초 악보보기"),style: ButtonStyle(),)),
              Spacer(),
              SizedBox(
                  width: 200,
                  height: 50,
                  child: OutlinedButton(onPressed:()async{
                    await player.play(AssetSource('Aafter_see.mp3'));
                    sleep(Duration(milliseconds: 2016));
                    startTimer(11);
                  }, child: Text("10초 휴식"),style: ButtonStyle(),)),
              Spacer(),
              SizedBox(
                  width: 200,
                  height: 50,
                  child: OutlinedButton(onPressed:()async{
                    await player.play(AssetSource('Aplay.mp3'));
                    sleep(Duration(milliseconds: 14292));
                    startTimer(61);
                  }, child: Text("연주 시작"),style: ButtonStyle(),)),
              Spacer(),
              SizedBox(
                  width: 200,
                  height: 50,
                  child: OutlinedButton(onPressed:()async{
                    await player.play(AssetSource('Aafter_play.mp3'));
                    sleep(Duration(milliseconds: 3924));
                    startTimer(31);
                  }, child: Text("30초 휴식"),style: ButtonStyle(),)),
              Spacer(),
              SizedBox(
                  width: 200,
                  height: 50,
                  child: OutlinedButton(onPressed:(){
                    player.play(AssetSource('survey.mp3'));
                  }, child: Text("설문지 작성"),style: ButtonStyle(),)),
              Spacer()
            ],
          )
        ),
      ),
    );
  }
}
