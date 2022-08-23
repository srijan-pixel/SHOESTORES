import '/constant/color_properties.dart';
import '/screens/notifications/notification_tile.dart';
import '/utils/scroll_configuration.dart';
import '/utils/size_config.dart';
import 'package:flutter/material.dart';

class NotificationScreen extends StatelessWidget {
  static const routeName = "/notifications";
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 2.5 * SizeConfig.heightMultiplier,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: SizeConfig.heightMultiplier,
              ),
              Row(
                children: [
                  CircleAvatar(
                    backgroundColor: Theme.of(context).primaryColorDark,
                    foregroundColor:
                        Theme.of(context).textTheme.headline6!.color,
                    child: IconButton(
                      icon: const Icon(Icons.chevron_left),
                      onPressed: () => Navigator.of(context).pop(),
                    ),
                  ),
                  SizedBox(
                    width: SizeConfig.widthMultiplier * 5,
                  ),
                  Text(
                    'Notifications',
                    style: Theme.of(context).textTheme.headline6!,
                  ),
                ],
              ),
              SizedBox(
                height: SizeConfig.heightMultiplier,
              ),
              Expanded(
                child: ScrollConfiguration(
                  behavior: MyBehavior(),
                  child: ListView.separated(
                    shrinkWrap: true,
                    separatorBuilder: (c, i) {
                      return SizedBox(
                        height: SizeConfig.heightMultiplier * 2,
                        child: const Divider(
                          height: 1,
                          color: colorGrey,
                        ),
                      );
                    },
                    itemCount: 20,
                    itemBuilder: (c, i) {
                      return const NotificationTile(
                        imageUrl:
                            "https://th.bing.com/th/id/R.13de25476558a5f0140d9985ab12b576?rik=JfAZ8zfwVHG4Jw&riu=http%3a%2f%2fkudlarecipes.com%2fwp-content%2fuploads%2f2018%2f03%2fChicken-Momo-Recipe.png&ehk=M2trblebPmFJc%2f02T89Gy%2bYj%2bTLKCYhDnCK3JiYwi2M%3d&risl=&pid=ImgRaw&r=0",
                        subTitle:
                            ".....",
                        title: "Chicken",
                      );
                    },
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
