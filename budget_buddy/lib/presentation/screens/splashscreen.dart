import 'package:budget_buddy/presentation/screens/dashboard.dart';
import 'package:budget_buddy/utils/assetUtils.dart';
import 'package:budget_buddy/utils/colorUtils.dart';
import 'package:flutter/material.dart';

import '../../utils/textConstants.dart';
import '../../utils/textStyleUtils.dart';

class Splashscreen extends StatefulWidget {
  const Splashscreen({super.key});

  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> with SingleTickerProviderStateMixin {

  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    );

    _animation = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(_controller);

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _controller.forward().then((_) {
        Future.delayed(Duration(seconds: 1), () {
          Navigator.of(context).push(MaterialPageRoute(builder: (_) => Dashboard()));
        });
      });
    });
  }
  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(body: Column(mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [

      Center(
        child: AnimatedBuilder(
        animation: _animation,
        builder: (context, child) {
          return Transform(
            transform: Matrix4.identity()
              ..setEntry(3, 2, 0.002)
              ..rotateY(_animation.value * 3.141),
            child: AssetUtils.commonAssetImage("logo.png",140,140),
            alignment: Alignment.center,
          );
        },
        child: Image.asset('assets/image_to_flip.jpg'),
            ),
      ),
     
     const SizedBox(height: 20,),
     
     Center(child: Text(TextConstants.appName, style: TextUtils.getPoppinsBold(fontSize: 23.0, color: ColorUtils.primaryColor),),)

     // Center(child: ,)
    ],),);
  }
}
