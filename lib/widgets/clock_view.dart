import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:todos_porto_2/app_resources.dart';

class ClockView extends StatefulWidget {
  final double? size;

  const ClockView({Key? key, this.size}) : super(key: key);

  @override
  _ClockViewState createState() => _ClockViewState();
}

class _ClockViewState extends State<ClockView> {
  late Timer timer;

  @override
  void initState() {
    this.timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {});
    });
    super.initState();
  }

  @override
  void dispose() {
    this.timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topCenter,
      child: Container(
        width: widget.size,
        height: widget.size,
        child: Transform.rotate(
          angle: -pi / 2,
          child: CustomPaint(
            painter: ClockPainter(context: context),
          ),
        ),
      ),
    );
  }
}

class ClockPainter extends CustomPainter {
  final BuildContext context;
  ClockPainter({required this.context});
  var dateTime = DateTime.now();

  //60sec - 360, 1 sec - 6degrees
  //60min - 360, 1 min - 6degrees
  //12hours - 360, 1 hour - 30degrees, 60min - 30degrees, 1 min - 0.5degrees

  @override
  void paint(Canvas canvas, Size size) {
    var centerX = size.width / 2;
    var centerY = size.height / 2;
    var center = Offset(centerX, centerY);
    var radius = min(centerX, centerY);

    var fillBrush = Paint()..color = colors(context).primaryCr;
    var outlineBrush = Paint()
      ..color = Colors.black
      ..style = PaintingStyle.stroke
      ..strokeWidth = size.width / 20;
    var moreOutlineBrush = Paint()
      ..color = colors(context).secondaryCr
      ..style = PaintingStyle.stroke
      ..strokeWidth = size.width / 20;
    var centerDotBrush = Paint()..color = colors(context).secondaryCr;

    var secHandBrush = Paint()
      ..color = colors(context).secondaryCr
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeWidth = size.width / 60;

    var minHandBrush = Paint()
      ..shader = RadialGradient(colors: [Colors.black, colors(context).secondaryCr])
          .createShader(Rect.fromCircle(center: center, radius: radius))
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeWidth = size.width / 30;

    var hourHandBrush = Paint()
      ..shader = const RadialGradient(colors: [Colors.black, Colors.black])
          .createShader(Rect.fromCircle(center: center, radius: radius))
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeWidth = size.width / 24;

    var dashBrush = Paint()
      ..color = colors(context).secondaryCr
      ..style = PaintingStyle.stroke
      ..strokeWidth = 3;

    canvas.drawCircle(center, radius * 0.95, fillBrush);
    canvas.drawCircle(center, radius * 0.85, moreOutlineBrush);
    
    canvas.drawCircle(center, radius * 0.93, outlineBrush);


    // Hour pointer
    var hourHandX = centerX + radius * 0.4 * cos((dateTime.hour * 30 + dateTime.minute * 0.5) * pi / 180);
    var hourHandY = centerY + radius * 0.4 * sin((dateTime.hour * 30 + dateTime.minute * 0.5) * pi / 180);
    canvas.drawLine(center, Offset(hourHandX, hourHandY), hourHandBrush);

    // Minute pointer
    var minHandX = centerX + radius * 0.55 * cos(dateTime.minute * 6 * pi / 180);
    var minHandY = centerY + radius * 0.55 * sin(dateTime.minute * 6 * pi / 180);
    canvas.drawLine(center, Offset(minHandX, minHandY), minHandBrush);

    // Second pointer
    var secHandX = centerX + radius * 0.65 * cos(dateTime.second * 6 * pi / 180);
    var secHandY = centerY + radius * 0.65 * sin(dateTime.second * 6 * pi / 180);
    canvas.drawLine(center, Offset(secHandX, secHandY), secHandBrush);

    // Center dot
    canvas.drawCircle(center, radius * 0.08, centerDotBrush);
    
    // Circle marker
    var outerRadius = radius * 0.7;
    var innerRadius = radius * 0.8;
    for (var i = 0; i < 360; i += 36) {
      var x1 = centerX + outerRadius * cos(i * pi / 180);
      var y1 = centerY + outerRadius * sin(i * pi / 180);

      var x2 = centerX + innerRadius * cos(i * pi / 180);
      var y2 = centerY + innerRadius * sin(i * pi / 180);
      canvas.drawLine(Offset(x1, y1), Offset(x2, y2), dashBrush);
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}