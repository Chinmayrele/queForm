import 'package:flutter/material.dart';
import 'package:que_form/widgets/question.dart';

// int group = 0;

class QueMark extends StatefulWidget {
  // const QueMark({Key? key}) : super(key: key);
  final int queIndex;
  final Function nextQue;
  final List<Map<String, Object>> questions;

  const QueMark(this.queIndex, this.nextQue, this.questions);

  @override
  State<QueMark> createState() => _QueMarkState();
}

var grpValue = -1;

class _QueMarkState extends State<QueMark> {
  // var vals = 0;
  // @override
  // void dispose() {
  //   grpValue = -1;
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    debugPrint('Que-Mark');

    // debugPrint(queIndex.toString());

    return Column(
      children: [
        Question(widget.questions[widget.queIndex]['queText'].toString()),
        const SizedBox(height: 30),
        // ...(questions[queIndex]['answer'] as List)
        //     .map((e) =>
        //         Answer(e['text'], () => nextQue, queIndex, group++, grpValue))
        //     .toList(),
        SizedBox(
          height: 195,
          width: double.infinity,
          // margin: const EdgeInsets.only(right: 10, bottom: 10),
          child: ListView.builder(
            itemBuilder: (ctx, index) => Container(
              height: 55,
              width: double.infinity,
              margin: const EdgeInsets.only(right: 10, bottom: 10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.blue[100]),
              child: RadioListTile(
                // key: ValueKey(widget.queIndex),
                groupValue: grpValue,
                value: index,
                onChanged: (val) {
                  debugPrint('Group Value is ' + val.toString());
                  setState(() {
                    grpValue = val as int;
                  });
                },
                controlAffinity: ListTileControlAffinity.trailing,
                title: Text(
                  (widget.questions[widget.queIndex]['answer'] as List)[index]
                      ['text'],
                  style: const TextStyle(
                    // backgroundColor: Colors.blueAccent,
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            itemCount:
                (widget.questions[widget.queIndex]['answer'] as List).length,
          ),
        ),
      ],
    );
  }
}
