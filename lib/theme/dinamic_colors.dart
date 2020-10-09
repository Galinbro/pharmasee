import 'package:flutter/material.dart';

import 'package:farmasee/theme/static_colors.dart';
import 'package:farmasee/src/user_preferences/user_preference.dart';

class XplainColors {
  factory XplainColors() {
    return shared;
  }
  XplainColors._internal();

  static final StaticColors colors = StaticColors();
  static final XplainColors shared = XplainColors._internal();
  final UserPreferences _prefs = UserPreferences();

  Color backgroundColor() {
    return _prefs.theme ? colors.background : Colors.white;
  }

  Color backgroundColorBlue() {
    return _prefs.theme ? colors.background : colors.blueBackground;
  }

  Color appbarBackgroundColor() {
    return _prefs.theme ? colors.background : colors.blueBackground;
  }

  Color darkerBackgroundColor() {
    return _prefs.theme ? colors.darkerBackground : null;
  }

  Color circleBackground(double opacity) {
    return _prefs.theme
        ? colors.menuItemDark
        : colors.butterflyBush.withOpacity(opacity);
  }

  Color shadowColor(double opacity) {
    return _prefs.theme
        ? colors.shadowsDark.withOpacity(opacity)
        : colors.shadowsLight.withOpacity(opacity);
  }

  Color greyBackground() {
    return _prefs.theme ? Colors.white60 : Colors.grey[350];
  }

  //text
  Color titleTextColor() {
    return _prefs.theme ? Colors.white : colors.titleText;
  }

  Color textColor() {
    return _prefs.theme ? Colors.white : colors.text;
  }

  Color sapphireTextColor(double opacity) {
    return _prefs.theme ? Colors.white : colors.sapphire.withOpacity(opacity);
  }

  Color textErrorColor() {
    return _prefs.theme ? Color(0xFFef9a9a) : Color(0xFFef9a9a);
  }

  Color textColorOpacity(double opacity) {
    return _prefs.theme
        ? Colors.white.withOpacity(opacity)
        : colors.text.withOpacity(opacity);
  }

  Color whiteTextColor(double opacity) {
    return _prefs.theme
        ? Colors.white.withOpacity(1)
        : Colors.white.withOpacity(1);
  }

  Color blackTextColor(double opacity) {
    return _prefs.theme
        ? Colors.white.withOpacity(opacity)
        : Colors.black.withOpacity(opacity);
  }

  Color chickenLittleColor() {
    return _prefs.theme ? null : colors.chickenLittle;
  }

  Color blueTextColor(double opacity) {
    return _prefs.theme
        ? Colors.white
        : colors.mentoriatitleTxt.withOpacity(opacity);
  }

  Color grayTextColor(double opacity) {
    return _prefs.theme ? Colors.white : colors.grayText.withOpacity(opacity);
  }

  Color grayDarkTextColor(double opacity) {
    return _prefs.theme
        ? Colors.white
        : colors.grayDarkText.withOpacity(opacity);
  }

  //appbar
  Color iconAppbarColor() {
    // return _prefs.theme ? Colors.white : colors.menuItemLight;
    return _prefs.theme ? Colors.white : Colors.white;
  }

  //drawer
  Color textUserDrawerColor() {
    return _prefs.theme ? Colors.white : colors.titleText;
  }

  Color drawerSelectedColor() {
    return _prefs.theme ? colors.menuItemDark : colors.menuItemLight;
  }

  Color drawerNotSelectedColor() {
    return _prefs.theme ? null : Colors.white;
  }

  Color drawerSelectedTextColor() {
    return Colors.white;
  }

  Color drawerNotSelectedTextColor() {
    return _prefs.theme ? Colors.white : colors.menuItemLight;
  }

  Color drawerSelectedIconColor() {
    return _prefs.theme ? null : Colors.white;
  }

  Color drawerNotSelectedIconColor() {
    return _prefs.theme ? colors.menuItemDark : colors.menuItemLight;
  }

  //divider
  Color dividerColor() {
    return _prefs.theme ? Colors.white : colors.menuItemLight;
  }

  //btns
  Color btnColor() {
    return colors.chickenLittle;
  }

  Color btnTextColor(double opacity) {
    return _prefs.theme ? colors.text : colors.sapphire.withOpacity(opacity);
  }

  Color btnNotActiveColor() {
    return _prefs.theme
        ? colors.grayBackground
        : Colors.white.withOpacity(0.45);
  }

  Color btnActiveColor() {
    return _prefs.theme ? colors.background : Colors.white;
  }

  //textfield

  Color textFieldColor() {
    return _prefs.theme ? null : colors.peranoLight;
  }

  Color textFieldTextColor() {
    return _prefs.theme ? null : Colors.white;
  }

  //mentorias
  Color mentoriaTitles(double opacity) {
    return _prefs.theme ? null : colors.mentoriatitleTxt.withOpacity(opacity);
  }

  Color mentoriaBody() {
    return _prefs.theme ? null : colors.mentoriaBodyText.withOpacity(0.7);
  }
}
