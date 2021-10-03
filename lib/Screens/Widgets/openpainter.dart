import "package:flutter/material.dart";
import 'dart:math';


class RadialPainter extends CustomPainter{

  final Color line1Color;
  final Color line2Color;
  final Color line3Color;
  final double width;
  final double percent1;
  final double percent2;
  final double percent3;

  RadialPainter( { required this.width, required this.percent1, required this.percent2, required this.percent3,required this.line1Color,required this.line2Color,required this.line3Color,});

  @override
  void paint(Canvas canvas, Size size) {


    Paint line1 =  Paint()
      ..color = line1Color
      ..strokeCap = StrokeCap.round
      ..style=PaintingStyle.stroke
      ..strokeWidth=width;
    Paint line2 =  Paint()
      ..color = line2Color
      ..strokeCap = StrokeCap.round
      ..style=PaintingStyle.stroke
      ..strokeWidth=width;
    Paint line3 =  Paint()
      ..color = line3Color
      ..strokeCap = StrokeCap.round
      ..style=PaintingStyle.stroke
      ..strokeWidth=width;


    double total = percent1+percent2+percent3;
    double area1 = percent1/total;
    double area2 = percent2/total;
    double area3 = percent3/total;
    Offset center= Offset(size.width/2, size.height/2);
    double radius= min(size.width/2, size.height/2);
    double sweepAngle1=2*pi*area1;
    double sweepAngle2=2*pi*area2 +sweepAngle1 ;
    double sweepAngle3=2*pi*area3 + sweepAngle2;

    canvas.drawArc(Rect.fromCircle(center: center, radius: radius),
        pi,
        sweepAngle3,
        false,
        line3);
    canvas.drawArc(Rect.fromCircle(center: center, radius: radius),
        pi,
        sweepAngle2,
        false,
        line2);
    canvas.drawArc(
        Rect.fromCircle(center: center, radius: radius),
        pi,
        sweepAngle1,
        false,
        line1
    );


}

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }


}