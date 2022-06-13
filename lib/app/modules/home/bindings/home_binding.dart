import 'package:az_proof/app/data/providers/dashboard_provider.dart';
import 'package:get/get.dart';
import '../controllers/home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    DashboardProvider sessionProvider = DashboardProvider();
    Get.lazyPut<HomeController>(() => HomeController(sessionProvider));
  }
}
