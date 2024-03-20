import 'package:get/get.dart';


class FeedMyRequestController extends GetxController{


  RxBool isVisible = false.obs;

  visibility(){
    isVisible.value = !isVisible.value;
  }


}