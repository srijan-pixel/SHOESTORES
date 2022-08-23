class ValidationMixin {
  validateEmail(String value) {
    String pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regExp = RegExp(pattern);
    if (value.isEmpty) {
      return 'Email is required';
    } else if (!regExp.hasMatch(value.trim())) {
      return 'Invalid email';
    } else {
      return null;
    }
  }

  validateMobile(String value) {
    String pattern = r'(^[0-9]*$)';
    RegExp regExp = RegExp(pattern);
    if (value.isEmpty) {
      return "Please enter mobile number";
    } else if (!regExp.hasMatch(value.trim())) {
      return "Mobile Number must be digit";
    } else if (value.length != 10) {
      return "Mobile Number must be 10 digit";
    }
    return null;
  }

  validateNumber(String value, {String? title}) {
    String pattern = r'(^[0-9]*$)';
    RegExp regExp = RegExp(pattern);
    if (value.isEmpty) {
      return title == null ? "Number is required" : "$title is required";
    } else if (!regExp.hasMatch(value.trim())) {
      return "Number must be digit";
    }
    return null;
  }

  validateName(String value) {
    String pattern = r'(^[a-zA-Z ]*$)';
    RegExp regExp = RegExp(pattern);
    if (value.isEmpty) {
      return "Name is required ";
    } else if (!regExp.hasMatch(value.trim())) {
      return "Name must be character";
    }
    return null;
  }

  validateAddress(String value) {
    if (value.isEmpty) {
      return "Address is required ";
    }
    return null;
  }

  validatePassword(String value) {
    if (value.isEmpty) {
      return "Password is required ";
    } else if (value.length < 8) {
      return "Password must be 8 digit";
    }
    return null;
  }
}
