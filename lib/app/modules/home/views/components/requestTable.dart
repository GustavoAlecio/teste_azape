import 'package:az_proof/app/modules/home/controllers/home_controller.dart';
import 'package:az_proof/app/modules/home/views/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RequestTable extends StatefulWidget {
  const RequestTable({
    Key? key,
  }) : super(key: key);

  @override
  State<RequestTable> createState() => _RequestTableState();
}

class _RequestTableState extends State<RequestTable> {
  final controller = Get.find<HomeController>();
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Pedidos",
          style: ConstantsTheme.headingH6,
        ),
        SizedBox(
          height: 24,
        ),
        tableSection(controller),
        Obx(() {
          return Container(
            height: 50,
            width: double.infinity,
            color: Color(0xFFF5F5F5),
            child: Row(children: [
              IconButton(
                onPressed: () {
                  controller.selectedPage = 1;
                },
                icon: Icon(
                  Icons.keyboard_double_arrow_left_rounded,
                  color: ConstantsTheme.primaryColor,
                  size: 24,
                ),
              ),
              IconButton(
                onPressed: () {
                  if (controller.selectedPage >= 1) {
                    controller.selectedPage--;
                  }
                },
                icon: Icon(
                  Icons.chevron_left_rounded,
                  color: ConstantsTheme.primaryColor,
                  size: 22,
                ),
              ),
              SizedBox(
                width: 200,
                child: Center(
                  child: ListView.builder(
                      controller: controller.scrollController,
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      itemCount: controller.totalPagination,
                      itemBuilder: (BuildContext context, index) {
                        int pag = index + 1;
                        return CircleAvatar(
                          backgroundColor: controller.selectedPage == pag
                              ? ConstantsTheme.primaryColor
                              : Colors.transparent,
                          child: TextButton(
                            onPressed: () {
                              controller.selectedPage = pag;
                            },
                            child: Text(
                              '$pag',
                              style: controller.selectedPage == pag
                                  ? ConstantsTheme.paragraphPBold
                                  : ConstantsTheme.paragraphP,
                            ),
                          ),
                        );
                      }),
                ),
              ),
              IconButton(
                onPressed: () {
                  if (controller.selectedPage < controller.totalPagination) {
                    controller.selectedPage++;
                  }
                },
                icon: Icon(
                  Icons.chevron_right_rounded,
                  color: ConstantsTheme.primaryColor,
                  size: 22,
                ),
              ),
              IconButton(
                onPressed: () {
                  controller.selectedPage = controller.totalPagination;
                },
                icon: Icon(
                  Icons.keyboard_double_arrow_right_rounded,
                  color: ConstantsTheme.primaryColor,
                  size: 24,
                ),
              ),
              SizedBox(
                width: 20,
              ),
              Text(
                "${controller.selectedPage} de ${controller.totalPagination} páginas",
                style: ConstantsTheme.paragraphP,
              ),
              Spacer(),
              Text(
                "Linhas por página",
                style: ConstantsTheme.paragraphP,
              ),
              SizedBox(
                width: 25,
              ),
              Container(
                decoration: BoxDecoration(
                    color: ConstantsTheme.backgroundColor,
                    borderRadius: BorderRadius.circular(20)),
                padding: EdgeInsets.all(8),
                margin: EdgeInsets.symmetric(vertical: 5),
                child: DropdownButton<int>(
                  value: controller.dropdownValue,
                  icon: const Icon(Icons.keyboard_arrow_down_outlined),
                  elevation: 16,
                  style: ConstantsTheme.paragraphSmall,
                  underline: Container(
                    height: 2,
                    color: Colors.transparent,
                  ),
                  onChanged: (int? value) => controller.dropdownValue = value!,
                  items: <int>[5, 6, 7, 8, 9, 10, 15, 20]
                      .map<DropdownMenuItem<int>>((int value) {
                    return DropdownMenuItem<int>(
                      value: value,
                      child: Text(
                        '$value',
                        style: ConstantsTheme.paragraphSmall
                            .copyWith(fontSize: 16),
                      ),
                    );
                  }).toList(),
                ),
              ),
              SizedBox(
                width: 20,
              ),
            ]),
          );
        }),
      ],
    );
  }
}

