import 'package:flutter/material.dart';
import 'package:que_form/screens/starting_page.dart';
import 'package:que_form/widgets/que_mark.dart';
import 'package:que_form/widgets/questions.dart';

class Result extends StatefulWidget {
  const Result({Key? key}) : super(key: key);

  @override
  State<Result> createState() => _ResultState();
}

class _ResultState extends State<Result> {
  int sum = 0;
  @override
  void dispose() {
    myList.clear();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    for (int i = 0; i < questions.length; i++) {
      sum += myList[i];
    }
    //  myList.clear();
    debugPrint(sum.toString());
    // myList.forEach((e) => {
    //       sum = sum + e,
    //     });
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            sum > 70
                ? SizedBox(
                    height: 170,
                    width: 180,
                    child: Image.asset('assets/images/alert.gif'),
                  )
                : SizedBox(
                    height: 170,
                    width: 180,
                    child: Image.asset(
                      'assets/images/success-icon.gif',
                      fit: BoxFit.cover,
                    ),
                  ),
            const SizedBox(height: 30),
            sum > 70
                ? const Text(
                    'You Are At a Great Risk!!!',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                    ),
                  )
                : const Text(
                    'You are Certainly Safe. Do Take Care!!!',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                    ),
                  ),
            const SizedBox(height: 50),
            ElevatedButton(
                onPressed: () {
                  setState(() {
                    Navigator.of(context).pushReplacement(MaterialPageRoute(
                        builder: (ctx) => const StartingPage()));
                    grpValue = -1;
                  });
                },
                child: const Text('Reset'))
          ],
        ),
      ),
    );
  }
}
