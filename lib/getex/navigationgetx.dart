





import 'package:get/get.dart';

class Navigationcontroller extends GetxController{

  RxInt index = 2.obs;

  changescreens(valu){
    index.value  = valu;
  }

}