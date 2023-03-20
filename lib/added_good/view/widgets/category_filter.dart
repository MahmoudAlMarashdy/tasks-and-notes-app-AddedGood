import 'package:flutter/material.dart';

import '../../../core/styles/app_colors.dart';

class CategoriesFilter extends StatelessWidget {
  const CategoriesFilter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
          border: Border.all(width: 1,),
          borderRadius: BorderRadius.circular(10)
      ),
      margin: EdgeInsets.symmetric(horizontal: 30,vertical: 8),
      width: double.infinity,
      child: DropdownButtonHideUnderline(
        child: DropdownButton(
          value: "all",
          onChanged: null,
          onTap: (){},
          items: [
            DropdownMenuItem(child: Text("all"),value: "all",),
            DropdownMenuItem(child: Text("home"),value: "home",),
            DropdownMenuItem(child: Text("work"),value: "work",),
            DropdownMenuItem(child: Text("workout"),value: "workout",),
          ],
        ),
      ),
    );
  }
}
