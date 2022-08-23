
// ignore_for_file: deprecated_member_use

import 'package:ecommerce/constant/color_properties.dart';
import 'package:ecommerce/constant/constants.dart';
import 'package:ecommerce/widgets/card_background.dart';
import 'package:ecommerce/widgets/card_type.dart';
import 'package:ecommerce/widgets/credit_card.dart';
import 'package:ecommerce/widgets/defaultAppBar.dart';
import 'package:ecommerce/widgets/defaultBackButton.dart';
import 'package:ecommerce/widgets/sticky_label.dart';
import 'package:flutter/material.dart';

class PaymentDetails extends StatefulWidget {
  const PaymentDetails({Key? key}) : super(key: key);

  @override
  _PaymentDetailsState createState() => _PaymentDetailsState();
}

class _PaymentDetailsState extends State<PaymentDetails> {
  String cardNumber = "5450 7879 4864 7854",
      cardExpiry = "10/25",
      cardHolderName = "John Travolta",
      bankName = "ICICI Bank",
      cvv = "456";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kWhiteColor,
      appBar: const DefaultAppBar(
        title: "Payment Details",
        child: DefaultBackButton(),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            CreditCard(
              cardNumber: cardNumber,
              cardExpiry: cardExpiry,
              cardHolderName: cardHolderName,
              bankName: bankName,
              cvv: cvv,
              // showBackSide: true,
              frontBackground: CardBackgrounds.black,
              backBackground: CardBackgrounds.white,
              cardType: CardType.masterCard,
              showShadow: true,
            ),
            const StickyLabel(text: "Card Information"),
            const SizedBox(height: 8.0),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 24.0),
              decoration: BoxDecoration(
                color: kWhiteColor,
                border: Border.all(
                  width: 0.5,
                  color: kLightColor,
                ),
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 24.0,
                      vertical: 8.0,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const[
                        Text("My Perosnal Card",
                            style: TextStyle(fontSize: 18.0)),
                        SizedBox(
                            width: 60.0,
                            child: Icon(Icons.payment,
                                color: kPrimaryColor, size: 40.0)),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "Card Number",
                              style: TextStyle(
                                fontSize: 16.0,
                                color: kLightColor,
                              ),
                            ),
                            Text(
                              cardNumber,
                              style: const TextStyle(fontSize: 16.0),
                            ),
                          ],
                        ),
                        SizedBox(
                          width: 45.0,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                "Exp.",
                                style: TextStyle(
                                  fontSize: 16.0,
                                  color: kLightColor,
                                ),
                              ),
                              Text(
                                cardExpiry,
                                style: const TextStyle(fontSize: 16.0),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 24.0,
                      vertical: 8.0,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "Card Name",
                              style: TextStyle(
                                fontSize: 16.0,
                                color: kLightColor,
                              ),
                            ),
                            Text(
                              cardHolderName,
                              style: const TextStyle(fontSize: 16.0),
                            ),
                          ],
                        ),
                        SizedBox(
                          width: 45.0,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                "CVV",
                                style: TextStyle(
                                  fontSize: 16.0,
                                  color: kLightColor,
                                ),
                              ),
                              Text(
                                cvv,
                                style: const TextStyle(fontSize: 16.0),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 48.0,
                    width: MediaQuery.of(context).size.width,
                    child: FlatButton(
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(10.0),
                          bottomRight: Radius.circular(10.0),
                        ),
                      ),
                      color: kDarkColor.withOpacity(0.2),
                      child: const Text(
                        "Edit Detail",
                        style: TextStyle(fontSize: 16.0),
                      ),
                      // ignore: avoid_print
                      onPressed: () => print("Edit Detail"),
                    ),
                  ),
                ],
              ),
            ),
            const StickyLabel(text: "Transaction Details"),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 8.0),
              padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
              decoration: BoxDecoration(
                color: kWhiteColor,
                border: Border.all(
                  width: 0.5,
                  color: kLightColor,
                ),
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: ListView.separated(
                shrinkWrap: true,
                itemCount: paymentDetailList.length,
                itemBuilder: (context, index) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        paymentDetailList[index].date.toString(),
                        style: const TextStyle(
                          fontSize: 16.0,
                          color: kLightColor,
                        ),
                      ),
                      SizedBox(
                        width: 190.0,
                        child: Text(
                          paymentDetailList[index].details.toString(),
                          style: const TextStyle(fontSize: 16.0),
                        ),
                      ),
                      SizedBox(
                        width: 70.0,
                        child: Text(
                          "\$ ${paymentDetailList[index].amount}",
                          style: TextStyle(
                            fontSize: 16.0,
                            color: paymentDetailList[index].textColor,
                          ),
                        ),
                      ),
                    ],
                  );
                },
                separatorBuilder: (context, index) {
                  return const Divider(
                    thickness: 0.5,
                    color: kLightColor,
                  );
                },
              ),
            ),
            const SizedBox(height: 8.0),
          ],
        ),
      ),
    );
  }
}
