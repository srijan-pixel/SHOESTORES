import '/providers/product_provider.dart';
import 'package:provider/provider.dart';

import '/screens/home/section_title.dart';
import '/utils/size_config.dart';
import '/widgets/product_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class StaggeredGridListView extends StatefulWidget {
  const StaggeredGridListView({Key? key}) : super(key: key);

  @override
  State<StaggeredGridListView> createState() => _StaggeredGridListViewState();
}

class _StaggeredGridListViewState extends State<StaggeredGridListView> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding:
              EdgeInsets.symmetric(horizontal: SizeConfig.heightMultiplier * 2),
          child: SectionTitle(title: "Today's SpecialOffers", press: () {}),
        ),
        SizedBox(
          height: SizeConfig.heightMultiplier,
        ),
        Consumer<ProductProvider>(builder: (_, data, __) {
          print(data.products.length.toString() + "is the length");
          return StaggeredGridView.countBuilder(
            crossAxisCount: 2,
            shrinkWrap: true,
            physics: const ClampingScrollPhysics(),
            itemCount: data.products.length,
            mainAxisSpacing: SizeConfig.heightMultiplier * 2,
            crossAxisSpacing: SizeConfig.heightMultiplier * 2,
            padding: EdgeInsets.symmetric(
              horizontal: SizeConfig.heightMultiplier * 2,
            ),
            itemBuilder: (context, index) {
              return ProductCard(product: data.products[index]);
            },
            staggeredTileBuilder: (index) => const StaggeredTile.fit(1),
          );
        }),
      ],
    );
  }
}
