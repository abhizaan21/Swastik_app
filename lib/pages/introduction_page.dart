import 'package:flutter/material.dart';
import 'package:swastik_app/service/upload_service.dart';

class IntroductionPage extends StatelessWidget {
  const IntroductionPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image:AssetImage('assets/images/nari.jpeg'),fit: BoxFit.cover,
          )
        ),
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset('assets/images/romyschneider.jpg'),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              width: size.width * 0.75,
              child: const Text(
                "My memories mean a lot to me, and I hold them close to my heart.",
                style: TextStyle(color:Colors.black,
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Hurricane'),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              children: [
                const Spacer(),
                RawMaterialButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const ImageUploads()));
                  },
                  elevation: 2.0,
                  fillColor: Colors.deepPurpleAccent,
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
