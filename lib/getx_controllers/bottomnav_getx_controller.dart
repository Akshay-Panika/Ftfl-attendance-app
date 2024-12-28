import 'package:get/get.dart';

class BottomNavGetXController extends GetxController{
  RxInt selectedIndex = 0.obs;

  void onSelectIndex(int index){
    selectedIndex.value = index;
  }
}