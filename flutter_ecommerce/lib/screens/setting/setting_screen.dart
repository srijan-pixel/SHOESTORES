
import '/providers/customer_provider.dart';
import 'package:image_picker/image_picker.dart';

import '/screens/profile/edit_profile_screen.dart';

import 'package:ecommerce/providers/theme_provider.dart';
import 'package:ecommerce/screens/orders/order_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '/constant/color_properties.dart';
import '/screens/profile/edit_profile_screen.dart';
import '/screens/sign_in/sign_in_screen.dart';
import '/utils/scroll_configuration.dart';
import '/utils/size_config.dart';

class SettingScreen extends StatelessWidget {
  static const String routeName = "/setting";

  const SettingScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<ThemeProvider>(
      context,
    );
    return Scaffold(
      body: SafeArea(
        child: ScrollConfiguration(
          behavior: MyBehavior(),
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: SizeConfig.heightMultiplier * 2,
                ),
                const Center(child: ProfilePic()),
                SizedBox(
                  height: SizeConfig.heightMultiplier * 3,
                ),
                ProfileMenu(
                  text: "My Account",
                  icon: Icons.person_outline,
                  press: () {
                    Navigator.of(context)
                        .pushNamed(EditProfileScreen.routeName);
                  },
                ),
                ProfileMenu(
                  text: "My Orders",
                  icon: Icons.toc_outlined,
                  press: () {
                    Navigator.pushNamed(context, OrderScreen.routeName);
                  },
                ),
                ProfileMenu(
                  text: "Theme",
                  icon: Icons.brightness_6_outlined,
                  press: () {
                    changeTheme(context, controller);
                  },
                ),
                ProfileMenu(
                  text: "Contacts Us",
                  icon: Icons.help_outline,
                  press: () {},
                ),
                ProfileMenu(
                  text: "Log Out",
                  icon: Icons.logout_outlined,
                  press: () {
                    Navigator.of(context).pushNamed(
                      SignInScreen.routeName,
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  changeTheme(context, controller) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      isDismissible: false,
      enableDrag: false,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(
          SizeConfig.imageSizeMultiplier,
        ),
      ),
      builder: (_) {
        return AnimatedBuilder(
          animation: controller,
          builder: (context, child) {
            return Container(
              width: double.infinity,
              margin: EdgeInsets.symmetric(
                horizontal: SizeConfig.heightMultiplier * 2,
                vertical: SizeConfig.heightMultiplier,
              ),
              decoration: BoxDecoration(
                borderRadius:
                    BorderRadius.circular(SizeConfig.imageSizeMultiplier),
                color: Theme.of(context).primaryColorDark,
              ),
              child: Padding(
                padding: EdgeInsets.all(SizeConfig.heightMultiplier),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'Change Theme',
                          style: Theme.of(context).textTheme.headline6,
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Material(
                            color: Colors.red,
                            borderRadius: BorderRadius.circular(
                                SizeConfig.imageSizeMultiplier),
                            child: Padding(
                              padding: EdgeInsets.all(
                                  SizeConfig.imageSizeMultiplier),
                              child: const Icon(
                                Icons.close,
                                color: colorWhite,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const Divider(),
                    ListTile(
                      title: Text(
                        "Light",
                        style: Theme.of(context).textTheme.bodyText1,
                      ),
                      selected: controller!.themeMode == ThemeMode.light,
                      onTap: () {
                        controller?.updateThemeMode(ThemeMode.light);
                        Navigator.pop(context);
                      },
                      trailing: Icon(
                        controller!.themeMode == ThemeMode.light
                            ? Icons.check_circle
                            : null,
                        color: secondaryColor,
                        // size: 28.0,
                      ),
                    ),
                    ListTile(
                      title: Text(
                        'Dark',
                        style: Theme.of(context).textTheme.bodyText1,
                      ),
                      selected: controller!.themeMode == ThemeMode.dark,
                      onTap: () {
                        controller!.updateThemeMode(ThemeMode.dark);
                        Navigator.pop(context);
                      },
                      trailing: Icon(
                        controller!.themeMode == ThemeMode.dark
                            ? Icons.check_circle
                            : null,
                        color: secondaryColor,
                        // size: 28.0,
                      ),
                    ),
                    ListTile(
                      title: Text(
                        'Default',
                        style: Theme.of(context).textTheme.bodyText1,
                      ),
                      selected: controller!.themeMode == ThemeMode.system,
                      onTap: () {
                        controller!.updateThemeMode(ThemeMode.system);
                        Navigator.pop(context);
                      },
                      trailing: Icon(
                        controller!.themeMode == ThemeMode.system
                            ? Icons.check_circle
                            : null,
                        color: secondaryColor,
                        // size: 28.0,
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }
}

class ProfileMenu extends StatelessWidget {
  const ProfileMenu({
    Key? key,
    required this.text,
    required this.icon,
    this.press,
  }) : super(key: key);

  final String text;
  final IconData icon;
  final VoidCallback? press;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: SizeConfig.heightMultiplier * 2.5,
        vertical: SizeConfig.heightMultiplier * .8,
      ),
      child: ListTile(
        tileColor: Theme.of(context).primaryColorDark,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            SizeConfig.heightMultiplier * 2,
          ),
        ),
        onTap: press,
        leading: Icon(
          icon,
          color: Theme.of(context).textTheme.headline1!.color,
          size: SizeConfig.imageSizeMultiplier * 7,
        ),
        title: Text(
          text,
          style: Theme.of(context).textTheme.bodyText1!.copyWith(
                fontSize: SizeConfig.textMultiplier * 2,
              ),
        ),
        trailing: Icon(
          Icons.arrow_forward_ios,
          color: Theme.of(context).textTheme.headline1!.color,
          size: SizeConfig.imageSizeMultiplier * 5,
        ),
      ),
    );
  }
}

class ProfilePic extends StatelessWidget {
  const ProfilePic({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<CustomerProvider>(
      builder: (_, value, __) {
        return Column(
          children: [
            SizedBox(
              height: SizeConfig.heightMultiplier * 15,
              width: SizeConfig.heightMultiplier * 15,
              child: CircleAvatar(
                              backgroundColor: secondaryColor,
                              child: Icon(
                                Icons.person,
                                size: SizeConfig.imageSizeMultiplier * 20,
                                color: canvasColor,
                              ),
                            ),
            ),
            SizedBox(
              height: SizeConfig.heightMultiplier,
            ),
            Text(
              value.customer!.name,
              style: Theme.of(context).textTheme.bodyText1,
            ),
            Text(
              value.customer!.email,
              style: Theme.of(context).textTheme.bodyText2,
            ),
          ],
        );
      }
    );
  }

  // showModal(con) async {
  //   final ImagePicker _picker = ImagePicker();
  //   await showModalBottomSheet(
  //       backgroundColor: Colors.transparent,
  //       isScrollControlled: true,
  //       enableDrag: false,
  //       isDismissible: false,
  //       shape: RoundedRectangleBorder(
  //         borderRadius: BorderRadius.circular(
  //           SizeConfig.imageSizeMultiplier,
  //         ),
  //       ),
  //       context: con,
  //       builder: (context) {
  //         return StatefulBuilder(
  //             builder: (BuildContext context, StateSetter setState) {
  //           return Container(
  //             width: double.infinity,
  //             margin: EdgeInsets.symmetric(
  //               horizontal: SizeConfig.heightMultiplier * 2,
  //               vertical: SizeConfig.heightMultiplier * 2,
  //             ),
  //             padding: EdgeInsets.all(SizeConfig.heightMultiplier),
  //             decoration: BoxDecoration(
  //               borderRadius:
  //                   BorderRadius.circular(SizeConfig.imageSizeMultiplier),
  //               color: Theme.of(context).primaryColorDark,
  //             ),
  //             child: Column(
  //               mainAxisSize: MainAxisSize.min,
  //               crossAxisAlignment: CrossAxisAlignment.start,
  //               children: [
  //                 Row(
  //                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //                   crossAxisAlignment: CrossAxisAlignment.center,
  //                   children: [
  //                     Text(
  //                       'Choose a source',
  //                       style: Theme.of(context).textTheme.headline6,
  //                     ),
  //                     InkWell(
  //                       onTap: () {
  //                         Navigator.pop(context);
  //                       },
  //                       child: Material(
  //                         color: Colors.red,
  //                         borderRadius: BorderRadius.circular(
  //                             SizeConfig.imageSizeMultiplier),
  //                         child: Padding(
  //                           padding:
  //                               EdgeInsets.all(SizeConfig.imageSizeMultiplier),
  //                           child: const Icon(
  //                             Icons.close,
  //                             color: colorWhite,
  //                           ),
  //                         ),
  //                       ),
  //                     ),
  //                   ],
  //                 ),
  //                 const Divider(),
  //                 ListTile(
  //                   leading: const Icon(
  //                     Icons.camera_outlined,
  //                   ),
  //                   title: Text(
  //                     "Camera",
  //                     style: Theme.of(context).textTheme.bodyText1,
  //                   ),
  //                   onTap: () async {
  //                     // Navigator.of(context).pop();
  //                     final file =
  //                         await _picker.pickImage(source: ImageSource.camera);
  //                     if (file != null) {
  //                       Provider.of<CustomerProvider>(context, listen: false)
  //                           .addPicture(await file.readAsBytes());
  //                     }
  //                     Navigator.of(context).pop();
  //                   },
  //                 ),
  //                 ListTile(
  //                   leading: const Icon(Icons.collections_outlined),
  //                   title: Text(
  //                     "Gallery",
  //                     style: Theme.of(context).textTheme.bodyText1,
  //                   ),
  //                   onTap: () async {
  //                     final file =
  //                         await _picker.pickImage(source: ImageSource.gallery);
  //                     if (file != null) {
  //                       await Provider.of<CustomerProvider>(context,
  //                               listen: false)
  //                           .addPicture(await file.readAsBytes());
  //                     }
  //                     Navigator.of(context).pop();
  //                   },
  //                 ),
  //               ],
  //             ),
  //           );
  //         });
  //       });
  // }

}
