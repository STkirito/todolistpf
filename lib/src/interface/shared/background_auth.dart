import 'dart:ui';

import 'package:awesonestyle/awesonestyle.dart';
import 'package:flutter/material.dart';
import 'package:particles_flutter/particles_flutter.dart';

// ignore: must_be_immutable
class BackgroundAuth extends GetView {
  Widget child;
  BackgroundAuth(this.child, {super.key});

  @override
  Widget build(BuildContext context) {
    AwsScreenSize(context);
    return Stack(
      children: [
        CircularParticle(
          key: UniqueKey(),
          awayRadius: 80,
          numberOfParticles: 200,
          speedOfParticles: 1,
          height: AwsScreenSize.height(100),
          width: AwsScreenSize.width(100),
          onTapAnimation: true,
          particleColor: Colors.lightBlue,
          awayAnimationDuration: const Duration(milliseconds: 600),
          maxParticleSize: 8,
          isRandSize: true,
          isRandomColor: true,
          randColorList: [
            Colors.red.withAlpha(210),
            Colors.white.withAlpha(210),
            Colors.amber.withAlpha(210),
            Colors.green.withAlpha(210),
            Colors.blue.withAlpha(210),
          ],
          awayAnimationCurve: Curves.easeInOutCubicEmphasized,
          enableHover: true,
          hoverColor: Colors.limeAccent,
          hoverRadius: 90,
          connectDots: false, //not recommended
        ),
        Center(
          child: SizedBox(
            height: AwsScreenSize.height(80),
            width: AwsScreenSize.width(85),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(30),
              child: BackdropFilter(
                filter: ImageFilter.blur(
                  sigmaY: 10,
                  sigmaX: 10,
                ),
                child: child,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
