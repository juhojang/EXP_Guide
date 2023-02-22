import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

class experC extends StatefulWidget {
  const experC({Key? key}) : super(key: key);

  @override
  State<experC> createState() => _experCState();
}

class _experCState extends State<experC> {
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
          title: Text('실험 C'),
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
                      await player.play(AssetSource('Cfirst_rest.mp3'));
                      sleep(Duration(milliseconds: 7884));
                      startTimer(31);
                    }, child: Text("시작 전 30초 휴식"),style: ButtonStyle(),)),
                Spacer(),
                SizedBox(
                    width: 200,
                    height: 50,
                    child: OutlinedButton(onPressed:()async{
                      await player.play(AssetSource('Csee.mp3'));
                      sleep(Duration(milliseconds: 2916));
                      startTimer(31);
                    }, child: Text("30초 악보보기"),style: ButtonStyle(),)),
                Spacer(),
                SizedBox(
                    width: 200,
                    height: 50,
                    child: OutlinedButton(onPressed:()async{
                      await player.play(AssetSource('Cafter_see.mp3'));
                      sleep(Duration(milliseconds: 2016));
                      startTimer(11);
                    }, child: Text("10초 휴식"),style: ButtonStyle(),)),
                Spacer(),
                SizedBox(
                    width: 200,
                    height: 50,
                    child: OutlinedButton(onPressed:()async{
                      await player.play(AssetSource('Cplay.mp3'));
                      sleep(Duration(milliseconds: 14040));
                      startTimer(61);
                    }, child: Text("연주 시작"),style: ButtonStyle(),)),
                Spacer(),
                SizedBox(
                    width: 200,
                    height: 50,
                    child: OutlinedButton(onPressed:()async{
                      await player.play(AssetSource('Cafter_play.mp3'));
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
