import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:swastik_app/pages/introduction_page.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';
import '../ui_colors/colors.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home Page"),
        backgroundColor: Colors.orange,
        actions: <Widget>[
          IconButton(
            icon: const Icon(
              Icons.exit_to_app,
              color: Colors.white,
            ),
            onPressed: () {
              FirebaseAuth auth = FirebaseAuth.instance;
              auth.signOut().then((res) {
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const IntroductionPage()),
                    (Route<dynamic> route) => false);
              });
            },
          )
        ],
      ),
      body: Container(
        color: Colors.white,
        child: ListView(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text("Today"),
                  Text(
                    "February 07, 2021",
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(6),
                          decoration: const BoxDecoration(
                              shape: BoxShape.circle, color: Colors.deepOrange),
                          child: const Icon(
                            Icons.favorite_border,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const Text(
                          "Heart",
                          style: TextStyle(fontSize: 16.0),
                        ),
                        const Text(
                          "80",
                          style: TextStyle(fontSize: 20),
                        ),
                        const Text(
                          "Per min",
                          style: TextStyle(fontSize: 12.0),
                        )
                      ],
                    ),
                  ),
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      decoration: BoxDecoration(
                        border: Border.all(color: UIcolor.secondary),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(30)),
                      ),
                      child: Column(
                        children: [
                          Container(
                            padding: const EdgeInsets.all(6),
                            decoration: const BoxDecoration(
                                shape: BoxShape.circle, color: UIcolor.primary),
                            child: const Icon(
                              Icons.local_fire_department_sharp,
                              color: Colors.white,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          const Text(
                            "Calories",
                            style: TextStyle(fontSize: 16.0),
                          ),
                          const Text(
                            "950",
                            style: TextStyle(fontSize: 20),
                          ),
                          const Text(
                            "Kcal",
                            style: TextStyle(fontSize: 12.0),
                          )
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: Column(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(6),
                          decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.orangeAccent),
                          child: const Icon(
                            Icons.nightlight_round,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const Text(
                          "Sleep",
                          style: TextStyle(fontSize: 16.0),
                        ),
                        const Text(
                          "8:30",
                          style: TextStyle(fontSize: 20),
                        ),
                        const Text(
                          "Hours",
                          style: TextStyle(fontSize: 12.0),
                        )
                      ],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(6),
                          decoration: const BoxDecoration(
                              shape: BoxShape.circle, color: Colors.deepPurple),
                          child: const Icon(
                            Icons.timer_sharp,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const Text(
                          "Training",
                          style: TextStyle(fontSize: 16.0),
                        ),
                        const Text(
                          "2:00",
                          style: TextStyle(fontSize: 20),
                        ),
                        const Text(
                          "Hours",
                          style: TextStyle(fontSize: 12.0),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            SizedBox(
              height: 200,
              width: 200,
              child: SfRadialGauge(
                axes: <RadialAxis>[
                  RadialAxis(
                    axisLineStyle: const AxisLineStyle(
                        thickness: 0.2,
                        thicknessUnit: GaugeSizeUnit.factor,
                        cornerStyle: CornerStyle.bothCurve),
                    showTicks: false,
                    showLabels: false,
                    onAxisTapped: (value) {},
                    pointers: <GaugePointer>[
                      RangePointer(
                          color: UIcolor.secondary,
                          value: 60,
                          onValueChanged: (value) {},
                          cornerStyle: CornerStyle.bothCurve,
                          onValueChangeEnd: (value) {},
                          onValueChanging: (value) {},
                          enableDragging: true,
                          width: 0.2,
                          sizeUnit: GaugeSizeUnit.factor)
                    ],
                    annotations: <GaugeAnnotation>[
                      GaugeAnnotation(
                        widget: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Text(
                              "2.0",
                              style: TextStyle(
                                  fontSize: 25, fontWeight: FontWeight.bold),
                            ),
                            Text(
                              "KM",
                              style: TextStyle(
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                        positionFactor: 0.13,
                        angle: 0.5,
                      )
                    ],
                  ),
                ],
              ),
            ),
            Container(
              height: 60,
              transform: Matrix4.translationValues(0.0, -60, 0.0),
              child: Image.asset('assets/images/marathon.jpg'),
            ),
          ],
        ),
      ),
    );
  }
}
