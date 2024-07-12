part of "splash_screen.dart";

class SplashController extends GetxController {
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
    Get.offAllNamed(Routes.home);
  }

  @override
  void onClose() {
    super.onClose();
  }
}
