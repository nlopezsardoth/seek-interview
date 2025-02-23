import 'package:auth_module/l10n/auth_localizations.dart';
import 'package:flutter/material.dart';
import 'package:shared_module/l10n/shared_localizations.dart';

extension BuildContextExt on BuildContext {

  AuthLocalizations get l10nAuth => AuthLocalizations.of(this)!;

  SharedLocalizations get l10nShared => SharedLocalizations.of(this)!;
}
