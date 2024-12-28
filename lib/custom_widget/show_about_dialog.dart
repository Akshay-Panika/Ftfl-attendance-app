import 'package:flutter/material.dart';
import 'package:ftfl_attendance_app/custom_widget/custom_hw.dart';
import 'custom_textstyle.dart';

void showCustomDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: Container(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text("Please wait", style: textStyle16()),
              16.height,
              Text("Dear customer please wait sum time!", style: textStyle14(color: Colors.grey),),

              16.height,
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    child: Text("Close",style: textStyle14(fontWeight: FontWeight.w700, color: Colors.blue),),
                    onPressed: () => Navigator.of(context).pop(),
                  ),
                ],
              ),
            ],
          ),
        ),
      );
    },
  );
}
