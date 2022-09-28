
import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:s_booking_public/app/core/theme/app_colors.dart';
// ignore: depend_on_referenced_packages

class CommonWidgets {
  static void showSnackBar(
      {required String title, required String message, bool isError = true}) {
    Get.snackbar(
      title,
      message,
      colorText: Colors.white,
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: isError ? Colors.red : Colors.green,
      margin: const EdgeInsets.all(10),
      duration: const Duration(seconds: 2),
    );
  }

  static Widget appSvgPicture(String svgPath,
      {double? width, double? height, Color? color}) {
    Color svgColor = color != null
        ? color
        : Get.isDarkMode
            ? Colors.white
            : kMainTextColor;
    return SvgPicture.asset(
      svgPath,
      color: svgColor,
      width: width,
      height: height,
    );
  }

  static Widget appText(
    String text, {
    bool isCenter = false,
    double size = 13,
    Color? textColor,
    FontWeight fontWeight = FontWeight.normal,
    TextOverflow? overflow,
    TextDecoration? decoration,
    int? maxLines,
    TextDirection? textDirection,
    TextAlign? textAlign,
  }) {
    return Text(
      text,
      overflow: overflow,
      maxLines: maxLines,
      textDirection: textDirection,
      style: TextStyle(
        fontSize: size,
        color: textColor,
        fontWeight: fontWeight,
        decoration: decoration,
      ),
      textAlign: isCenter ? TextAlign.center : textAlign ?? TextAlign.start,
    );
  }

