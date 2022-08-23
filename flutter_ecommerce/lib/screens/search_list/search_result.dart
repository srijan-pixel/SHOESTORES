import 'dart:developer';

import 'package:ecommerce/constant/color_properties.dart';
import 'package:ecommerce/models/product.dart';
import 'package:ecommerce/screens/home/icon_btn_with_counter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:provider/provider.dart';

import '/providers/product_provider.dart';
import '/screens/search_list/search_field.dart';
import '/screens/search_list/search_screen.dart';
import '/utils/size_config.dart';
import '/widgets/product_card.dart';

class SearchResultScreen extends StatefulWidget {
  static const routeName = "/searchResult";
  const SearchResultScreen(this.searchValue, {Key? key}) : super(key: key);

  final String searchValue;

  @override
  State<SearchResultScreen> createState() => _SearchResultScreenState();
}

class _SearchResultScreenState extends State<SearchResultScreen> {
  RangeValues values = const RangeValues(1, 100);
  RangeLabels labels = const RangeLabels("1", "100");

  @override
  Widget build(BuildContext context) {
    Provider.of<ProductProvider>(context, listen: false)
        .searchProducts(widget.searchValue);
    return WillPopScope(
      onWillPop: () {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (_) => SearchScreen(
              autoFocus: true,
              value: widget.searchValue,
            ),
          ),
        );
        return Future.value(true);
      },
      child: Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: SizeConfig.heightMultiplier * 1,
                ),
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
                            Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                builder: (_) => SearchScreen(
                                  autoFocus: true,
                                  value: widget.searchValue,
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                      SizedBox(
                        width: SizeConfig.widthMultiplier * 2,
                      ),
                      Expanded(
                        child: SearchField(
                          value: widget.searchValue,
                          autoFocus: false,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: SizeConfig.heightMultiplier * 2,
                ),
                getSearchProducts(
                  context,
                  widget.searchValue,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  filterDecorated() async {
    await showModalBottomSheet(
        backgroundColor: Colors.transparent,
        isScrollControlled: true,
        enableDrag: false,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            SizeConfig.imageSizeMultiplier,
          ),
        ),
        context: context,
        builder: (context) {
          return StatefulBuilder(
              builder: (BuildContext context, StateSetter setState) {
            return Container(
              width: double.infinity,
              margin: EdgeInsets.symmetric(
                horizontal: SizeConfig.heightMultiplier * 2,
                vertical: SizeConfig.heightMultiplier * 2,
              ),
              padding: EdgeInsets.all(SizeConfig.heightMultiplier),
              decoration: BoxDecoration(
                borderRadius:
                    BorderRadius.circular(SizeConfig.imageSizeMultiplier),
                color: Theme.of(context).primaryColorDark,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Price',
                    style: Theme.of(context).textTheme.subtitle1,
                  ),
                  RangeSlider(
                    values: values,
                    onChanged: (RangeValues value) {
                      setState(() {
                        values = value;
                        labels = RangeLabels(
                            "${value.start.toInt().toString()}\$",
                            "${value.end.toInt().toString()}\$");
                      });
                    },
                    divisions: 5,
                    labels: labels,
                    min: 1,
                    max: 100,
                    inactiveColor: Theme.of(context).primaryColorDark,
                    activeColor: secondaryColor,
                  ),
                  SizedBox(
                    height: SizeConfig.heightMultiplier,
                  ),
                  Center(
                    child: ElevatedButton(
                      child: const Text(
                        'Search',
                      ),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                  ),
                ],
              ),
            );
          });
        });
  }

  Widget getSearchProducts(BuildContext context, String name) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: SizeConfig.heightMultiplier,
        ),
        Padding(
          padding:
              EdgeInsets.symmetric(horizontal: SizeConfig.heightMultiplier * 2),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Search results for $name",
                style: Theme.of(context).textTheme.bodyText1,
              ),
              IconBtnWithCounter(
                icon: const Icon(Icons.filter_list),
                press: () async {
                  await filterDecorated();
                  log(values.toString());
                  Provider.of<ProductProvider>(context, listen: false)
                      .filterProductByPrice(
                    widget.searchValue,
                    values.start,
                    values.end,
                  );
                },
              ),
            ],
          ),
        ),
        SizedBox(
          height: SizeConfig.heightMultiplier * 2,
        ),
        Consumer<ProductProvider>(builder: (_, data, __) {
          return StaggeredGridView.countBuilder(
            crossAxisCount: 2,
            shrinkWrap: true,
            physics: const ClampingScrollPhysics(),
            itemCount: data.searchedProducts.length,
            mainAxisSpacing: SizeConfig.heightMultiplier * 2,
            crossAxisSpacing: SizeConfig.heightMultiplier * 2,
            padding: EdgeInsets.symmetric(
              horizontal: SizeConfig.heightMultiplier * 2,
            ),
            itemBuilder: (context, index) {
              return ProductCard(
                product: data.searchedProducts[index],
              );
            },
            staggeredTileBuilder: (index) => const StaggeredTile.fit(1),
          );
        }),
      ],
    );
  }
}
