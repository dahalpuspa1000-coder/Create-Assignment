import 'package:flutter/material.dart';

class CustomTextformfield
 extends StatelessWidget {
  String? labelText;
  String? Function(String?)? validator;
  Function(String)? onChanged;
  AutovalidateMode? autovalidateMode;
  TextInputType? keyboardType;
  String? hintText;
  Widget? suffixIcon;
  Widget? prefixIcon;
  bool? obscureText;
  CustomTextformfield
  ({super.key,this.labelText,this.keyboardType,this.autovalidateMode,this.validator,this.onChanged,  this.hintText,this.suffixIcon,this.obscureText,this.prefixIcon});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        obscureText: obscureText ?? false,
        keyboardType: keyboardType,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        validator:validator ,
        onChanged:onChanged ,
        decoration: InputDecoration(
          suffixIcon:suffixIcon ,
          prefixIcon:prefixIcon ,
          labelText:labelText ,
          hintText: hintText,
          border: OutlineInputBorder(
      
            borderRadius: BorderRadius.circular(12)
          ),
        ),
      ),
        
      
    );
  }
}