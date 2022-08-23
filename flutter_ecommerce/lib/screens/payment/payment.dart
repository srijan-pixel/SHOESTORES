
import 'package:ecommerce/constant/color_properties.dart';
import 'package:ecommerce/constant/constants.dart';
import 'package:ecommerce/screens/success/success.dart';
import 'package:ecommerce/widgets/defaultAppBar.dart';
import 'package:ecommerce/widgets/defaultBackButton.dart';
import 'package:ecommerce/widgets/defaultButton.dart';
import 'package:ecommerce/widgets/headerLabel.dart';
import 'package:flutter/material.dart';

class Payment extends StatefulWidget {
  const Payment({Key ?key}) : super(key: key);

  @override
  _PaymentState createState() => _PaymentState();
}

class _PaymentState extends State<Payment> {
  int value = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kWhiteColor,
      appBar: const DefaultAppBar(
        title: 'Payment',
        child: DefaultBackButton(),
      ),
      body: Column(
        children: [
          const HeaderLabel(
            headerText: 'Choose your payment method',
          ),
          Expanded(
            child: ListView.separated(
              itemCount: paymentLabels.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: Radio(
                    activeColor: kPrimaryColor,
                    value: index,
                    groupValue: value,
                    onChanged: (i) => setState(() => value = i as int),
                  ),
                  title: Text(
                    paymentLabels[index],
                    style: const TextStyle(color: kDarkColor),
                  ),
                  trailing: Icon(paymentIcons[index], color: kPrimaryColor),
                );
              },
              separatorBuilder: (context, index) {
                return const Divider();
              },
            ),
          ),
          DefaultBttn(
            btnText: 'Pay',
            onPressed: () => Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => const Success(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
