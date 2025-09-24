import 'package:bookia_application/core/theme/app_color.dart';
import 'package:flutter/material.dart';

class CustomTextFormField extends StatefulWidget {
  final String hintText;
  final bool isPassword;
  final TextEditingController? controller ;
  const CustomTextFormField({super.key, required this.hintText,
    this.isPassword=false, this.controller});

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  bool obsecureText = true;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller ,
      obscureText: widget.isPassword && obsecureText,
      decoration: InputDecoration(
        suffixIcon: widget.isPassword? InkWell(onTap: (){
          setState(() {
            obsecureText=!obsecureText;
          });
        },
            child: Icon(obsecureText?Icons.visibility_off : Icons.visibility)) : null,
        fillColor: AppColor.backgroundTextFormColor,
        filled: true,
        hintText: widget.hintText,
        hintStyle: TextStyle(
          fontSize: 15,
          color: AppColor.hintTextColor
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColor.borderColor),
         borderRadius: BorderRadius.circular(8),
        ) ,
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColor.primary),
          borderRadius: BorderRadius.circular(8),
        )
      ),

    );
  }
}
