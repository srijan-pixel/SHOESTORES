import 'package:flutter/material.dart';

import '/screens/search_list/search_field.dart';
import '/utils/size_config.dart';

class SearchScreen extends StatelessWidget {
  static const routeName = "/search";
  const SearchScreen({this.autoFocus = true, this.value, Key? key})
      : super(key: key);

  final bool autoFocus;
  final String? value;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                vertical: SizeConfig.heightMultiplier,
                horizontal: SizeConfig.heightMultiplier * 2,
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  CircleAvatar(
                    backgroundColor: Theme.of(context).primaryColorDark,
                    foregroundColor:
                        Theme.of(context).textTheme.headline6!.color,
                    // radius: SizeConfig.imageSizeMultiplier * 3,
                    child: IconButton(
                      icon: const Icon(Icons.chevron_left),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                  ),
                  SizedBox(
                    width: SizeConfig.widthMultiplier * 2,
                  ),
                  Expanded(
                    child: SearchField(
                      value: value ?? "",
                      autoFocus: autoFocus,
                      isSearchScreen: false,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
