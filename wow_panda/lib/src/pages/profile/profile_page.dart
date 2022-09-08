import 'dart:io';

import 'package:flutter/material.dart';

// main isolate
// isolate

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  bool loading = true;
  late File file;

  void downloadFile() async {
    // Directory dir = await getApplicationDocumentsDirectory();
    // //
    // file = File("$dir/cat.json");
    // if (!file.existsSync()) {
    //   await file.create(recursive: true);
    //   await file.writeAsString(jsonEncode({"id": "123"}));
    // }
    // setState(() {
    //   loading = false;
    // });
    //
  }

  @override
  void initState() {
    downloadFile();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: TweenAnimationBuilder<double>(
            duration: const Duration(seconds: 2),
            tween: Tween<double>(begin: 0.0, end: 255.0),
            builder: (context, value, _) {
              return CustomPaint(
                painter: Painter(value.toInt()),
                child: const SizedBox(
                  // color: Colors.red,
                  width: 200,
                  height: 200,
                ),
              );
            }),
      ),
    );
  }
}

class Painter extends CustomPainter {
  final int color;

  Painter(this.color);
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = Color.fromRGBO(color, 0, 0, 1.0)
      ..style = PaintingStyle.fill;
    canvas.drawCircle(Offset.zero, 100, paint);
    // canvas.pa
    // Triangle triangle = Triangle();
    // canvas.drawPath(triangle.getClip(size), paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class Triangle extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.moveTo(0, 0);
    path.lineTo(size.width, size.height);
    path.quadraticBezierTo(
      size.width - 20,
      20,
      size.width / 2,
      0,
    );
    path.lineTo(0, size.height);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper oldClipper) {
    return true;
  }
}
