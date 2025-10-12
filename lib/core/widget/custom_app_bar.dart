import 'package:bookia_application/core/theme/app_color.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String? title ;
  final bool withBackButton ;


  const CustomAppBar({super.key,this.title,this.withBackButton =true});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: AppBar(
        title: title!=null? Text(title!):null,
      backgroundColor: Colors.white,
        leading: withBackButton ? InkWell(
          onTap: (){
            Navigator.pop(context);
          },
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: AppColor.borderColor),
            ),child: Icon(Icons.arrow_back_ios_new_outlined),
          ),
        ): null,
      ),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size(double.infinity, 56);
}
