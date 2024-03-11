import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:hivve/assests/image_picker.dart';
import 'package:hivve/ui/calculator.dart';

class Abc extends StatefulWidget {
  const Abc({super.key});

  @override
  State<Abc> createState() => _AbcState();
}

class _AbcState extends State<Abc> {
  double containerWidth = 100;
  double containerHeight = 100;
  Color containerColor = Colors.blue;

  void updateContainer() {
    setState(() {
      containerWidth = (containerWidth == 100) ? 200 : 100;
      containerHeight = (containerHeight == 100) ? 200 : 100;
      containerColor= (containerColor == Colors.blue)
          ? Colors.red : Colors.blue ;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ABC'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: 100,
              color: Colors.green,
              child: AnimatedTextKit(repeatForever: true, animatedTexts: [
                //Wavy Animated Text
                WavyAnimatedText("Ahmad Khan ",
                    textAlign: TextAlign.center,
                    speed: const Duration(milliseconds: 300),
                    textStyle: const TextStyle(fontSize: 30))
              ]),
            ),
            Container(
              width: double.infinity,
              height: 100,
              color: Colors.blue,
              child: AnimatedTextKit(repeatForever: true, animatedTexts: [
                //Typer Animated Text
                TyperAnimatedText("Ahmad Khan ",
                    textAlign: TextAlign.center,
                    curve: Curves.easeIn,
                    speed: const Duration(milliseconds: 300),
                    textStyle: const TextStyle(fontSize: 30))
              ]),
            ),
            Container(
              width: double.infinity,
              height: 100,
              color: Colors.red,
              child: AnimatedTextKit(repeatForever: true, animatedTexts: [
                //Fade Animated Text
                FadeAnimatedText("Ahmad Khan ",
                    textAlign: TextAlign.center,
                    textStyle: const TextStyle(
                      fontFamily: 'Canterbury',
                      fontSize: 30,
                    )),
              ]),
            ),
            Container(
              width: double.infinity,
              height: 100,
              color: Colors.grey,
              child: AnimatedTextKit(repeatForever: true, animatedTexts: [
                //Colorize Animated Text
                ColorizeAnimatedText('Ahmad ',
                    textAlign: TextAlign.center,
                    textStyle: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 50.0,
                      fontFamily: 'Horizon',
                    ),
                    colors: [
                      Colors.purple,
                      Colors.blue,
                      Colors.yellow,
                      Colors.red,
                    ])
              ]),
            ),
            SizedBox(
              width: double.infinity,
              //Text Liquid Fill
              child: TextLiquidFill(
                text: 'Ahmad Khan',
                loadUntil: 1,
                waveColor: Colors.blue,
                boxBackgroundColor: Colors.deepOrange,
                textStyle: const TextStyle(
                  fontSize: 40.0,
                  fontWeight: FontWeight.bold,
                ),
                boxHeight: 100.0,
              ),
            ),
            SizedBox(
              width: double.infinity,
              height: 100,
              child: AnimatedTextKit(repeatForever: true, animatedTexts: [
                //Flicker Animated Text
                FlickerAnimatedText(
                  'Ahmad Khan',
                  textStyle:
                      const TextStyle(fontWeight: FontWeight.bold, fontSize: 40),
                  speed: const Duration(milliseconds: 1600),
                  entryEnd: 1,
                )
              ]),
            ),
            OutlinedButton(
                onPressed: () {
                  Get.to(const ViewImages());
                },
                child: const Text(
                  'Next Screen',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontWeight: FontWeight.w900, fontSize: 18),
                )),
            TextButton(onPressed: (){
              Get.to(const Calculator());
            }, child: const Text('next')),
            InkWell(onTap: (){
              updateContainer();
            },
              child: AnimatedContainer(
                duration: const Duration(seconds: 1),
                curve: Curves.bounceInOut,
                width: containerWidth,
                height: containerHeight,
                color: containerColor,
                alignment: Alignment.center,

                child: const Text('Tap Container'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
