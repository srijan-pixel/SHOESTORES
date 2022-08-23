import '/widgets/default_button.dart';
import '/widgets/no_account_text.dart';
import '/constant/constants.dart';
import '/utils/size_config.dart';
import '/utils/validation_mixin.dart';
import 'package:flutter/material.dart';

class ForgotPassForm extends StatefulWidget {
  const ForgotPassForm({Key? key}) : super(key: key);

  @override
  _ForgotPassFormState createState() => _ForgotPassFormState();
}

class _ForgotPassFormState extends State<ForgotPassForm> {
  final _formKey = GlobalKey<FormState>();
  List<String> errors = [];
  String? email;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          TextFormField(
            keyboardType: TextInputType.emailAddress,
            onSaved: (newValue) => email = newValue,
            onChanged: (value) {
              if (value.isNotEmpty && errors.contains(kEmailNullError)) {
                setState(() {
                  errors.remove(kEmailNullError);
                });
              } else if (emailValidatorRegExp.hasMatch(value) &&
                  errors.contains(kInvalidEmailError)) {
                setState(() {
                  errors.remove(kInvalidEmailError);
                });
              }
              return;
            },
            validator: (value) => ValidationMixin().validateEmail(value!),
            decoration: InputDecoration(
              labelText: "Email",
              isDense: true,
              hintText: "Enter your email",
              floatingLabelBehavior: FloatingLabelBehavior.always,
              suffixIcon: IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.email_outlined,
                ),
              ),
            ),
          ),
          SizedBox(
            height: SizeConfig.heightMultiplier * 2.5,
          ),
          DefaultButton(
            text: "Continue",
            press: () {
              if (_formKey.currentState!.validate()) {
                // Do what you want to do
              }
            },
          ),
          SizedBox(
            height: SizeConfig.heightMultiplier * 2.5,
          ),
          const NoAccountText(),
        ],
      ),
    );
  }
}
