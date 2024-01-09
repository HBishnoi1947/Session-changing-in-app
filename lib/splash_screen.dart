import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:session/home.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with TickerProviderStateMixin{

  late final AnimationController _controller = AnimationController(vsync: this, duration: const Duration(seconds: 3))..repeat();

  @override
  void initState() {
    super.initState();

    Timer(const Duration(seconds: 5),()=> Navigator.pushReplacement (context, MaterialPageRoute(builder: (context) => const MyHome())));
  }

  @override
  void dispose(){
    _controller.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children:  [
            AnimatedBuilder(
              animation: _controller, 
              child: Container(
                height: 200,
                width: 200,
                child: const Center(
                  child: Icon(Icons.replay_outlined),
                ),
              ),
              builder: (BuildContext context, Widget? child){
                // print("harsh : ${_controller.value * 2.0 * pi}");
                return Transform.rotate(
                  angle: -_controller.value * 4.0 * pi, 
                  child: child 
                  );
              }),
            SizedBox(height: MediaQuery.of(context).size.height * 0.1,),
            Align(alignment: Alignment.center,child: const Text('Learning Time',style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25,),textAlign: TextAlign.center,))
          ],
        ),
      ),
    );
  }
}
