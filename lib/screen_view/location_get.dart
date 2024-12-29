import 'package:flutter/material.dart';
import 'package:ftfl_attendance_app/custom_widget/custom_card.dart';
import 'package:ftfl_attendance_app/custom_widget/custom_decoration.dart';
import 'package:geolocator/geolocator.dart';
import 'package:ftfl_attendance_app/custom_widget/custom_hw.dart';
import 'package:ftfl_attendance_app/custom_widget/custom_textstyle.dart';

class PickLocationScreen extends StatefulWidget {
  const PickLocationScreen({super.key});

  @override
  State<PickLocationScreen> createState() => _PickLocationScreenState();
}

class _PickLocationScreenState extends State<PickLocationScreen> {
  var myAddress = '';
  bool isLoading = false;

  // Function to fetch the user's location
  Future<void> _getLocation() async {
    setState(() {
      isLoading = true; // Show loading indicator
    });

    try {
      // Check permission and request if necessary
      LocationPermission permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied || permission == LocationPermission.deniedForever) {
        permission = await Geolocator.requestPermission();
        if (permission != LocationPermission.whileInUse && permission != LocationPermission.always) {
          setState(() {
            myAddress = 'Location permission denied';
            isLoading = false;
          });
          return;
        }
      }

      // Get the current position
      Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );

      // Update the address (latitude and longitude for simplicity)
      setState(() {
        myAddress = 'Lat: ${position.latitude}, Lng: ${position.longitude}';
        isLoading = false;
      });
    } catch (e) {
      // Handle errors
      setState(() {
        myAddress = 'Error fetching location: $e';
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: SizedBox(
        width: MediaQuery.of(context).size.width * 0.9, // Responsive width
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            const Icon(Icons.location_on, size: 100, color: Colors.green),
            20.height,
            
            Text('Enable your locations', style: textStyle16(fontWeight: FontWeight.w600), textAlign: TextAlign.center,),

            Text(myAddress, style: textStyle16(color: Colors.grey), textAlign: TextAlign.center,),


            50.height,
            ElevatedButton.icon(
              onPressed: _getLocation,
              icon: isLoading
                  ? const SizedBox(height: 25,width: 25,
                    child: CircularProgressIndicator(color: Colors.green,),)
                  : const Icon(Icons.my_location, color: Colors.green,size: 30,),
                   label: Padding(
                     padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
                     child: Text(isLoading ? "Fetching Location..." : "Set Location",style: textStyle16(),),
                   ),
            ),

          ],
        ),
      ),
    );
  }
}
