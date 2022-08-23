import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '/constant/color_properties.dart';
import '/utils/size_config.dart';

class OrderDetail extends StatelessWidget {
  OrderDetail({Key? key, required this.details}) : super(key: key);

  final dynamic details;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: SizeConfig.heightMultiplier * 2,
          vertical: SizeConfig.heightMultiplier,
        ),
        child: Material(
          child: CustomScrollView(
            physics: const BouncingScrollPhysics(),
            slivers: [
              SliverAppBar(
                backgroundColor: Theme.of(context).canvasColor,
                leading: Padding(
                  padding: EdgeInsets.all(
                    SizeConfig.heightMultiplier,
                  ),
                  child: CircleAvatar(
                    backgroundColor: Theme.of(context).primaryColorDark,
                    foregroundColor:
                        Theme.of(context).textTheme.headline6!.color,
                    child: IconButton(
                      icon: const Icon(Icons.chevron_left),
                      onPressed: () => Navigator.of(context).pop(),
                    ),
                  ),
                ),
                title: Text(
                  'My Orders',
                  style: Theme.of(context).textTheme.headline6!,
                ),
              ),
              SliverFillRemaining(
                fillOverscroll: true,
                hasScrollBody: true,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: SizeConfig.heightMultiplier,
                    ),
                    Material(
                      color: Theme.of(context).primaryColorDark,
                      borderRadius: BorderRadius.circular(
                        SizeConfig.heightMultiplier * 2,
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(SizeConfig.heightMultiplier),
                        child: Column(
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Material(
                                  color: Theme.of(context).primaryColorLight,
                                  borderRadius: BorderRadius.circular(
                                    SizeConfig.heightMultiplier,
                                  ),
                                  child: Padding(
                                    padding: EdgeInsets.all(
                                        SizeConfig.heightMultiplier),
                                    child: const Icon(
                                      CupertinoIcons.gift_alt,
                                      color: secondaryColor,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: SizeConfig.heightMultiplier,
                                ),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        details['date'],
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyText1,
                                      ),
                                      SizedBox(
                                        height:
                                            SizeConfig.heightMultiplier * .5,
                                      ),
                                      Text(
                                        details['orderId'],
                                        style: Theme.of(context)
                                            .textTheme
                                            .subtitle2!
                                            .copyWith(
                                              color: colorLightGrey,
                                            ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: SizeConfig.heightMultiplier * .5,
                            ),
                            Row(
                              children: [
                                Padding(
                                  padding: EdgeInsets.all(
                                      SizeConfig.heightMultiplier),
                                  child: const Icon(
                                    Icons.place,
                                    color: secondaryColor,
                                  ),
                                ),
                                SizedBox(
                                  width: SizeConfig.widthMultiplier,
                                ),
                                Text(
                                  details['address'],
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyText1!
                                      .copyWith(),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: SizeConfig.heightMultiplier,
                    ),
                    SizedBox(
                      height: SizeConfig.heightMultiplier,
                    ),
                    Material(
                      color: Theme.of(context).primaryColorDark,
                      borderRadius: BorderRadius.circular(
                        SizeConfig.heightMultiplier * 2,
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(
                          SizeConfig.heightMultiplier * 2,
                        ),
                        child: Table(
                          textDirection: TextDirection.ltr,
                          children:[ 
                            customTableRow(context, 'VAT', details['charge']),
                            customTableRow(context, 'Shipping Charge', details['shipping']),
                            customTableRow(context, 'Total Amount', details['price']),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: SizeConfig.heightMultiplier,
                    ),
                    Material(
                      color: Theme.of(context).primaryColorDark,
                      borderRadius: BorderRadius.circular(
                        SizeConfig.heightMultiplier * 2,
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(SizeConfig.heightMultiplier),
                        child: Theme(
                          data: Theme.of(context)
                              .copyWith(dividerColor: Colors.transparent),
                          child: ExpansionTile(
                            collapsedIconColor: colorLightGrey,
                            maintainState: true,
                            title: Text(
                              'Electronics',
                              style: Theme.of(context).textTheme.headline6,
                            ),
                            children: List.generate(
                                3,
                                (e) => Padding(
                                      padding: EdgeInsets.symmetric(
                                        vertical: SizeConfig.heightMultiplier,
                                      ),
                                      child: productDetailCard(context),
                                    )).toList(),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    ));
  }

  TableRow customTableRow(BuildContext context, String title, String value) {
    return TableRow(children: [
      Text(
       title,
        style: Theme.of(context).textTheme.bodyText2,
        textScaleFactor: 1.1,
      ),
      Text(
        value,
        textAlign: TextAlign.end,
        style: Theme.of(context).textTheme.bodyText1,
        textScaleFactor: 1.1,
      ),
    ]);
  }

  Widget productDetailCard(BuildContext context) {
    return ListTile(
      tileColor: Theme.of(context).primaryColorLight,
      dense: true,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
        SizeConfig.heightMultiplier * 2,
      )),
      title: Text(
        'Wireless Controller for PS4™',
        style: Theme.of(context).textTheme.bodyText1,
      ),
      subtitle: Text(
        'x2',
        style: Theme.of(context).textTheme.subtitle1!.copyWith(
              color: secondaryColor,
            ),
      ),
      trailing: Text(
        'Rs. 123',
        style: Theme.of(context).textTheme.subtitle1!.copyWith(
              color: secondaryColor,
            ),
      ),
      leading: Material(
        color: secondaryColor.withOpacity(0.1),
        borderRadius: BorderRadius.circular(
          SizeConfig.heightMultiplier,
        ),
        child: Padding(
          padding: EdgeInsets.all(SizeConfig.heightMultiplier),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(
              SizeConfig.heightMultiplier,
            ),
            child: Image.network(
              "assets/images/ps4_console_white_1.png",
            ),
          ),
        ),
      ),
    );
  }

  final _process = [
    'Order Created',
    'Delivery Processing',
    'Confirm Delivery Man',
  ];
}
