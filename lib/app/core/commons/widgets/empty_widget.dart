
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:s_booking_public/app/core/commons/common_widgets.dart';

class EmptyWidget extends StatelessWidget {
  EmptyWidget({
    Key? key,
    required this.image,
    required this.title,
    required this.subtitle,
    this.opacity = 0.6,
    this.color,
  }) : super(key: key);

  final String image, title, subtitle;
  final double opacity;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Opacity(
              opacity: opacity,
              child: SvgPicture.asset(
                image,
                color: color,
              )),
          const SizedBox(height: 16),
          CommonWidgets.appText(
            title,
            fontWeight: FontWeight.bold,
            size: 21,
          ),
          const SizedBox(height: 8),
          CommonWidgets.appText(
            subtitle,
            fontWeight: FontWeight.w600,
          )
        ],
      ),
    );
  }
}
