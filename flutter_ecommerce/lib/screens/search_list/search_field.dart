import 'dart:developer';

import '/screens/search_list/search_screen.dart';

import '/screens/search_list/search_result.dart';

import '/constant/color_properties.dart';
import '/models/product.dart';
import '/providers/product_provider.dart';
import '/screens/details/details_screen.dart';
import '/utils/size_config.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SearchField extends StatelessWidget {
  const SearchField({
    this.value,
    this.autoFocus = true,
    this.isSearchScreen = true,
    Key? key,
  }) : super(key: key);

  final String? value;
  final bool autoFocus;
  final bool isSearchScreen;

  @override
  Widget build(BuildContext context) {
    return Autocomplete<Products>(
      optionsViewBuilder: (context, function, products) {
        return Scaffold(
            body: Container(
          width: double.infinity,
          margin: EdgeInsets.zero,
          padding: EdgeInsets.zero,
          child: ListView.separated(
              padding: EdgeInsets.zero,
              itemCount: products.length,
              separatorBuilder: (c, i) {
                return Divider(
                  height: 1,
                  color: colorGrey,
                  endIndent: SizeConfig.widthMultiplier * 25,
                );
              },
              itemBuilder: (c, i) {
                return ListTile(
                  onTap: () => Navigator.pushNamed(
                    context,
                    DetailsScreen.routeName,
                    arguments:
                        ProductDetailsArguments(product: products.toList()[i]),
                  ),
                  title: Text(products.toList()[i].name),
                );
              }),
        ));
      },
      fieldViewBuilder: (context, controller, focusNode, function) {
        controller.text = value ?? "";
        return TextFormField(
            controller: controller,
            autofocus: autoFocus,
            focusNode: focusNode,
            onTap: () {
              log(value.toString());
              if (isSearchScreen) {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                    builder: (_) => SearchScreen(
                      autoFocus: true,
                      value: controller.text,
                    ),
                  ),
                );
              }
            },
            decoration: InputDecoration(
              contentPadding: EdgeInsets.symmetric(
                  vertical: 0, horizontal: SizeConfig.widthMultiplier * 2),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(
                  SizeConfig.imageSizeMultiplier * 6,
                ),
                borderSide: BorderSide.none,
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(
                  SizeConfig.imageSizeMultiplier * 6,
                ),
                borderSide: BorderSide.none,
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(
                  SizeConfig.imageSizeMultiplier * 6,
                ),
                borderSide: BorderSide.none,
              ),
              fillColor: Theme.of(context).primaryColor.withOpacity(0.05),
              filled: true,
              // isDense: true,
              hintText: "Search product",
            ),
            textInputAction: TextInputAction.search,
            onFieldSubmitted: (newValue) {
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                  builder: (_) => SearchResultScreen(
                    newValue,
                  ),
                ),
              );
            });
      },
      optionsBuilder: (TextEditingValue textEditingValue) {
        if (textEditingValue.text == '') {
          return const Iterable<Products>.empty();
        }
        Provider.of<ProductProvider>(context, listen: false)
            .searchProducts(textEditingValue.text.trim());

        return Provider.of<ProductProvider>(context, listen: false)
            .searchedProducts;
      },
    );
  }
}
