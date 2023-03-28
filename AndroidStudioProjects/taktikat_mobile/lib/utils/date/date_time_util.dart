import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:logger/logger.dart';
import 'package:taktikat/feature/core/theme/app_theme.dart';
import 'package:taktikat/utils/constants/constants.dart';

import '../../feature/core/theme/color/color_manager.dart';
import '../utils/utils.dart';

class DateUtility {
  static bool isArabicLang() {
    return Utils.instance.isArabic();
  }

  static String getDateDayWithMonthNameAndDate({DateTime? date}) {
    try {
      if (date == null) {
        return '';
      }
    final  String stringDate = DateFormat('EEEE, MMMM dd',
              isArabicLang() ? Constants.arLangCode : Constants.enLangCode)
          .format(date);
      return stringDate;
    } catch (e) {
      Logger().e(e);
      return '';
    }
  }

  static String getDateWithTwoDigit({DateTime? date}) {
    try {
      if (date == null) {
        return '';
      }
     final String stringDate = DateFormat('dd-MM-yy').format(date);
      return stringDate;
    } catch (e) {
      Logger().e(e);
      return '';
    }
  }

  static bool isDatesEquals(
      {required DateTime? firstDate, required DateTime? secondDate}) {
    if (firstDate != null && secondDate != null) {
      return firstDate.year == secondDate.year &&
          firstDate.month == secondDate.month &&
          firstDate.day == secondDate.day;
    } else {
      return false;
    }
  }

  static bool isDateTomorrow({required DateTime date}) {
   final DateTime tomorrow = DateTime.now().add(const Duration(days: 1));

    return isDatesEquals(firstDate: date, secondDate: tomorrow);
  }

  static bool isDateYesterday({required DateTime date}) {
   final DateTime yesterday = DateTime.now().subtract(const Duration(days: 1));
    return isDatesEquals(firstDate: date, secondDate: yesterday);
  }

  //get Hour and minute from date
  static String getHourAndMinute({required DateTime? dateTime}) {
    // // late String formatted;
    // initializeDateFormatting('ar_SA', null).then((_) {
    //   if (dateTime == null) {
    //     return '';
    //   }
    //   var formatter = DateFormat.yMMMd('ar_SA');
    //   print(formatter.locale);
    //   DateFormat('h:mm a').format(dateTime);
    //   String formatted = formatter.format(dateTime);
    //   print(formatted);
    //   return formatted;
    // });

    initializeDateFormatting(isArabicLang() ? 'ar_SA' : 'en_US', null);

    if (dateTime == null) {
      return '';
    }
    // return DateFormat.Hm('ar_SA').format(dateTime);
    // dateTime = dateTime.add(
    //     Duration(hours: getOffsetHour(SharedPrefs.instance.getTimeZone())));

    return DateFormat('h:mm a').format(dateTime);
  }

  static String getDayNumberAndMonthName({required DateTime? dateTime}) {
    initializeDateFormatting(isArabicLang() ? 'ar' : 'en');
    if (dateTime == null) {
      return '';
    }
    // dateTime = dateTime.add(
    //     Duration(hours: getOffsetHour(SharedPrefs.instance.getTimeZone())));

    return DateFormat('dd MMM yyyy', isArabicLang() ? 'ar' : 'en')
        .format(dateTime);
    // return DateFormat.E(isArabicLang() ? 'ar' : 'en').format(dateTime);
  }

  static getDateinNumbersFormat({DateTime? date}) {
    try {
      if (date == null) {
        return '';
      }
    final  String stringDate = DateFormat('dd-MM-yyyy').format(date);
      return stringDate;
    } catch (e) {
      Logger().e(e);
      return '';
    }
  }

  static String setDateNormalFormat({DateTime? date, required String format}) {
    try {
      if (date == null) {
        return '';
      }
     final String stringDate = DateFormat(format).format(date);
      return stringDate;
    } catch (e) {
      Logger().e(e);
      return '';
    }
  }

  static Future<void> selectDate({
    required BuildContext ctx,
    required Function(DateTime? selectedDate) onChoose,
    DateTime? initialDate,
    DateTime? firstDate,
    DateTime? lastDate,
  }) async {
   final DateTime? selectedDate = await showDatePicker(
      locale:
          Utils.instance.isArabic() ? const Locale('ar') : const Locale('en'),
      context: ctx,
      builder: (context, child) {
        return Theme(
          data: AppTheme.instance.lightTheme.copyWith(
            colorScheme: ColorScheme.light(
              primary: Theme.of(context).primaryColor,
              onPrimary: ColorManager.instance.white,
              surface: Theme.of(context).primaryColor,
              onSurface: ColorManager.instance.black,
            ),
            dialogBackgroundColor: ColorManager.instance.white,
            textTheme: Theme.of(context).textTheme,
          ),
          child: child!,
        );
      },
      initialDate: initialDate ?? DateTime.now(),
      firstDate: firstDate ?? DateTime(2005, 8),
      lastDate: lastDate ?? DateTime(2030),
    );
    if (selectedDate != null) {
      onChoose(selectedDate);
    }
  }
}
