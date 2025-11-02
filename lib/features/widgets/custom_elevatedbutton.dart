import 'package:flutter/material.dart';

class CustomElevatedbotton extends StatelessWidget {
  
   CustomElevatedbotton({super.key,this.borderRadius,this.onPressed,this.child,this.foregroundColor,this.backgroundColor});
  double? borderRadius;
  Function()? onPressed;
  Widget? child;
  Color? foregroundColor;
  Color? backgroundColor;


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        height: 50,
        width: MediaQuery.of(context).size.width*0.95,
        child: ElevatedButton(
          style:ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(borderRadius: BorderRadiusGeometry.circular(borderRadius?? 12)
          
            ),
            foregroundColor:foregroundColor,
            backgroundColor:  backgroundColor),
          onPressed:onPressed,
           child:child),
      )
    );
  }
}