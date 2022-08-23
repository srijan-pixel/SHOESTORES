import 'package:flutter/material.dart';

import '/constant/color_properties.dart';
import '/utils/size_config.dart';
import '../../../constant/constants.dart';
import '../../models/product.dart';

class ProductImages extends StatefulWidget {
  const ProductImages({
    Key? key,
    required this.product,
  }) : super(key: key);

  final Products product;

  @override
  _ProductImagesState createState() => _ProductImagesState();
}

class _ProductImagesState extends State<ProductImages> {
  int selectedImage = 0;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: SizeConfig.heightMultiplier * 100,
          child: AspectRatio(
            aspectRatio: 1,
            child: Hero(
              tag: widget.product.id.toString(),
              child: Image.network(widget.product.image,),
            ),
          ),
        ),
      ],
    );
  }

  GestureDetector buildSmallProductPreview(int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedImage = index;
        });
      },
      child: AnimatedContainer(
        duration: defaultDuration,
        margin: EdgeInsets.only(
          right: SizeConfig.heightMultiplier * 2,
        ),
        padding: EdgeInsets.all(SizeConfig.heightMultiplier),
        height: SizeConfig.heightMultiplier * 6,
        width: SizeConfig.heightMultiplier * 6,
        decoration: BoxDecoration(
          color: Theme.of(context).primaryColorDark,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
              color:
                  secondaryColor.withOpacity(selectedImage == index ? 1 : 0)),
        ),
        child: Image.asset(widget.product.image),
      ),
    );
  }
}
