import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:que_form/screens/result.dart';
import 'package:que_form/widgets/que_mark.dart';
import 'package:que_form/widgets/questions.dart';

class StartingPage extends StatefulWidget {
  const StartingPage({Key? key}) : super(key: key);

  @override
  State<StartingPage> createState() => _StartingPageState();
}

class _StartingPageState extends State<StartingPage> {
  int _queIndex = -1;

  void nextQue() {
    _queIndex = _queIndex++;
  }

  @override
  Widget build(BuildContext context) {
    debugPrint('Starting Page');
    return Scaffold(
      backgroundColor: Colors.cyan[200],
      appBar: AppBar(
          title: const Text('Question Form'),
          backgroundColor: Colors.transparent),
      body: Stack(
        children: [
          _queIndex + 2 < 13
              ? Positioned(
                  top: 30,
                  left: 50,
                  child: Text(
                    'QUESTIONS ${_queIndex + 2} / 12',
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                    ),
                  ))
              : Container(),
          _queIndex + 2 < 13
              ? Positioned(
                  top: 90,
                  left: 50,
                  child: LinearPercentIndicator(
                    width: 250,
                    lineHeight: 25,
                    backgroundColor: Colors.white54,
                    progressColor: Colors.deepOrange[100],
                    percent: (_queIndex + 2) / 12,
                    animation: true,
                  ))
              : Container(),
          Positioned(
            bottom: 150,
            right: 85,
            child: Container(
              width: 190,
              height: 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.white38,
              ),
            ),
          ),
          Positioned(
            bottom: 170,
            right: 70,
            child: Container(
              width: 220,
              height: 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.white54,
              ),
            ),
          ),
          Positioned(
            bottom: 190,
            right: 55,
            child: Container(
              width: 250,
              height: 350,
              padding: const EdgeInsets.only(top: 20, left: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.white,
              ),
              child: _queIndex++ < questions.length - 1
                  ? QueMark(_queIndex, nextQue, questions)
                  : const Result(),
            ),
          ),
          (_queIndex + 1) > 12
              ? Container()
              : Positioned(
                  bottom: 60,
                  right: 110,
                  child: GestureDetector(
                    onTap: () {
                      if (grpValue == -1) {
                        showDialog(
                          context: context,
                          builder: (ctx) => AlertDialog(
                            content: const Text('Plz Select One Option'),
                            title: const Text('Invalid Choice!'),
                            actions: [
                              ElevatedButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                child: const Text(
                                  'Okay',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 16),
                                ),
                                style: ElevatedButton.styleFrom(
                                    primary: Colors.purple[400]),
                              ),
                            ],
                          ),
                        );
                      } else {
                        var score = (questions[_queIndex]['answer']
                            as List)[grpValue]['score'];
                        myList.add(score);
                        (_queIndex + 1) == 12
                            ? Navigator.of(context).push(MaterialPageRoute(
                                builder: (ctx) => const Result()))
                            : setState(() {
                                grpValue = -1;
                              });
                      }
                    },
                    child: Container(
                      height: 60,
                      width: 160,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                          color: Colors.orange[800]),
                      child: Center(
                        child: Text(
                          (_queIndex + 1) == 12 ? 'SUBMIT' : 'NEXT!',
                          style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 18),
                        ),
                      ),
                    ),
                  )),
        ],
      ),
    );
  }
}
