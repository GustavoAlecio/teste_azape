import 'package:az_proof/app/modules/home/controllers/home_controller.dart';
import 'package:az_proof/app/modules/home/views/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'activityInfoCard.dart';

class HomeContent extends StatefulWidget {
  @override
  State<HomeContent> createState() => _HomeContentState();
}

class _HomeContentState extends State<HomeContent> {
  final controller = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Resumo de atividade",
          style: ConstantsTheme.headingH6,
        ),
        SizedBox(height: 20),
        Obx(
          () => activityCard(controller),
        ),
      ],
    );
  }
}

activityCard(HomeController controller) {
  return Row(
    children: [
      ActivityInfoCard(
        icon: 'assets/icons/orders.svg',
        color: Color(0xFFF4C8E1),
        title: "${controller.dashboardModel.value.ordersTotal ?? ''} Pedidos",
        valor:
            '${controller.numberFormat.format(controller.dashboardModel.value.ordersCount ?? 0  )}',
      ),
      SizedBox(
        width: 10,
      ),
      ActivityInfoCard(
        icon: 'assets/icons/sales.svg',
        color: Color(0xFFB6EEDD),
        title: "${controller.dashboardModel.value.salesTotal ?? ''} Vendas",
        valor:
            '${controller.numberFormat.format(controller.dashboardModel.value.salesCount ?? 0)}',
      ),
      SizedBox(
        width: 10,
      ),
      ActivityInfoCard(
        icon: 'assets/icons/ticket.svg',
        color: Color(0xFFC3E7F3),
        title: "Ticket médio",
        valor:
            '${controller.numberFormat.format(controller.dashboardModel.value.averageTicket ?? 0)}',
      ),
    ],
  );
}
