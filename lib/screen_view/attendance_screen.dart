import 'package:flutter/material.dart';
import 'package:ftfl_attendance_app/custom_widget/custom_hw.dart';
import 'package:ftfl_attendance_app/custom_widget/custom_textstyle.dart';
import 'package:table_calendar/table_calendar.dart';

class AttendanceScreen extends StatelessWidget {
  const AttendanceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Attendance History'),
        titleTextStyle: textStyle16(fontWeight: FontWeight.w600),
        centerTitle: true,
        toolbarHeight: 40,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildCalendar(),


            50.height,
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Old Attendance History',
                  style: textStyle14(fontWeight: FontWeight.w700, color: Colors.grey),
                ),
                const SizedBox(height: 10),
                SizedBox(height: 200,
                  child: _buildOldHistoryList(),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCalendar() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(8),
      ),
      child: TableCalendar(
        firstDay: DateTime.utc(2020, 1, 1),
        lastDay: DateTime.utc(2030, 12, 31),
        focusedDay: DateTime.now(),
        calendarStyle: const CalendarStyle(
          todayDecoration: BoxDecoration(
            color: Colors.green,
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
          selectedDecoration: BoxDecoration(
            color: Colors.orange,
            shape: BoxShape.circle,
          ),
        ),
      ),
    );
  }

  Widget _buildOldHistoryList() {

    return ListView.separated(
      itemCount: 3,
      separatorBuilder: (_, __) => const Divider(),
      itemBuilder: (context, index) {
        return  Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Months', style: textStyle14(fontWeight: FontWeight.w600),),
                Text("This months ${index.toString()}", style: textStyle14(color: Colors.grey,fontWeight: FontWeight.w600),),
              ],


            ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Present', style: textStyle14(fontWeight: FontWeight.w600),),
                  Text('25', style: textStyle14(color: Colors.grey,fontWeight: FontWeight.w600),),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Absent', style: textStyle14(fontWeight: FontWeight.w600),),
                  Text('6', style: textStyle14(color: Colors.grey,fontWeight: FontWeight.w600),),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Salary', style: textStyle14(fontWeight: FontWeight.w600),),
                  Row(
                    children: [
                      Icon(Icons.currency_rupee, size: 15 , color: Colors.grey,),
                      Text('14,400.00', style: textStyle14(color: Colors.grey,fontWeight: FontWeight.w600),),
                    ],
                  ),
                ],
              ),
          ],
          ),
        );
      },
    );
  }

  Color _getStatusColor(String status) {
    switch (status) {
      case 'Present':
        return Colors.green;
      case 'Absent':
        return Colors.red;
      case 'Leave':
        return Colors.orange;
      default:
        return Colors.black;
    }
  }
}
