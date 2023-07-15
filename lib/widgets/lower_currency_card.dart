import 'package:flutter/material.dart';

import '../constants/constants.dart';
import 'dart:math' as math;

class LowerCurrencyCard extends StatefulWidget {
  const LowerCurrencyCard({super.key});

  @override
  LowerCurrencyCardState createState() => LowerCurrencyCardState(TextEditingController());
}

class LowerCurrencyCardState extends State<LowerCurrencyCard> {
  //ToDo: 01 add getLocation fun
  final TextEditingController currencyController;

  LowerCurrencyCardState(this.currencyController);
  @override
  Widget build(BuildContext context) {
    return  Container(
      child:  Stack(
        children: [
          Transform.rotate(angle: math.pi,child: CustomPaint(
            size: Size(double.infinity, 150),
            painter: MyLowerPainter(30),
          ),),
          Padding(

            padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 18),

            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  flex: 1,
                  child: TextFormField(

                    // controller: ,
                    decoration: const InputDecoration(
                      border: UnderlineInputBorder(),
                      labelText: 'To',
                    ),
                  ),
                ),
                Text("BTC"),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class MyLowerPainter extends CustomPainter {
  final double borderRadius;

  final Paint _borderPaint = Paint()
    ..color = kLowerCardColor
    ..strokeWidth = 1.0
    ..style = PaintingStyle.stroke
    ..strokeJoin = StrokeJoin.round;

  final Paint _paint = Paint()
    ..color = kLowerCardColor
    ..strokeWidth = 1.0
    ..style = PaintingStyle.fill
    ..strokeJoin = StrokeJoin.round;

  MyLowerPainter(this.borderRadius);

  @override
  // void paint(Canvas canvas, Size size) {
  //   double x = size.width;
  //   double y = size.height;
  //   double arc = borderRadius;
  //   double yFactor = y * 0.4;
  //   double xFactor = x * 0.5;
  //   var path = Path();
  //   path.moveTo(arc, 0);
  //   path.lineTo(x/2 - arc, 0);
  //   path.addArc(
  //     Rect.fromCircle(center: Offset(x / 2, 0 ), radius: arc),
  //     0, 3.14,
  //   );
  //   path.lineTo(x - arc, 0);
  //   path.quadraticBezierTo(x,0, x, arc);
  //   path.lineTo(x, y - arc);
  //   path.quadraticBezierTo(x, y, x - arc, y);
  //   // path.lineTo(x/2 + arc, y);
  //   // path.quadraticBezierTo(x/2 +arc, y-arc, x/2, y-arc);
  //   // path.quadraticBezierTo(x/2 -arc, y-arc, x/2-arc, y);
  //   path.lineTo(arc, y);
  //   path.quadraticBezierTo(0, y, 0, y - arc);
  //   path.lineTo(0, arc);
  //   path.quadraticBezierTo(0, 0, arc, 0);
  //   canvas.drawPath(path, _paint);
  //   canvas.drawPath(path, _borderPaint);
  // }

  void paint(Canvas canvas, Size size) {
    double x = size.width;
    double y = size.height;
    double arc = borderRadius;
    double radius =50;

    var path = Path();
    path.moveTo(arc, 0);
    path.lineTo(x - arc, 0);
    path.quadraticBezierTo(x,0, x, arc);
    path.lineTo(x, y - arc);
    path.quadraticBezierTo(x, y, x - arc, y);
    path.lineTo(x/2 + radius, y);
    path.quadraticBezierTo(x/2 +radius, y-radius, x/2, y-radius);
    path.quadraticBezierTo(x/2 -radius, y-radius, x/2-radius, y);
    path.lineTo(arc, y);
    path.quadraticBezierTo(0, y, 0, y - arc);
    path.lineTo(0, arc);
    path.quadraticBezierTo(0, 0, arc, 0);
    canvas.drawPath(path, _paint);
    canvas.drawPath(path, _borderPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

