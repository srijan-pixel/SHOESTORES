import 'package:cached_network_image/cached_network_image.dart';
import '/utils/size_config.dart';
import 'package:flutter/material.dart';

class NotificationTile extends StatelessWidget {
  final String? imageUrl;
  final String? title;
  final String? subTitle;
  const NotificationTile({Key? key, this.imageUrl, this.subTitle, this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          height: SizeConfig.heightMultiplier * 8,
          width: SizeConfig.heightMultiplier * 10,
          child: CachedNetworkImage(
            imageUrl: imageUrl!,
            fit: BoxFit.fill,
            placeholder: (context, string) {
              return const Icon(
                Icons.person_outline,
              );
            },
          ),
        ),
        SizedBox(
          width: SizeConfig.widthMultiplier * 5,
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title!,
                style: Theme.of(context).textTheme.subtitle1,
              ),
              SizedBox(
                height: SizeConfig.widthMultiplier,
              ),
              Text(
                subTitle!,
                style: Theme.of(context).textTheme.subtitle2,
              ),
            ],
          ),
        )
      ],
    );
  }
}
