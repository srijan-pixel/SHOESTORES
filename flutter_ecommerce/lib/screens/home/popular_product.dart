// import '/providers/product_provider.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';

// import '/utils/size_config.dart';
// import '/widgets/product_card.dart';
// import 'section_title.dart';

// class PopularProducts extends StatelessWidget {
//   const PopularProducts({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         Padding(
//           padding: EdgeInsets.symmetric(
//             horizontal: SizeConfig.heightMultiplier * 2,
//           ),
//           child: SectionTitle(title: "Popular Products", press: () {}),
//         ),
//         SizedBox(
//           height: SizeConfig.heightMultiplier,
//         ),
//         SingleChildScrollView(
//           scrollDirection: Axis.horizontal,
//           child: Padding(
//             padding: EdgeInsets.symmetric(
//               horizontal: SizeConfig.heightMultiplier,
//             ),
//             child: Consumer<ProductProvider>(builder: (_, data, __) {
//               return Row(
//                 children: [
//                   ...List.generate(
//                     data.products.length,
//                     (index) {
//                       if (data.products[index].) {
//                         return Padding(
//                           padding: EdgeInsets.symmetric(
//                             horizontal: SizeConfig.heightMultiplier,
//                           ),
//                           child: ProductCard(
//                             product: data.products[index],
//                             category: "popular",
//                           ),
//                         );
//                       }
//                       return const SizedBox
//                           .shrink(); // here by default width and height is 0
//                     },
//                   ),
//                 ],
//               );
//             }),
//           ),
//         )
//       ],
//     );
//   }
// }
