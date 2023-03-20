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
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("don't have an account ?"),
                TextButton(
                    onPressed: () {},
                    child: Text(
                      "Register or Sign-in",
                    )),
                SizedBox(
                  height: 40,
                ),
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //   children: [
                //     Text(
                //       "Language",
                //     ),
                //     ToggleSwitch(
                //       minHeight: 30,
                //       minWidth: 60.0,
                //       initialLabelIndex: 0,
                //       cornerRadius: 25.0,
                //       borderWidth: 1.0,
                //       //borderColor: [AppColors.primary],
                //       totalSwitches: 2,
                //       labels: ['Eng', 'عربي'],
                //       activeFgColor: Colors.white,
                //       //activeBgColors: [[AppColors.primary],[AppColors.primary]],
                //       //inactiveFgColor: AppColors.primary,
                //       inactiveBgColor: Colors.white,
                //       onToggle: (index) {
                //         print('switched to: $index');
                //       },
                //     ),
                //   ],
                // ),
                // SizedBox(
                //   height: 30,
                // ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Mode",
                    ),
                    IconButton(
                      onPressed:() => AppThemes.changeTheme(),
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
                      "About",
                    ),
                    Icon(
                      Icons.arrow_forward_ios_rounded,
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
                    )),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
