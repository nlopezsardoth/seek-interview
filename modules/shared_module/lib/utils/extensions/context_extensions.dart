import 'package:auth_module/l10n/auth_localizations.dart';
import 'package:flutter/material.dart';
import 'package:home_module/l10n/home_localizations.dart';
import 'package:shared_module/l10n/shared_localizations.dart';

extension BuildContextExt on BuildContext {

  ThemeData get theme => Theme.of(this);

  AuthLocalizations get l10nAuth => AuthLocalizations.of(this)!;

  SharedLocalizations get l10nShared => SharedLocalizations.of(this)!;

  HomeLocalizations get l10nHome => HomeLocalizations.of(this)!;

}
