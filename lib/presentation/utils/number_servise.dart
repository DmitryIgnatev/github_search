class NumberSevice {
  /// Format big number to string like 1.7k, 2.5kk
  static String formatNumber(int number) {
    if (number < 1000) {
      return number.toString();
    } else if (number < 1000000) {
      // from 1000 to 999999
      return '${(number / 1000).toStringAsFixed(1).replaceAll(RegExp(r'\.0$'), '')}k';
    } else {
      // from 1000000 and higher
      return '${(number / 1000000).toStringAsFixed(1).replaceAll(RegExp(r'\.0$'), '')}kk';
    }
  }

  static int calculateColumnCount(double width) {
    if (width < 390) {
      return 1;
    } else if (width >= 390 && width < 760) {
      return 2;
    } else {
      return 4;
    }
  }
}
