
import 'package:ecommerce/api/delivery_address_api.dart';
import 'package:ecommerce/constant/color_properties.dart';
import 'package:ecommerce/constant/constants.dart';
import 'package:ecommerce/screens/payment/payment.dart';
import 'package:ecommerce/utils/keyboard.dart';
import 'package:ecommerce/utils/size_config.dart';
import 'package:ecommerce/utils/validation_mixin.dart';
import 'package:ecommerce/widgets/defaultAppBar.dart';
import 'package:ecommerce/widgets/defaultBackButton.dart';
import 'package:ecommerce/widgets/defaultButton.dart';
import 'package:ecommerce/widgets/defaultTextField.dart';
import 'package:ecommerce/widgets/default_button.dart';
import 'package:ecommerce/widgets/general_alert_dialog.dart';
import 'package:ecommerce/widgets/headerLabel.dart';
import 'package:flutter/material.dart';

class DeliveryAddress extends StatefulWidget {
  const DeliveryAddress({Key ?key}) : super(key: key);

  @override
  _DeliveryAddressState createState() => _DeliveryAddressState();
}

class _DeliveryAddressState extends State<DeliveryAddress> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kWhiteColor,
      appBar: const DefaultAppBar(
        title: "Delivery Address",
        child: DefaultBackButton(),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8,),
          child: Column(
            children: const [
              HeaderLabel(
                headerText: "Where are your ordered items shipped?",
              ),
              DeliveryScreenForm(),
            ],
          ),
        ),
      ),
    );
  }
}

class DeliveryScreenForm extends StatefulWidget {
  const DeliveryScreenForm( {Key? key}) : super(key: key);

  

  @override
  _DeliveryScreenFormState createState() => _DeliveryScreenFormState();
}

class _DeliveryScreenFormState extends State<DeliveryScreenForm> {
  final _validationMixin = ValidationMixin();
  String? address;
  String? city;
  String? country;
  String? pinCode;
  final List<String?> errors = [];

  final formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
  }

  void addError({String? error}) {
    if (!errors.contains(error)) {
      setState(() {
        errors.add(error);
      });
    }
  }

  void removeError({String? error}) {
    if (errors.contains(error)) {
      setState(() {
        errors.remove(error);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            buildCountryFormField(),

            SizedBox(
              height: SizeConfig.heightMultiplier * 3,
            ),
            buildCityFormField(),
            SizedBox(
              height: SizeConfig.heightMultiplier * 3,
            ),
            buildAddressFormField(),
            SizedBox(
              height: SizeConfig.heightMultiplier * 3,
            ),
            buildPinCodeFormField(),
            SizedBox(
              height: SizeConfig.heightMultiplier * 2.5,
            ),
            DefaultButton(
                text: "Submit",
                press: () async{
                  if (formKey.currentState!.validate()) {
                    formKey.currentState!.save();
                    try {
                  GeneralAlertDialog().showLoadingDialog(context);
                  final response = await DeliveryAddressApi().sendDeliveryAddress(context, address!, city!, country!, pinCode!);
                  
                  Navigator.pop(context);
                                  Navigator.pop(context);
                    // Navigator.of(context).pop();

                } catch (ex) {
                  // print(ex.toString());
                  Navigator.pop(context);

                  GeneralAlertDialog().showAlertDialog(ex.toString(),context);
                    KeyboardUtil.hideKeyboard(context);
                }
                  }
                },
              ),
          ],
        ),
      ),
    );
  }

  TextFormField buildAddressFormField() {
    return TextFormField(
      textInputAction: TextInputAction.done,
      onSaved: (newValue) => address = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: "Address is required");
        } 
        return;
      },
      validator: (value) => ValidationMixin().validateAddress(value!),
      decoration: InputDecoration(
        isDense: true,
        labelText: "Address",
        hintText: "Enter your address",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: IconButton(
          onPressed: () {
            
          },
          icon: const Icon(
            Icons.map_outlined,
          ),
        ),
      ),
    );
  }

  TextFormField buildCityFormField() {
    return TextFormField(
      textInputAction: TextInputAction.next,
      onSaved: (newValue) => city = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: "Please enter your city");
        }
      },
      validator: (value) => ValidationMixin().validateAddress(value!),
      decoration: const InputDecoration(
        isDense: true,
        labelText: "City",
        hintText: "Enter your city",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: Icon(
          Icons.location_city,
      ),
    ));
  }

 TextFormField buildCountryFormField() {
    return TextFormField(
      textInputAction: TextInputAction.next,
      onSaved: (newValue) => country = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: "Please enter your country");
        }
      },
      validator: (value) => ValidationMixin().validateAddress(value!),
      decoration: const InputDecoration(
        isDense: true,
        labelText: "Country",
        hintText: "Enter your country",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: Icon(
          Icons.landscape,
      ),
    ));
  }

   TextFormField buildPinCodeFormField() {
    return TextFormField(
      textInputAction: TextInputAction.done,
      onSaved: (newValue) => pinCode = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: "Please enter your pin code");
        }
      },
      validator: (value) => ValidationMixin().validateNumber(value!),
      decoration: const InputDecoration(
        isDense: true,
        labelText: "Pin Code",
        hintText: "Enter your pin code",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: Icon(
          Icons.landscape,
      ),
    ));
  }
}