import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:s_fashion/src/config/themes/my_colors.dart';
import 'package:s_fashion/src/constants/base_url.dart';

enum TypeSnackBar {
  success,
  failed,
}

class Utils {
  static String convertCurrencyFormat(double money) {
    return NumberFormat.simpleCurrency(locale: 'vi-VI', decimalDigits: 0)
        .format(money);
  }

  static String getUrlImageProduct(String image) {
    return BaseUrl.imgProduct + image;
  }

  static String getUrlImageUser(String image) {
    return BaseUrl.imgUser + image;
  }

  static SnackBar getSnackBar(
    BuildContext context,
    String mes,
    TypeSnackBar type,
  ) {
    Color? colorBg;

    if (type == TypeSnackBar.success) {
      colorBg = MyColors.colorGreen;
    }

    if (type == TypeSnackBar.failed) {
      colorBg = Theme.of(context).colorScheme.error;
    }
    return SnackBar(
      content: Text(
        mes,
        style: Theme.of(context).textTheme.bodySmall!.copyWith(
              color: Theme.of(context).colorScheme.background,
            ),
      ),
      backgroundColor: colorBg,
      duration: const Duration(
        milliseconds: 2000,
      ),
    );
  }
}
