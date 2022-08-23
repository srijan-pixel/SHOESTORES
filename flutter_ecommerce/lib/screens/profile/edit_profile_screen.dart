import 'package:ecommerce/api/profile_update_api.dart';
import 'package:ecommerce/constant/color_properties.dart';
import 'package:ecommerce/constant/constants.dart';
import 'package:ecommerce/providers/customer_provider.dart';
import 'package:ecommerce/utils/keyboard.dart';
import 'package:ecommerce/utils/scroll_configuration.dart';
import 'package:ecommerce/utils/size_config.dart';
import 'package:ecommerce/utils/validation_mixin.dart';
import 'package:ecommerce/widgets/default_button.dart';
import 'package:ecommerce/widgets/general_alert_dialog.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class EditProfileScreen extends StatelessWidget {
  static const routeName = '/editProfile';
  const EditProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: SizeConfig.heightMultiplier * 2,
            vertical: SizeConfig.heightMultiplier,
          ),
          child: Column(
            children: [
              // SizedBox(height: SizeConfig.heightMultiplier),
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
                    'Your Profile',
                    style: Theme.of(context).textTheme.headline6!,
                  ),
                ],
              ),
              SizedBox(
                height: SizeConfig.heightMultiplier,
              ),
              CircleAvatar(
                          backgroundColor: secondaryColor,
                        radius: SizeConfig.imageSizeMultiplier * 20 ,

                          child: Icon(
                            Icons.person,
                            size: SizeConfig.imageSizeMultiplier * 20,
                            color: canvasColor,
                          ),
                        ),
              SizedBox(
                height: SizeConfig.heightMultiplier * 5,
              ),
              Expanded(
                child: ScrollConfiguration(
                  behavior: MyBehavior(),
                  child: EditProfileForm(_formKey),
                ),
              ),
              
            ],
          ),
        ),
      ),
    );
  }
}

class EditProfileForm extends StatefulWidget {
  const EditProfileForm(this.formKey, {Key? key}) : super(key: key);

  final GlobalKey<FormState> formKey;

  @override
  _EditProfileFormState createState() => _EditProfileFormState();
}

class _EditProfileFormState extends State<EditProfileForm> {
  final _validationMixin = ValidationMixin();
  String? name;
  String? email;
  String? password;
  String? confirmPassword;
  bool remember = false;
  final List<String?> errors = [];
  bool isPasswordObsecure = true;
  bool isConfirmPasswordObsecure = true;

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
      key: widget.formKey,
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            buildNameFormField(),
            SizedBox(
              height: SizeConfig.heightMultiplier * 3,
            ),
            buildEmailFormField(),
            SizedBox(
              height: SizeConfig.heightMultiplier * 3,
            ),
            buildPasswordFormField(),
            SizedBox(
              height: SizeConfig.heightMultiplier * 3,
            ),
            buildConfirmPassFormField(),
            SizedBox(
              height: SizeConfig.heightMultiplier * 2.5,
            ),
            DefaultButton(
                text: "Submit",
                press: () async{
                  if (widget.formKey.currentState!.validate()) {
                    widget.formKey.currentState!.save();
                    try {
                  GeneralAlertDialog().showLoadingDialog(context);
                  final response = await ProfileUpdateApi().updateProfile(context, name!, email!, password!);
                  
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

    TextFormField buildConfirmPassFormField() {
    return TextFormField(
      obscureText: isConfirmPasswordObsecure,
      textInputAction: TextInputAction.done,
      onSaved: (newValue) => confirmPassword = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kPassNullError);
        } else if (value.isNotEmpty && password == confirmPassword) {
          removeError(error: kMatchPassError);
        }
        confirmPassword = value;
      },
      validator: (value) => ValidationMixin().validatePassword(value!),
      decoration: InputDecoration(
        isDense: true,
        labelText: "Confirm Password",
        hintText: "Re-enter your password",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: IconButton(
          onPressed: () {
            setState(() {
              isConfirmPasswordObsecure = !isConfirmPasswordObsecure;
            });
          },
          icon: Icon(
            isConfirmPasswordObsecure
                ? Icons.visibility_off_outlined
                : Icons.visibility_outlined,
          ),
        ),
      ),
    );
  }

  TextFormField buildPasswordFormField() {
    return TextFormField(
      obscureText: isPasswordObsecure,
      textInputAction: TextInputAction.next,
      onSaved: (newValue) => password = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kPassNullError);
        } else if (value.length >= 8) {
          removeError(error: kShortPassError);
        }
        password = value;
      },
      validator: (value) => ValidationMixin().validatePassword(value!),
      decoration: InputDecoration(
        isDense: true,
        labelText: "Password",
        hintText: "Enter your password",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: IconButton(
          onPressed: () {
            setState(() {
              isPasswordObsecure = !isPasswordObsecure;
            });
          },
          icon: Icon(
            isPasswordObsecure
                ? Icons.visibility_off_outlined
                : Icons.visibility_outlined,
          ),
        ),
      ),
    );
  }



  TextFormField buildNameFormField() {
    return TextFormField(
      keyboardType: TextInputType.name,
      textInputAction: TextInputAction.next,
      onSaved: (newValue) => name = newValue,
      validator: (value) => _validationMixin.validateName(value!),
      decoration: InputDecoration(
        isDense: true,
        labelText: "Name",
        hintText: "Enter your Name",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.person_outlined,
          ),
        ),
      ),
    );
  }

  TextFormField buildEmailFormField() {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      textInputAction: TextInputAction.next,
      onSaved: (newValue) => email = newValue,
      validator: (value) => _validationMixin.validateEmail(value!),
      decoration: InputDecoration(
        isDense: true,
        labelText: "Email",
        hintText: "Enter your email",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.email_outlined,
          ),
        ),
      ),
    );
  }
}
