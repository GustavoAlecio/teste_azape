import 'package:az_proof/app/data/models/dashboard_model.dart';
import 'package:az_proof/app/data/preferences/user_preferences.dart';
import 'package:az_proof/app/data/providers/dashboard_provider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class HomeController extends GetxController {
  DashboardProvider dashboardProvider;

  HomeController(this.dashboardProvider);

  final _scrollController = ScrollController().obs;
  ScrollController get scrollController => _scrollController.value;
  void set scrollController(ScrollController value) =>
      _scrollController.value = value;

  final user = UserPreferences().obs;

  final userName = ''.obs;

  final dashboardModel = DashboardModel().obs;

  final numberFormat = NumberFormat.simpleCurrency(locale: 'pt_BR');

  var dateFormat = DateFormat('y-MM-dd');

  final _selectedPage = 1.obs;
  int get selectedPage => _selectedPage.value;
  void set selectedPage(int value) {
    _selectedPage.value = value;
    scrollController =
        ScrollController(initialScrollOffset: (selectedPage * 50) - 50);
    listPagination();
  }

  final _dropdownValue = 5.obs;
  int get dropdownValue => _dropdownValue.value;
  void set dropdownValue(int value) {
    _dropdownValue.value = value;
    selectedPage = 1;
    listPagination();
  }

  final _totalPagination = 1.obs;
  int get totalPagination => _totalPagination.value;
  void set totalPagination(int value) => _totalPagination.value = value;

  final _sublistOrders = <OrdersModel>[].obs;
  List<OrdersModel> get sublistOrders => _sublistOrders;
  void set sublistOrders(List<OrdersModel> value) =>
      _sublistOrders.value = value;

  @override
  void onInit() async {
    await getName();
    await getData(await user.value.getToken());
    listPagination();
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}

  Future<void> getName() async {
    userName.value = await user.value.getName();
  }

  Future<void> getData(String token) async {
    try {
      dashboardModel.value = await dashboardProvider.getDataDashboard(token);
    } catch (e) {}
  }

  void listPagination() {
    sublistOrders.clear();
    totalPagination =
        (dashboardModel.value.orders!.length / dropdownValue).ceil();
    for (var i = ((dropdownValue * selectedPage) - dropdownValue);
        i < dropdownValue * selectedPage;
        i++) {
      if (i < dashboardModel.value.orders!.length) {
        sublistOrders.add(dashboardModel.value.orders![i]);
      }
    }
  }

  List<OrdersModel> filterByDateTimeDesc({
    required List<OrdersModel> orders,
    required DateTime initialDate,
    required DateTime endDate,
  }) {
    List<OrdersModel> output = [];

    for (var i = 0; i < orders.length; i++) {
      var date = orders[i].createTime!;
      if (date.compareTo(initialDate) >= 0 && date.compareTo(endDate) <= 0) {
        output.add(orders[i]);
      }
    }
    return output;
  }

  List<OrdersModel> filterByDateTimeAsc({
    required List<OrdersModel> orders,
    required DateTime initialDate,
    required DateTime endDate,
  }) {
    var dateFormat = DateFormat('y-MM-ddT00:00:00.000Z');
    List<OrdersModel> output = [];

    for (var i = 0; i < orders.length; i++) {
      var date = orders[i].createTime!;
      if (date.compareTo(initialDate) <= 0 && date.compareTo(endDate) >= 0) {
        output.add(orders[i]);
      }
    }
    return output;
  }
}
