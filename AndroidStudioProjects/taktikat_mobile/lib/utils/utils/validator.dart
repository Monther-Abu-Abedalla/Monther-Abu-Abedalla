import 'package:get/get.dart';

import '../localization/string_keys.dart';

class Validator {
  //create singleton
  static Validator instance = Validator._internal();

  Validator._internal();

  //create validator for email
  String? emailValidator(String? value) {
    if (emptyValidator(value) != null) {
      return emptyValidator(value);
    } else if (!RegExp(r'^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+')
        .hasMatch(value!)) {
      return StringKeys.singleton.pleaseEnterValidEmail.tr;
    }
    return null;
  }

//create empty validator
  String? emptyValidator(String? value) {
    value == null ? value = '' : value = value;
    if (value.isEmpty) {
      return StringKeys.singleton.requiredField.tr;
    }
    return null;
  }

  //create validator for password
  String? passwordValidator(String? value) {
    if (emptyValidator(value) != null) {
      return emptyValidator(value);
    } else if (value!.length < 6) {
      return StringKeys.singleton.passwordMustBeAtLeast6Characters.tr;
    }
    return null;
  }

  // id Id validator must more than 9 digits
  String? idValidator(String? value) {
    if (emptyValidator(value) != null) {
      return emptyValidator(value);
    } else if (value!.length != 10) {
      return StringKeys.singleton.pleaseEnterValidId.tr;
    } else if (!RegExp(r'^[0-9]+$').hasMatch(value)) {
      return StringKeys.singleton.pleaseEnterValidId.tr;
    }
    return null;
  }

  validateDateBirth(String? text) {
    if (emptyValidator(text) != null) {
      return emptyValidator(text);
    } else if (DateTime.parse(text!).isAfter(DateTime.now())) {
      return StringKeys.singleton.pleaseEnterValidDateOfBirth.tr;
    }
    return null;
  }

  validateName(String? text) {
    if (emptyValidator(text) != null) {
      return emptyValidator(text);
    } else if (text!.length < 2) {
      return StringKeys.singleton.pleaseEnterValidName.tr;
    }
    return null;
  }

  validateEmail(String? text) {
    if (emptyValidator(text) != null) {
      return emptyValidator(text);
    } else if (!GetUtils.isEmail(text ?? '')) {
      return StringKeys.singleton.pleaseEnterValidEmail.tr;
    }
    return null;
  }

  validateMobile(String? text) {
    if (emptyValidator(text) != null) {
      return emptyValidator(text);
    } else if (!GetUtils.isPhoneNumber(text ?? '')) {
      return StringKeys.singleton.pleaseEnterValidMobile.tr;
    }
    return null;
  }

  fileValidator(String? p0) {
    if (emptyValidator(p0) != null) {
      return emptyValidator(p0);
    }
    return null;
  }

  bool isValidatePassword({required String password}) {
    const String pattern =
        r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{6,}$';
    final RegExp regExp = RegExp(pattern);
    return regExp.hasMatch(password);
  }

  String? phoneValidator(String? value) {
    if (emptyValidator(value) != null) {
      return emptyValidator(value);
    } else if (!GetUtils.isPhoneNumber(value ?? '')) {
      return StringKeys.singleton.pleaseEnterValidMobile.tr;
    }
    return null;
  }

  String? nameValidator(String? value) {
    if (emptyValidator(value) != null) {
      return emptyValidator(value);
    } else if (value!.length < 2) {
      return StringKeys.singleton.pleaseEnterValidName.tr;
    }
    return null;
  }

  String? emailOrMobileValidator(String? p1) {
    if (emptyValidator(p1) != null) {
      return emptyValidator(p1);
    } else if (!GetUtils.isEmail(p1 ?? '') &&
        !GetUtils.isPhoneNumber(p1 ?? '')) {
      return StringKeys.singleton.pleaseEnterValidEmailOrMobile.tr;
    }
    return null;
  }
}
