import 'package:concentric_transition/page_view.dart';
import 'package:flutter/material.dart';
import 'package:ship_app/view/pages/auth/login/login_screen.dart';

final pages = [
  PageData(
    description:
        "The application to ship orders by sending a picture of an order",
    title: "SHIPMENT",
    bgColor: const Color.fromARGB(255, 69, 36, 127),
    textColor: Colors.amberAccent,
    images: Image.asset("asset/image/tracking.png"),
  ),
  PageData(
    images: Image.asset("asset/image/order.png"),
    title: "SHIPMENT",
    description: "The user follows up on his requests and can modify them",
    textColor: Colors.black,
    bgColor: Colors.teal,
  ),
  PageData(
    images: Image.asset("asset/image/food.png"),
    title: "SHIPMENT",
    description:
        "The user can follow up the request and know the stage it has reached",
    bgColor: Colors.blueAccent,
  ),
];

class OnboardingExample extends StatelessWidget {
  const OnboardingExample({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: ConcentricPageView(
        onFinish: () {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => LoginScreen(),
            ),
          );
        },
        colors: pages.map((p) => p.bgColor).toList(),
        radius: screenWidth * 0.1,
        // curve: Curves.ease,
        nextButtonBuilder: (context) => Padding(
          padding: const EdgeInsets.only(left: 3), // visual center
          child: Icon(
            Icons.navigate_next,
            size: screenWidth * 0.08,
          ),
        ),

        physics: const NeverScrollableScrollPhysics(),

        itemBuilder: (index) {
          final page = pages[index % pages.length];
          return SafeArea(
            child: _Page(page: page),
          );
        },
      ),
    );
  }
}

class PageData {
  final String? title;
  final String? description;
  final IconData? icon;
  final Color bgColor;
  final Color textColor;
  final Image images;

  const PageData(
      {this.description,
      this.title,
      this.icon,
      this.bgColor = Colors.white,
      this.textColor = Colors.black,
      required this.images});
}

class _Page extends StatelessWidget {
  final PageData page;

  const _Page({Key? key, required this.page}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    space(double p) => SizedBox(height: screenHeight * p / 100);
    return Column(
      children: [
        space(10),
        _Image(
          page: page,
          imagesize: 190,
          image: '',
        ),
        space(5),
        _Text(
          page: page,
          style: const TextStyle(),
        ),
      ],
    );
  }
}

class _Text extends StatelessWidget {
  const _Text({
    Key? key,
    required this.page,
    this.style,
  }) : super(key: key);

  final PageData page;
  final TextStyle? style;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          page.title ?? '',
          style: TextStyle(
            color: page.textColor,
            fontWeight: FontWeight.bold,
            fontFamily: 'Lato',
            letterSpacing: 0.0,
            fontSize: 55,
            height: 1.2,
          ).merge(style),
          textAlign: TextAlign.center,
        ),
        const SizedBox(
          height: 40,
        ),
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: Text(
            page.description ?? '',
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w500,
              letterSpacing: 0.0,
              fontSize: 33,
              height: 1.2,
            ).merge(style),
            textAlign: TextAlign.center,
          ),
        )
      ],
    );
  }
}

class _Image extends StatelessWidget {
  const _Image({
    Key? key,
    required this.page,
    required this.imagesize,
    required this.image,
  }) : super(key: key);

  final PageData page;
  final double imagesize;
  final String image;

  @override
  Widget build(BuildContext context) {
    // const bgColor =
    // Color(0xFFCAB19B);
    // Color(0xFF4A756E);
    // Color(0xFFCAB19B).withBlue(page.bgColor.blue - 40);
    //     .withGreen(page.bgColor.green + 20)
    //     .withRed(page.bgColor.red - 100)
    //     .withAlpha(90);

    // const icon1Color =
    // Color(0xFFCAB19B);
    // const icon2Color =  Color(0xFF1B4B43);

    const icon3Color = Color(0xFF575756);

//////////////////////////////////////////////////////////////////
    // final icon3Color = page.bgColor.withRed(111).withGreen(220
/////////////////////////////////////////////////////////////////

    return Container(
      width: imagesize,
      height: imagesize,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(60.0)),
        // color: bgColor,
      ),
      child: Stack(
        clipBehavior: Clip.none,
        fit: StackFit.expand,
        children: [
          Positioned.fill(
            child: RotatedBox(
              quarterTurns: 0,
              child: page.images,

              // page.icon,
              // size: iconSize + 20,
              // color: icon1Color,
            ),
          ),
          Icon(
            page.icon,
            // size: iconSize,
            color: icon3Color,
          ),
        ],
      ),
    );
  }
}
