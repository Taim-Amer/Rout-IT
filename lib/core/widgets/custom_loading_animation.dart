import 'package:flutter/material.dart';
import 'package:route_it27/core/utils/constants/app_colors.dart';

class CustomLoadingAnimation extends StatefulWidget {
  const CustomLoadingAnimation({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _CustomLoadingAnimationState createState() => _CustomLoadingAnimationState();
}

class _CustomLoadingAnimationState extends State<CustomLoadingAnimation>
    with TickerProviderStateMixin {
  late AnimationController controller1;
  late Animation<double> animation1;

  late AnimationController controller2;
  late Animation<double> animation2;

  @override
  void initState() {
    super.initState();

    controller1 =
        AnimationController(vsync: this, duration: Duration(seconds: 1));
    animation1 = Tween<double>(begin: .0, end: .5)
        .animate(CurvedAnimation(parent: controller1, curve: Curves.easeInOut))
      ..addListener(() {
        setState(() {});
      })
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          controller1.reverse();
          controller2.forward();
        } else if (status == AnimationStatus.dismissed) {
          controller1.forward();
        }
      });

    controller2 =
        AnimationController(vsync: this, duration: Duration(seconds: 1));
    animation2 = Tween<double>(begin: .0, end: .5)
        .animate(CurvedAnimation(parent: controller2, curve: Curves.easeInOut))
      ..addListener(() {
        setState(() {});
      })
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          controller2.reverse();
        } else if (status == AnimationStatus.dismissed) {
          controller2.forward();
        }
      });

    controller1.forward();
  }

  @override
  void dispose() {
    controller1.dispose();
    controller2.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          height: 60,
          width: 60,
          child: CustomPaint(
            painter: MyPainter(animation1.value, animation2.value),
          ),
        ),
      ),
    );
  }
}

class MyPainter extends CustomPainter {
  final double Radius_1;
  final double Radius_2;

  MyPainter(this.Radius_1, this.Radius_2);

  @override
  void paint(Canvas canvas, Size size) {
    Paint Circle_1 = Paint()..color = AppColors.lightPrimaryColor;

    Paint Circle_2 = Paint()..color = AppColors.primaryColor;

    canvas.drawCircle(Offset(size.width * .5, size.height * .5),
        size.width * Radius_1, Circle_1);

    canvas.drawCircle(Offset(size.width * .5, size.height * .5),
        size.width * Radius_2, Circle_2);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
