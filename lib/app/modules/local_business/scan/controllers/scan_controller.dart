import 'package:get/get.dart';

class ScanController extends GetxController {
  var scannedValue = ''.obs;
  var isScanned = false.obs;
  var isScanning = false.obs;

  void startScanning() {
    isScanning.value = true;
  }

  void setScannedData(String value) {
    scannedValue.value = value;
    isScanned.value = true;
    isScanning.value = false;
  }

  void resetScanner() {
    scannedValue.value = '';
    isScanned.value = false;
    isScanning.value = false;
  }
}
