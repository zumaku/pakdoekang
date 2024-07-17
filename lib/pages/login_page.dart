import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pakdoekang/widgets/buttons/reguler_btn.dart';
import 'package:pakdoekang/widgets/styles/my_colors.dart';
import 'package:pakdoekang/widgets/styles/my_text.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            color: MyColor.base5,
            child: Stack(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(height: 60),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        MyText.headingSix("Pak", color: Colors.white),
                        MyText.headingSix("doe", color: MyColor.brand3),
                        MyText.headingSix("kang", color: Colors.white),
                      ],
                    ),
                    SizedBox(height: 50),
                    Column(
                      children: [
                        MyText.headingFour("Belanja mudah,",
                            color: Colors.white),
                        MyText.headingFour("catat, dan juga lacak",
                            color: Colors.white),
                        MyText.headingFour("keuanganmu.",
                            color: MyColor.brand3),
                      ],
                    ),
                  ],
                ),
                Positioned(
                    bottom: MediaQuery.of(context).size.height / 4.7,
                    right: 0,
                    left: 0,
                    child: Padding(
                        padding: EdgeInsets.all(20),
                        child: SvgPicture.asset(
                            "assets/images/Illustration.svg"))),
                Positioned(
                  bottom: 0,
                  child: ClipRRect(
                    child: ClipPath(
                      clipper: SvgClipper(),
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height / 2.7,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                Positioned(
                    bottom: 60,
                    left: 0,
                    right: 0,
                    child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 50),
                        child: MyRegulerBtn.largeBrand(
                            text: "Mulai Sekarang", isFullWidth: false)))
              ],
            )));
  }
}

class SvgClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.moveTo(0, 1.04712);
    path.lineTo(0, size.height);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 0);
    path.cubicTo(
        size.width * 0.873947,
        size.height * 0.171286,
        size.width * 0.695711,
        size.height * 0.278672,
        size.width * 0.498684,
        size.height * 0.278672);
    path.cubicTo(size.width * 0.302956, size.height * 0.278672,
        size.width * 0.125418, size.height * 0.172827, 0, 1.04712);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
