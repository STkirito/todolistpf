import 'package:awesonestyle/awesonestyle.dart';
import 'package:flutter/material.dart';

class AddTaskController extends GetxController {
  Rx<MainAxisSize> mainAxisSize = MainAxisSize.min.obs;
  TextEditingController title = TextEditingController();
  TextEditingController description = TextEditingController();
  Rx<DateTime> date = DateTime.now().obs;

  /* @override
  void onInit() {
    date.value = DateTime.now();
    super.onInit();
  }

  @override
  void onClose() {
    date.value = DateTime.now();
    super.onClose();
  } */

  String dateString() {
    if (date.value.year == DateTime.now().year &&
        date.value.month == DateTime.now().month &&
        date.value.day == DateTime.now().day) {
      return 'Hoy';
    } else {
      //'${date.value.year}/${date.value.month}/${date.value.day}'
      return AwsFormatter.formatter.format(date.value);
    }
  }

  Map dateLabel() {
    return {
      'year':
          date.value.year == DateTime.now().year ? 'Año' : '${date.value.year}',
      'month': date.value.month == DateTime.now().month
          ? 'Mes'
          : '${date.value.month}',
      'day': date.value.day == DateTime.now().day ? 'Dia' : '${date.value.day}',
    };
  }
}
