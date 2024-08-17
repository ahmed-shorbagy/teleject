import 'dart:developer';

import 'package:get/get.dart';

class BaseApiService extends GetConnect {
  @override
  void onInit() {
    super.onInit();
    httpClient.baseUrl =
        "https://teleject-backend-nestjs-p2t2qinwsa-uc.a.run.app";
    baseUrl = "https://teleject-backend-nestjs-p2t2qinwsa-uc.a.run.app";
    log("BaseApiService initialized with baseUrl: $baseUrl");
  }
}
