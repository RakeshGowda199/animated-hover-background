library animated_hover_background;

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

class AnimatedHoverBackground extends StatelessWidget {
  Widget child;
  Color? bgColor;
   AnimatedHoverBackground({Widget child,Key? key}) {
     this.child=child;
   }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: this.bgColor,
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Stack(
          children: [
            RiveAnimation.asset("packages/animated_hover_background/anim/background_anim.riv",fit: BoxFit.fill,),
            ClipRRect(
              // borderRadius: BorderRadius.only(topLeft: Radius.circular(24),topRight: Radius.circular(24)),
              child: BackdropFilter(
                filter: ImageFilter.blur(
                  sigmaX: 100.0,
                  sigmaY: 100.0,
                ),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  child: child,

                ),
              ),
            ),
          ],
        ),
      ),

    );
  }
}
