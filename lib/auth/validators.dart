import 'package:chat_app_front/auth/auth_label_keys.dart';
import 'package:chat_app_front/global_localization.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';

enum ValidatorType { EMAIL, USERNAME, PASSWORD, NOT_EMPTY }

abstract class Validator {
  Validator._();

  static final RegExp _alphanumerics = RegExp(r"^[A-Za-z0-9]*$");
  static final RegExp _alphanumericsWithSpecials =
      RegExp(r"^[A-Za-z0-9#$%&'()*+,-./:;<=>?@[\]^_`{|}~]*$");

  factory Validator(ValidatorType type, BuildContext context) {
    switch (type) {
      case ValidatorType.EMAIL:
        return _EmailValidator(context);
      case ValidatorType.USERNAME:
        return _UsernameValidator(context);
      case ValidatorType.PASSWORD:
        return _PasswordValidator(context);
      case ValidatorType.NOT_EMPTY:
        return _NotEmptyValidator(context);
    }
    throw Exception("Unknown validator");
  }

  String validate(String value);
}

class _NotEmptyValidator extends Validator {
  final BuildContext context;

  _NotEmptyValidator(this.context) : super._();

  @override
  String validate(String value) {
    return value.isEmpty
        ? GlobalLocalizations.of(context)
            .translate(AuthLabelKeys.fieldCantBeEmpty)
        : null;
  }
}

class _PasswordValidator extends Validator {
  final BuildContext context;

  _PasswordValidator(this.context) : super._();

  @override
  String validate(String value) {
    if (value.isEmpty)
      return GlobalLocalizations.of(context)
          .translate(AuthLabelKeys.fieldCantBeEmpty);
    if (value.length < 8 ||
        !Validator._alphanumericsWithSpecials.hasMatch(value))
      return GlobalLocalizations.of(context)
          .translate(AuthLabelKeys.passwordPolicy);

    return null;
  }
}

class _UsernameValidator extends Validator {
  final BuildContext context;

  _UsernameValidator(this.context) : super._();

  @override
  String validate(String value) {
    if (value.isEmpty)
      return GlobalLocalizations.of(context)
          .translate(AuthLabelKeys.fieldCantBeEmpty);
    if (value.length < 6 || !Validator._alphanumerics.hasMatch(value))
      return GlobalLocalizations.of(context)
          .translate(AuthLabelKeys.invalidFormat);

    return null;
  }
}

class _EmailValidator extends Validator {
  final BuildContext context;

  _EmailValidator(this.context) : super._();

  @override
  String validate(String value) {
    if (value.isEmpty)
      return GlobalLocalizations.of(context)
          .translate(AuthLabelKeys.fieldCantBeEmpty);
    if (!EmailValidator.validate(value))
      return GlobalLocalizations.of(context)
          .translate(AuthLabelKeys.invalidFormat);

    return null;
  }
}
