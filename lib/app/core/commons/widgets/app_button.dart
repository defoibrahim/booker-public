
import 'package:flutter/material.dart';
import 'package:s_booking_public/app/core/theme/app_colors.dart';

class AppButton extends ElevatedButton {
  AppButton({
    Key? key,
    required dynamic text,
    Color? color,
    VoidCallback? onPressed,
    this.isLoading = false,
    Color? textColor,
    double height = 80.0,
    double width = 50.0,
  }) : super(
          key: key,
          child: isLoading
              ? Container(
                  width: 24,
                  height: 24,
                  child: const CircularProgressIndicator(
                    color: kWhiteColor,
                  ),
                )
              : text is String
                  ? Text(
                      text,
                      style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.w600,
                        color: kWhiteColor,
                      ),
                    )
                  : text as Widget,
          style: ElevatedButton.styleFrom(
            primary: color, // background
            onPrimary: textColor, // foreground
            minimumSize: Size(height, width),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
              // side: const BorderSide(color: Colors.red),
            ),
          ),
          onPressed: isLoading ? null : onPressed,
        );
  final bool isLoading;
}