tableSection(HomeController controller) {
  return ClipRRect(
    borderRadius: BorderRadius.only(
      topLeft: Radius.circular(8),
      topRight: Radius.circular(8),
    ),
    child: Container(
        width: double.infinity,
        child: Obx(
          () => Table(
            defaultVerticalAlignment: TableCellVerticalAlignment.middle,
            children: <TableRow>[
              TableRow(
                children: <Widget>[
                  Container(
                    color: ConstantsTheme.secondaryColor,
                    height: 64,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'ID do Pedido',
                        style: ConstantsTheme.paragraphPBold
                            .copyWith(fontSize: 18),
                      ),
                    ),
                  ),
                  Container(
                    color: ConstantsTheme.primaryColor,
                    height: 64,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'ID na Loja',
                        style: ConstantsTheme.paragraphPBold
                            .copyWith(fontSize: 18),
                      ),
                    ),
                  ),
                  Container(
                    color: ConstantsTheme.secondaryColor,
                    height: 64,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'Criação',
                        style: ConstantsTheme.paragraphPBold
                            .copyWith(fontSize: 18),
                      ),
                    ),
                  ),
                  Container(
                    color: ConstantsTheme.primaryColor,
                    height: 64,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'Nome do cliente',
                        style: ConstantsTheme.paragraphPBold
                            .copyWith(fontSize: 18),
                      ),
                    ),
                  ),
                  Container(
                    color: ConstantsTheme.secondaryColor,
                    height: 64,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'CPF/CNPJ do cliente',
                        style: ConstantsTheme.paragraphPBold
                            .copyWith(fontSize: 18),
                      ),
                    ),
                  ),
                  Container(
                    color: ConstantsTheme.primaryColor,
                    height: 64,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'Status do Pedido',
                        style: ConstantsTheme.paragraphPBold
                            .copyWith(fontSize: 18),
                      ),
                    ),
                  ),
                  Container(
                    color: ConstantsTheme.secondaryColor,
                    height: 64,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'Status do pagamento',
                        style: ConstantsTheme.paragraphPBold
                            .copyWith(fontSize: 18),
                      ),
                    ),
                  ),
                  Container(
                    color: ConstantsTheme.primaryColor,
                    height: 64,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'Método de pagamento',
                        style: ConstantsTheme.paragraphPBold
                            .copyWith(fontSize: 18),
                      ),
                    ),
                  ),
                  Container(
                    color: ConstantsTheme.secondaryColor,
                    height: 64,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'Total',
                        style: ConstantsTheme.paragraphPBold
                            .copyWith(fontSize: 18),
                      ),
                    ),
                  ),
                ],
              ),
              if (controller.sublistOrders.isNotEmpty)
                ...controller.sublistOrders.map(
                  (order) => TableRow(
                    children: <Widget>[
                      Container(
                        color: ConstantsTheme.backgroundColor,
                        height: 64,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              '#${order.idOrder}',
                              style: ConstantsTheme.paragraphSmall
                                  .copyWith(fontSize: 16),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        color: ConstantsTheme.backgroundSecondColor,
                        height: 64,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              '#${order.idSeller}',
                              style: ConstantsTheme.paragraphSmall
                                  .copyWith(fontSize: 16),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        color: ConstantsTheme.backgroundColor,
                        height: 64,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              '${order.createTime!.day}/' +
                                  '${order.createTime!.month}/' +
                                  '${order.createTime!.year}',
                              style: ConstantsTheme.paragraphSmall
                                  .copyWith(fontSize: 16),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        color: ConstantsTheme.backgroundSecondColor,
                        height: 64,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              '${order.name}',
                              style: ConstantsTheme.paragraphSmall
                                  .copyWith(fontSize: 16),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        color: ConstantsTheme.backgroundColor,
                        height: 64,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              '${order.cpf}',
                              style: ConstantsTheme.paragraphSmall
                                  .copyWith(fontSize: 16),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        color: ConstantsTheme.backgroundSecondColor,
                        height: 64,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              '${order.statusOrder}',
                              style: ConstantsTheme.paragraphSmall
                                  .copyWith(fontSize: 16),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        color: ConstantsTheme.backgroundColor,
                        height: 64,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              '${order.statusPayment}',
                              style: ConstantsTheme.paragraphSmall
                                  .copyWith(fontSize: 16),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        color: ConstantsTheme.backgroundSecondColor,
                        height: 64,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              '${order.paymentMethod}',
                              style: ConstantsTheme.paragraphSmall
                                  .copyWith(fontSize: 16),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        color: ConstantsTheme.backgroundColor,
                        height: 64,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              '${order.total}',
                              style: ConstantsTheme.paragraphSmall
                                  .copyWith(fontSize: 16),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
            ],
          ),
        )),
  );
}
