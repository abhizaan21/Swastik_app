import 'package:flutter/material.dart';
import 'package:swastik_app/pages/home_page.dart';
import 'package:swastik_app/ui_colors/colors.dart';

class IntroductionPage extends StatelessWidget {
  const IntroductionPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset('assets/images/intro.jpg'),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              width: size.width * 0.75,
              child: const Text(
                "21 Days Fitness Challenges",
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              "Fitness is not a destination. It’s a way of life.",
              style: TextStyle(color: Colors.black, height: 1.5),
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              children: [
                const Spacer(),
                RawMaterialButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => const Home()));
                  },
                  elevation: 2.0,
                  fillColor: UIcolor.primary,
                  child: const Icon(
                    Icons.arrow_forward_ios_sharp,
                    color: Colors.white,
                  ),
                  padding: const EdgeInsets.all(15),
                  shape: const CircleBorder(),
                )
              ],
            ),
            const SizedBox(
              height: 60,
            )
          ],
        ),
      ),
    );
  }
}