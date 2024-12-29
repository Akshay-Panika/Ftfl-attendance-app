import 'dart:async';
import 'package:flutter/material.dart';
import 'package:ftfl_attendance_app/custom_widget/custom_hw.dart';
import 'package:ftfl_attendance_app/custom_widget/custom_textstyle.dart';
import 'package:intl/intl.dart';

import 'location_get.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late String currentTime;
  late String currentTimeWithSecond;
  late String currentDateMonthYear;
  late String currentDay;
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    _updateDateTime();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        _updateDateTime();
      });
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  void _updateDateTime() {
    final now = DateTime.now();
    currentTime = DateFormat('hh:mm a').format(now); // e.g., 10:30 AM
    currentTimeWithSecond = DateFormat('hh:mm:ss a').format(now); // e.g., 10:30:45 AM
    currentDateMonthYear = DateFormat('dd MMMM yyyy').format(now); // e.g., 28 December 2024
    currentDay = DateFormat('EEEE').format(now); // e.g., Saturday
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 10,
      ),
      body: Column(
        children: [
          /// App bar
          _buildAppBar(),

          100.height,

          /// Date and Time Display
          _buildDateTimeDisplay(
            currentTime: currentTime,
            currentDateMonthYear: currentDateMonthYear,
            currentDay: currentDay,
          ),

          50.height,

          /// Check In/Out
          _checkInOut(),

          100.height,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _futureButton(
                title: '9:30',
                subtitle: 'Check In',
              ),
              _futureButton(
                title: '---:---',
                subtitle: 'Check Out',
              ),
              _futureButton(
                title: '0.00',
                subtitle: 'Total Hrs',
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget _buildAppBar() {
    String _getGreeting() {
      final hour = DateTime.now().hour;
      if (hour < 12) return "Good Morning";
      if (hour < 17) return "Good Afternoon";
      return "Good Evening";
    }

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Akshay Panika", style: textStyle18(fontWeight: FontWeight.w600)),
              Text(_getGreeting() + ", Mark Your Attendance", style: textStyle14(color: Colors.grey)),
            ],
          ),
          const CircleAvatar(
            radius: 30,
            backgroundImage: AssetImage('assets/images/akshay.jpg'),
          ),
        ],
      ),
    );
  }

  Widget _buildDateTimeDisplay({
    required String currentTime,
    required String currentDateMonthYear,
    required String currentDay,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          currentTime,
          style: const TextStyle(fontSize: 30),
        ),
        Text(
          '$currentDateMonthYear, $currentDay',
          style: textStyle14(fontWeight: FontWeight.w600, color: Colors.grey),
        ),
      ],
    );
  }

  Widget _checkInOut() {
    return InkWell(
      onTap: () {
        showModalBottomSheet(
          context: context,
          builder: (context) => const PickLocationScreen(),
        );
      },
      child: Container(
        height: 180,
        width: 180,
        decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: BorderRadius.circular(90),
        ),
        child: Container(
          margin: const EdgeInsets.all(15),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(90),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                blurRadius: 10,
                spreadRadius: 2,
                offset: Offset(0, 3),
              ),
            ],
          ),
          child: const Icon(Icons.touch_app, size: 75, color: Colors.green),
        ),
      ),
    );
  }

  Widget _futureButton({String? title, String? subtitle}) {
    return Column(
      children: [
        Icon(
          Icons.access_time,
          color: Colors.green.shade300,
          size: 50,
        ),
        Text(
          title ?? '',
          style: textStyle14(color: Colors.green, fontWeight: FontWeight.w700),
        ),
        Text(
          subtitle ?? '',
          style: textStyle12(color: Colors.grey, fontWeight: FontWeight.w600),
        ),
      ],
    );
  }

}



    // Container(
    //           height: 50,
    //             decoration: customDecoration(
    //               color: Colors.black12,
    //               borderRadius: 20
    //             ),
    //             child: InkWell(
    //               onTap: _getLocation,
    //               child: Row(
    //                 mainAxisAlignment: MainAxisAlignment.center,
    //                 children: [
    //                   isLoading
    //                       ? SizedBox(height: 30,width: 30,child: CircularProgressIndicator(color: Colors.green,))
    //                       : const Icon(Icons.my_location, color: Colors.green,size: 30,),
    //                   10.width,
    //                   Text(isLoading ? "Fetching Location..." : "Get Location", style: textStyle16(fontWeight: FontWeight.w600),),
    //                 ],
    //               ),
    //             ))
