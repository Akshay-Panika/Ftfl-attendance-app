
import 'package:get/get.dart';

class SplashGetXController extends GetxController{
  @override
  void onInit() {
    super.onInit();
    _navigateToHome();
  }

  void _navigateToHome()async{
    await Future.delayed(const Duration(seconds: 3));
    Get.offNamed('/bottomNav');
  }
}