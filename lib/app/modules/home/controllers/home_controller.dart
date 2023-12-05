import 'package:get/get.dart';
import 'package:intl/intl.dart'; 

class HomeController extends GetxController {
  //TODO: Implement HomeController

  final count = 0.obs;
  late DateTime currentBackPressTime;
  RxString greetings = ''.obs;
  int hours = DateTime.now().hour;

  void initGreetings(){
    if(hours>=1 && hours<=12){ 
    greetings.value = "Pagi"; 
    } else if(hours>=12 && hours<=16){
     greetings.value = "Siang"; 
    } else if(hours>=16 && hours<=21){ 
    greetings.value = "Malam";
     } else if(hours>=21 && hours<=24){ 
    greetings.value = "Beristirahat"; 
    }
  }
  @override
  void onInit() {
    initGreetings();
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
  void increment() => count.value++;
}
