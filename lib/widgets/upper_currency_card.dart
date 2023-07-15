import 'package:currency_exchange/constants/constants.dart';
import 'package:flutter/material.dart';

import 'dart:math';

import 'package:flutter/services.dart';

class UpperCurrencyCard extends StatefulWidget{
  final TextEditingController currencyController;
  final Function() onSubmit;

  const UpperCurrencyCard({super.key, required this.currencyController,required this.onSubmit});

  @override
  State<UpperCurrencyCard> createState() => _UpperCurrencyCardState();
}

class _UpperCurrencyCardState extends State<UpperCurrencyCard> {
  @override
  Widget build(BuildContext context) {
    return Container(

      child: Stack(
        children: [
          CustomPaint(
            size: Size(double.infinity, 150),
            painter: MyUpperPainter(30),
          ),
          Padding(

            padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 18),

            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  flex: 1,
                  child: TextFormField(
                    onTap: (){},

                    // controller: ,
                    decoration: const InputDecoration(
                      border: UnderlineInputBorder(),
                      labelText: 'From',
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
  }}


class MyUpperPainter extends CustomPainter {
  final double borderRadius;
  // final Color cardColor;
  MyUpperPainter(this.borderRadius);

  final Paint _borderPaint = Paint()
    ..color = kUpperCardColor
    ..strokeWidth = 2.0
    ..style = PaintingStyle.stroke
    ..strokeJoin = StrokeJoin.round;

  final Paint _paint = Paint()
    ..color = kUpperCardColor
    ..strokeWidth = 1.0
    ..style = PaintingStyle.fill
    ..strokeJoin = StrokeJoin.round;

  @override
  // void paint(Canvas canvas, Size size) {
  //   double x = size.width;
  //   double y = size.height;
  //   double arc = borderRadius;
  //   double yFactor = y * 0.4;
  //   double xFactor = x * 0.5;
  //   var path = Path();
  //   path.moveTo(arc, 0);
  //   path.lineTo(x - arc, 0);
  //   path.quadraticBezierTo(x,0, x, arc);
  //   path.lineTo(x, y - arc);
  //
  //
  //
  //   path.quadraticBezierTo(x, y, x - arc, y);
  //   path.lineTo(x/2 + arc, y);
  //   path.addArc(
  //     Rect.fromCircle(center: Offset(x / 2, y ), radius: arc),
  //     0, 3.14,
  //   );
  //   // path.quadraticBezierTo(x/2 +arc, y-arc, x/2, y-arc);
  //   // path.quadraticBezierTo(x/2 -arc, y-arc, x/2-arc, y);
  //   path.lineTo(arc, y);
  //   path.quadraticBezierTo(0, y, 0, y - arc);
  //   path.lineTo(0, arc);
  //   path.quadraticBezierTo(0, 0, arc, 0);
  //
  //   canvas.drawPath(path, _paint);
  //   canvas.drawPath(path, _borderPaint);
  // }
  void paint(Canvas canvas, Size size) {
    double x = size.width;
    double y = size.height;
    double arc = borderRadius;
    double yFactor = y * 0.4;
    double xFactor = x * 0.5;

    var path = Path();
    Matrix4.rotationX(180);
    path.moveTo(arc, 0);
    path.lineTo(x - arc, 0);
    path.quadraticBezierTo(x, 0, x, arc);
    path.lineTo(x, y - arc);
    path.quadraticBezierTo(x, y, x - arc, y);
    path.lineTo(x / 2 + arc, y);
    path.quadraticBezierTo(x / 2 + arc, y - arc, x / 2, y - arc);
    path.quadraticBezierTo(x / 2 - arc, y - arc, x / 2 - arc, y);
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
