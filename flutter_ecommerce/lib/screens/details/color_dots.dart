// import '/constant/color_properties.dart';
// import 'package:flutter/material.dart';

// import '../../models/product.dart';
// import '/utils/size_config.dart';

// class ColorDots extends StatelessWidget {
//   const ColorDots({
//     Key? key,
//     required this.product,
//     required this.quantity,
//     required this.incrementChange,
//     required this.decrementChange,
//   }) : super(key: key);

//   final Products product;
//   final int quantity;
//   final Function incrementChange;
//   final Function decrementChange;

//   @override
//   Widget build(BuildContext context) {
//     // Now this is fixed and only for demo
//     int selectedColor = 3;
//     return Padding(
//       padding: EdgeInsets.only(
//         left: SizeConfig.heightMultiplier * 2.5,
//         right: SizeConfig.heightMultiplier * 2.5,
//         bottom: SizeConfig.heightMultiplier * 1.5,
//       ),
//       child: Row(
//         children: [
//           ...List.generate(
//             product.colors.length,
//             (index) => ColorDot(
//               color: product.colors[index],
//               isSelected: index == selectedColor,
//             ),
//           ),
//           const Spacer(),
//           IconButton(
//               onPressed: () {
//                 decrementChange();
//               },
//               icon: const Icon(
//                 Icons.remove_circle,
//               )),
//           CircleAvatar(
//             backgroundColor: colorWhite,
//             radius: SizeConfig.imageSizeMultiplier * 5,
//             child: Text(
//               quantity.toString(),
//               style: Theme.of(context).textTheme.subtitle2!.copyWith(
//                     color: primaryColor,
//                   ),
//             ),
//           ),
//           IconButton(
//               onPressed: () {
//                 incrementChange();
//               },
//               icon: const Icon(Icons.add_circle)),
//         ],
//       ),
//     );
//   }
// }

// class ColorDot extends StatelessWidget {
//   const ColorDot({
//     Key? key,
//     required this.color,
//     this.isSelected = false,
//   }) : super(key: key);

//   final Color color;
//   final bool isSelected;

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       margin: const EdgeInsets.only(right: 2),
//       padding: EdgeInsets.all(SizeConfig.heightMultiplier),
//       height: SizeConfig.heightMultiplier * 5,
//       width: SizeConfig.heightMultiplier * 5,
//       decoration: BoxDecoration(
//         color: Colors.transparent,
//         border:
//             Border.all(color: isSelected ? primaryColor : Colors.transparent),
//         shape: BoxShape.circle,
//       ),
//       child: DecoratedBox(
//         decoration: BoxDecoration(
//           color: color,
//           shape: BoxShape.circle,
//         ),
//       ),
//     );
//   }
// }
