import 'package:az_proof/app/modules/home/views/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ActivityInfoCard extends StatelessWidget {
  final String icon;
  final String title;
  final Color color;
  final String valor;

  const ActivityInfoCard({
    Key? key,
    required this.icon,
    required this.title,
    required this.color,
    required this.valor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              blurRadius: 4,
              offset: Offset(0, 2),
              color: Colors.black.withOpacity(0.05),
            ),
          ],
          color: Colors.white,
          borderRadius: BorderRadius.all(
            Radius.circular(8),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CircleAvatar(
                radius: 25,
                backgroundColor: color,
                child: SvgPicture.asset(
                  icon,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                title,
                style: ConstantsTheme.headingH6,
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                "$valor",
                style: ConstantsTheme.headingH6Bold,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
