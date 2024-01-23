import 'package:dayday_flutter/src/controller/feed_controller.dart';
import 'package:dayday_flutter/src/screen/feed/create.dart';
import 'package:dayday_flutter/src/screen/feed/index.dart';
import 'package:dayday_flutter/src/widget/feed_list_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:table_calendar/table_calendar.dart';

final feedController = Get.put(FeedController());

class FeedIndex extends StatefulWidget {
  const FeedIndex({super.key});

  @override
  State<FeedIndex> createState() => _FeedIndexState();
}

class _FeedIndexState extends State<FeedIndex> {
  bool _visibility = true;

  void _show() {
    setState(() {
      _visibility = true;
    });
  }

  void _hide() {
    setState(() {
      _visibility = false;
    });
  }

  @override
  void initState() {
    super.initState();
    feedController.feedIndex();
  }

  DateTime selectedDay = DateTime(
    DateTime.now().year,
    DateTime.now().month,
    DateTime.now().day,
  );

  DateTime focusedDay = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TableCalendar(
        focusedDay: focusedDay,
        firstDay: DateTime(2020),
        lastDay: DateTime(2024, 1, 31),
        onDaySelected: (DateTime selectedDay, DateTime focusedDay) {
          setState(() {
            this.selectedDay = selectedDay;
            this.focusedDay = focusedDay;
          });
        },
        selectedDayPredicate: (DateTime day) {
          _visibility = !isSameDay(selectedDay, day);
          return isSameDay(selectedDay, day);
        },
        headerStyle: const HeaderStyle(
          formatButtonVisible: false,
          titleCentered: true,
        ),
        calendarStyle: const CalendarStyle(
          todayDecoration: BoxDecoration(
            color: Color(0xffD4A7FB),
            shape: BoxShape.circle,
          ),
          todayTextStyle:
              TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
        ),
      ),
      floatingActionButton: Visibility(
        visible: _visibility,
        child: InkWell(
          onTap: () {
            Get.to(() => const FeedCreate());
          },
          child: Container(
            width: 56.0,
            height: 56.0,
            decoration: const ShapeDecoration(
              shape: StadiumBorder(),
              color: Color(0xffD4A7FB),
            ),
            child: const Icon(Icons.add, color: Colors.white),
          ),
        ),
      ),
    );
  }
}
