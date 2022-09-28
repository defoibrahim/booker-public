
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:s_booking_public/app/core/theme/app_colors.dart';

class CustomBottomAppBar extends StatefulWidget {
  const CustomBottomAppBar(
      {Key? key, required this.onChanged, required this.selectedIndex})
      : super(key: key);

  final Function(int index) onChanged;
  final int selectedIndex;

  @override
  _CustomBottomAppBarState createState() => _CustomBottomAppBarState();
}

class _CustomBottomAppBarState extends State<CustomBottomAppBar> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double height = 56;

    final shadowColor = Colors.grey; //color of Navbar shadow
    double elevation = 100; //Elevation of the bottom Navbar

    return Obx(
      () => BottomAppBar(
        color: Colors.transparent,
        elevation: 4,
        child: Stack(
          children: [
            CustomPaint(
              size: Size(size.width, height),
              painter: BottomNavCurvePainter(
                backgroundColor: Get.isDarkMode
                    ? kScaffoldDarkBackroundColor
                    : kScaffoldBackroundColor,
                shadowColor: shadowColor,
                elevation: elevation,
              ),
            ),
            Center(
              heightFactor: 0.6,
              child: FloatingActionButton(
                backgroundColor: kAccentColor,
                child: const Icon(
                  Icons.home_outlined,
                  color: Colors.white,
                ),
                elevation: 0.5,
                onPressed: () {
                  widget.onChanged(1);
                },
              ),
            ),
            SizedBox(
              height: height,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  NavBarIcon(
                    text: "Orders",
                    icon: Icons.history,
                    selected: widget.selectedIndex == 0,
                    onPressed: () {
                      widget.onChanged(0);
                    },
                    defaultColor: kAccentColor,
                    selectedColor: kMainColor,
                  ),
                  const SizedBox(width: 56),
                  NavBarIcon(
                    text: "Settings",
                    icon: Icons.settings,
                    selected: widget.selectedIndex == 2,
                    onPressed: () {
                      widget.onChanged(2);
                    },
                    selectedColor: kMainColor,
                    defaultColor: kAccentColor,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class BottomNavCurvePainter extends CustomPainter {
  BottomNavCurvePainter(
      {this.backgroundColor = Colors.white,
      this.insetRadius = 38,
      this.shadowColor = Colors.grey,
      this.elevation = 100});

  Color backgroundColor;
  Color shadowColor;
  double elevation;
  double insetRadius;
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = backgroundColor
      ..style = PaintingStyle.fill;
    Path path = Path();

    double insetCurveBeginnningX = size.width / 2 - insetRadius;
    double insetCurveEndX = size.width / 2 + insetRadius;

    path.lineTo(insetCurveBeginnningX, 0);
    path.arcToPoint(Offset(insetCurveEndX, 0),
        radius: const Radius.circular(41), clockwise: true);

    path.lineTo(size.width, 0);

    path.lineTo(size.width, size.height + 56);
    path.lineTo(
        0,
        size.height +
            56); //+56 here extends the navbar below app bar to include extra space on some screens (iphone 11)
    canvas.drawShadow(path, shadowColor, elevation, true);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}

class NavBarIcon extends StatelessWidget {
  const NavBarIcon(
      {Key? key,
      required this.text,
      required this.icon,
      required this.selected,
      required this.onPressed,
      this.selectedColor = const Color(0xffFF8527),
      this.defaultColor = Colors.black54})
      : super(key: key);
  final String text;
  final IconData icon;
  final bool selected;
  final Function() onPressed;
  final Color defaultColor;
  final Color selectedColor;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
          onPressed: onPressed,
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
          icon: Icon(
            icon,
            size: 25,
            color: selected ? selectedColor : defaultColor,
          ),
        ),
      ],
    );
  }
}
