import 'package:flutter/material.dart';

class Answer extends StatefulWidget {
  // const Answer({Key? key}) : super(key: key);
  final String option;
  final Function answer;
  final int queIndex;
  final int group;
  int grpValue;
  Answer(
    this.option,
    this.answer,
    this.queIndex,
    this.group,
    this.grpValue,
  );

  @override
  State<Answer> createState() => _AnswerState();
}

class _AnswerState extends State<Answer> {
  int groups = -1;
  @override
  Widget build(BuildContext context) {
    debugPrint('Answer Page');
    debugPrint(widget.group.toString());
    return Container(
      height: 55,
      width: double.infinity,
      margin: const EdgeInsets.only(right: 10, bottom: 10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10), color: Colors.blue[100]),
      child: RadioListTile(
        groupValue: widget.grpValue,
        value: widget.group,
        onChanged: (val) {
          debugPrint('Group Value is ' + val.toString());
          setState(() {
            widget.grpValue = val as int;
          });
        },
        controlAffinity: ListTileControlAffinity.trailing,
        title: Text(
          widget.option,
          style: const TextStyle(
            // backgroundColor: Colors.blueAccent,
            color: Colors.black,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