  static Widget appTextField({
    TextEditingController? controller,
    String? hintText,
    bool obscureText = false,
    bool enabled = true,
    bool readOnly = false,
    Widget? prefix,
    Widget? suffix,
    bool isPhone = false,
    TextInputType? inputType,
    int maxLines = 1,
    int minLine = 1,
    bool border = false,
    Color? textColor,
    VoidCallback? onTap,
    Function(CountryCode countryCode)? onCountryChanged,
    Function(String value)? onChanged,
    String? Function(String? value)? validator,
    List<TextInputFormatter>? inputFormatter,
    String? initailCountryCode = "+249",
    Function(String value)? onFieldSubmitted,
    TextInputAction? textInputAction,
    FocusNode? focusNode,
  }) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: <Widget>[
        if (isPhone)
          Row(
            children: <Widget>[
              CountryCodePicker(
                flagDecoration: const BoxDecoration(
                  shape: BoxShape.circle,
                ),
                flagWidth: 40,
                searchDecoration: const InputDecoration(
                  border: InputBorder.none,
                  filled: true,
                ),
                boxDecoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                ),
                onChanged: onCountryChanged,
                builder: (CountryCode? code) {
                  return Container(
                    padding: const EdgeInsets.only(bottom: 8, top: 10),
                    decoration: const BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          width: 1.5,
                        ),
                      ),
                    ),
                    child: Row(
                      children: <Widget>[
                        Text(
                          code!.dialCode!,
                          style: const TextStyle(
                            fontSize: 13,
                          ),
                        ),
                        const SizedBox(width: 4),
                        Image.asset(
                          code.flagUri!,
                          package: 'country_code_picker',
                          width: 19,
                        ),
                        const SizedBox(width: 12),
                      ],
                    ),
                  );
                },
                initialSelection: initailCountryCode,
                countryFilter: ['+249', 'SD'],
              ),
              const SizedBox(width: 16),
            ],
          ),
        Expanded(
          child: TextFormField(
            controller: controller,
            focusNode: focusNode,
            obscureText: obscureText,
            maxLines: maxLines,
            minLines: minLine,
            enabled: enabled,
            onTap: onTap,
            onFieldSubmitted: onFieldSubmitted,
            textInputAction: textInputAction,
            inputFormatters: inputFormatter,
            validator: validator,
            onChanged: onChanged,
            maxLength: isPhone ? 9 : null,
            style: const TextStyle(
              fontFamily: '',
              color: Color(0xffa0a0a0),
            ),
            readOnly: readOnly,
            keyboardType: isPhone ? TextInputType.phone : inputType,
            decoration: InputDecoration(
              hintText: hintText,
              hintStyle: TextStyle(color: textColor ?? textColor),
              counterText: '',
              isDense: true,
              focusedBorder: border
                  ? const OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(16),
                      ),
                    )
                  : const UnderlineInputBorder(),
              contentPadding: border
                  ? const EdgeInsets.symmetric(
                      vertical: 16,
                      horizontal: 8,
                    )
                  : const EdgeInsets.only(bottom: 4),
              border: border
                  ? const OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(16),
                      ),
                    )
                  : const UnderlineInputBorder(),
              suffixIcon: suffix,
              suffixIconConstraints: const BoxConstraints(),
              prefixIcon: Row(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  const SizedBox(width: 8),
                  prefix ?? Container(),
                  const SizedBox(width: 8),
                ],
              ),
              prefixIconConstraints: const BoxConstraints(),
            ),
          ),
        ),
      ],
    );
  }

  static Widget appDropdownField({
    required String labelText,
    required String selectedKey,
    String selectedId = 'id',
    required List<Map<String, dynamic>> list,
    required Map<String, dynamic> selected,
    required Function(Map<String, dynamic> value)? onChange,
    String? Function(String? value)? validator,
    Widget? prefix,
    bool border = true,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        DropdownButtonFormField<String>(
          validator: validator,
          value: selected[selectedId].toString(),
          decoration: InputDecoration(
            prefix: Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                if (prefix != null) prefix,
                if (prefix != null) const SizedBox(width: 4),
              ],
            ),
            isDense: true,
            contentPadding: const EdgeInsets.all(12),
            border: border
                ? const OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Color(0xffa0a0a0),
                    ),
                    borderRadius: BorderRadius.all(
                      Radius.circular(16),
                    ),
                  )
                : const UnderlineInputBorder(
                    borderSide: BorderSide(),
                  ),
            enabledBorder: border
                ? const OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Color(0xffa0a0a0),
                    ),
                    borderRadius: BorderRadius.all(
                      Radius.circular(16),
                    ),
                  )
                : const UnderlineInputBorder(
                    borderSide: BorderSide(),
                  ),
            focusedBorder: border
                ? const OutlineInputBorder(
                    borderSide: BorderSide(color: kAccentColor),
                    borderRadius: BorderRadius.all(
                      Radius.circular(16),
                    ),
                  )
                : const UnderlineInputBorder(
                    borderSide: BorderSide(color: kMainTextColor),
                  ),
            labelText: labelText,
          ),
          items: list.map((Map<String, dynamic> value) {
            return DropdownMenuItem<String>(
              value: value[selectedId].toString(),
              child: appText(value[selectedKey].toString()),
            );
          }).toList(),
          onChanged: (String? selectedValue) {
            if (onChange != null) {
              final int index = list.indexWhere(
                (Map<String, dynamic> element) =>
                    element[selectedId].toString() == selectedValue!,
              );

              if (index != -1) {
                final Map<String, dynamic> item = list[index];
                onChange(item);
              }
            }
          },
          // onChanged: onChange,
        ),
      ],
    );
  }

  static Widget appRadioButton({
    required List<Map<String, dynamic>> items,
    required Function(Map<String, dynamic> value) onChange,
    Map<String, dynamic>? selectedItem,
    bool vertical = false,
    String selecetedLabel = 'title',
  }) {
    assert(items.isNotEmpty);
    return Wrap(
      direction: vertical ? Axis.vertical : Axis.horizontal,
      children: items
          .map(
            (Map<String, dynamic> e) => InkWell(
              onTap: () {
                onChange(e);
              },
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Container(
                        width: 25,
                        height: 25,
                        padding: const EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          borderRadius: const BorderRadius.all(
                            Radius.elliptical(9999.0, 9999.0),
                          ),
                          color: const Color(0xffffffff).withOpacity(.2),
                          border: Border.all(color: const Color(0xffd4d4d4)),
                        ),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: const BorderRadius.all(
                              Radius.elliptical(9999.0, 9999.0),
                            ),
                            color: selectedItem != null &&
                                    selectedItem['id'] == e['id']
                                ? kMainColor
                                : const Color(0xffd4d4d4),
                          ),
                        ),
                      ),
                      const SizedBox(width: 8),
                      appText(e[selecetedLabel].toString()),
                      const SizedBox(width: 8),
                    ],
                  ),
                  if (vertical) const SizedBox(height: 8),
                ],
              ),
            ),
          )
          .toList(),
    );
  }

  static Future<T?> showDialog<T>({
    String? msg,
    Widget? icon,
    List<Widget>? actions,
    bool dismissible = true,
  }) async {
    final result = await Get.defaultDialog<T>(
      radius: 8,
      title: '',
      titleStyle: const TextStyle(
        fontSize: 0,
      ),
      contentPadding: EdgeInsets.zero,
      titlePadding: EdgeInsets.zero,
      actions: actions,
      barrierDismissible: dismissible,
      content: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              IconButton(
                onPressed: () {
                  Get.back();
                },
                icon: const Icon(Icons.close),
              ),
            ],
          ),
          Dialog(
            elevation: 0,
            insetPadding: const EdgeInsets.symmetric(horizontal: 30),
            child: Column(
              children: <Widget>[
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: const BoxDecoration(
                    color: kMainColor,
                    shape: BoxShape.circle,
                  ),
                  child: icon ?? Container(),
                ),
                const SizedBox(height: 20),
                appText(msg ?? 'Warning'.tr, isCenter: true),
                const SizedBox(height: 24),
              ],
            ),
          ),
        ],
      ),
    );

    return result;
  }
}

class BottomWaveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final Path path = Path();
    path.lineTo(0.0, size.height - 20);

    final Offset firstControlPoint = Offset(size.width / 4, size.height);
    final Offset firstEndPoint = Offset(size.width / 2.25, size.height - 30.0);
    path.quadraticBezierTo(
      firstControlPoint.dx,
      firstControlPoint.dy,
      firstEndPoint.dx,
      firstEndPoint.dy,
    );

    final Offset secondControlPoint =
        Offset(size.width - (size.width / 3.25), size.height - 65);
    final Offset secondEndPoint = Offset(size.width, size.height - 40);
    path.quadraticBezierTo(
      secondControlPoint.dx,
      secondControlPoint.dy,
      secondEndPoint.dx,
      secondEndPoint.dy,
    );

    path.lineTo(size.width, size.height - 40);
    path.lineTo(size.width, 0.0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
