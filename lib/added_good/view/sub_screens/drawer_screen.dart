import 'package:added_good/core/styles/app_themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:toggle_switch/toggle_switch.dart';

import '../../../core/styles/app_colors.dart';

class DrawerScreen extends StatelessWidget {
  const DrawerScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 60, left: 15, right: 15, bottom: 30),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            child: Column(
              children: [
                ElevatedButton(
                    onPressed: () {},
                    child: Text(
                      "Register or Sign-in",
                      style: TextStyle(fontSize: 16),
                    )),
                SizedBox(
                  height: 40,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Language",
                      style: TextStyle(fontSize: 16,color: AppColors.primary),
                    ),
                    ToggleSwitch(
                      minHeight: 30,
                      minWidth: 60.0,
                      initialLabelIndex: 0,
                      cornerRadius: 25.0,
                      borderWidth: 1.0,
                      borderColor: [AppColors.primary],
                      totalSwitches: 2,
                      labels: ['Eng', 'عربي'],
                      activeFgColor: Colors.white,
                      activeBgColors: [[AppColors.primary],[AppColors.primary]],
                      inactiveFgColor: AppColors.primary,
                      inactiveBgColor: Colors.white,
                      onToggle: (index) {
                        print('switched to: $index');
                      },
                    ),
                  ],
                ),
                SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Mode",
                      style: TextStyle(fontSize: 16,color: AppColors.primary),
                    ),
                    IconButton(
                      onPressed:() => AppThemes().changeTheme(),
                      icon: Icon(Icons.nightlight_round)
                    )
                  ],
                ),
                SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Change Color",
                      style: TextStyle(fontSize: 16,color: AppColors.primary),
                    ),
                    Container(
                      height: 30,
                      width: 30,
                      child: ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(AppColors.primary),
                        ),
                        child: null,
                        onPressed: (){},
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "About",
                      style: TextStyle(fontSize: 16,color: AppColors.primary),
                    ),
                    Icon(
                      Icons.arrow_forward_ios_rounded,
                      color: AppColors.primary,
                    ),
                  ],
                ),
              ],
            ),
          ),
          Container(
            child: Column(
              children: [
                ElevatedButton(
                    onPressed: () {},
                    child: Text(
                      "log out",
                      style: TextStyle(fontSize: 16),
                    )),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
