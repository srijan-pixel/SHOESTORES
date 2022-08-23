import 'dart:convert';

import 'package:ecommerce/api/order_api.dart';
import 'package:intl/intl.dart';

import '/screens/order_details/order_details.dart';
import '/screens/orders/history_card.dart';
import 'package:flutter/material.dart';

import '/constant/color_properties.dart';
import '/utils/scroll_configuration.dart';
import '/utils/size_config.dart';

class OrderScreen extends StatelessWidget {
  static const routeName = '/orderScreen';
  const OrderScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DefaultTabController(
        length: 2,
        child: SafeArea(
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
                      'My Orders',
                      style: Theme.of(context).textTheme.headline6!,
                    ),
                  ],
                ),
                SizedBox(
                  height: SizeConfig.heightMultiplier,
                ),
                TabBar(
                  labelColor: Theme.of(context).textTheme.bodyText1!.color,
                  indicatorColor: secondaryColor,
                  indicatorSize: TabBarIndicatorSize.tab,
                  indicatorWeight: SizeConfig.textMultiplier * 0.4,
                  onTap: (index) {},
                  tabs: const [
                    Tab(
                      icon: Text(
                        'Pending',
                      ),
                    ),
                    Tab(
                      icon: Text(
                        'Completed',
                      ),
                    ),
                  ],
                ),
                Expanded(
                  child: ScrollConfiguration(
                    behavior: MyBehavior(),
                    child: TabBarView(
                      children: [
                        pendingOrders(context),
                        completedOrders(context),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget pendingOrders(BuildContext context) {
    return FutureBuilder(
      future: OrderApi().getOrders(),
      builder: (context, AsyncSnapshot<dynamic> snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return ListView.separated(
            itemBuilder: (context, index) =>
                snapshot.data![index]['isDelivered'] == false
                    ? OrderCard(
                        date: DateFormat('yyyy-MM-dd')
                            .parse(snapshot.data![index]['createdAt'])
                            .toString()
                            .split(" ")[0],
                        orderId: snapshot.data![index]['_id'],
                        charge: snapshot.data![index]['taxPrice'].toString(),
                        price: snapshot.data![index]['totalPrice'].toString(),
                        address:
                            "${snapshot.data![index]['shippingAddress']['address']}, ${snapshot.data![index]['shippingAddress']['city']}",
                        title: "My Order",
                        items: snapshot.data![index]['orderItems'],
                        shipping:
                            snapshot.data![index]['shippingPrice'].toString(),
                        backGround: colorWhite,
                      )
                    : Container(),
            itemCount: snapshot.data.length,
            padding:
                EdgeInsets.symmetric(vertical: SizeConfig.heightMultiplier),
            separatorBuilder: (_, index) =>
                snapshot.data![index]['isDelivered'] == false
                    ? SizedBox(
                        height: SizeConfig.heightMultiplier,
                      )
                    : Container(),
          );
        }
        return const Center(child: CircularProgressIndicator());
      },
    );
  }

  Widget completedOrders(BuildContext context) {
    return FutureBuilder(
      future: OrderApi().getOrders(),
      builder: (context, AsyncSnapshot<dynamic> snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return ListView.separated(
            itemBuilder: (context, index) =>
                snapshot.data![index]['isDelivered'] == true
                    ? OrderCard(
                        date: DateFormat('yyyy-MM-dd')
                            .parse(snapshot.data![index]['createdAt'])
                            .toString()
                            .split(" ")[0],
                        charge: snapshot.data![index]['taxPrice'].toString(),
                        orderId: snapshot.data![index]['_id'],
                        price: snapshot.data![index]['totalPrice'].toString(),
                        address:
                            "${snapshot.data![index]['shippingAddress']['address']}, ${snapshot.data![index]['shippingAddress']['city']}",
                        items: snapshot.data![index]['orderItems'],
                        shipping:
                            snapshot.data![index]['shippingPrice'].toString(),
                        title: "My Order",
                        backGround: colorWhite,
                      )
                    : Container(),
            itemCount: snapshot.data.length,
            padding:
                EdgeInsets.symmetric(vertical: SizeConfig.heightMultiplier),
            separatorBuilder: (_, index) =>
                snapshot.data![index]['isDelivered'] == true
                    ? SizedBox(
                        height: SizeConfig.heightMultiplier,
                      )
                    : Container(),
          );
        }
        return const Center(child: CircularProgressIndicator());
      },
    );
  }
}
