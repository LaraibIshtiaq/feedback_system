import 'package:capp_mobile/services/date_time_service.dart';
import 'package:capp_mobile/shared/constants/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';

Widget datePickerField({
    required String fieldText,
    required BuildContext context,
    required StateProvider<DateTime> selectedDate,
    required WidgetRef ref,
    required DateTime? startLimit,
    required DateTime? endLimit,
}){
  return Expanded(
    child: GestureDetector(
      onTap: () async {
        ref.read(selectedDate.notifier).state = (await _selectDate(context, ref.read(selectedDate), startLimit, endLimit )?? DateTime.now());
      },
      child: Container(
        decoration: BoxDecoration(
            color: Theme.of(context).focusColor,
            borderRadius: BorderRadius.all(
              Radius.circular(8)),
            border: Border.all(
              color: Theme.of(context).focusColor, // Unfocused border color
              width: 1,
            )
        ),
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(DateTimeService.formatToMonthDayYear(ref.read(selectedDate)), style: Theme.of(context).textTheme.labelSmall),

            IconButton(
                onPressed: () async {
                  ref.read(selectedDate.notifier).state = await _selectDate(context, ref.read(selectedDate), startLimit, endLimit)?? DateTime.now();
                },
                icon: SvgPicture.asset(icCalendar)
            )
          ],
        ),
      ),
    ),
  );
}

Future<DateTime?> _selectDate(
    BuildContext context,
    DateTime selectedDate,
    DateTime? startLimit,
    DateTime? endLimit) async {
  final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,

      firstDate: startLimit ?? DateTime(2015, 8),
      lastDate: endLimit ?? DateTime(2101));
  if (picked != null) {
    return picked;
  }
  return null;
}