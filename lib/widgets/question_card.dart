import 'package:flutter/material.dart';
import 'package:mentor_chatbot/models/question.model.dart';
import 'package:mentor_chatbot/widgets/question_response_dialog.dart';
import 'package:number_display/number_display.dart';

class QuestionCard extends StatefulWidget {
  QuestionCard({this.question});
  final Question question;
  @override
  State<StatefulWidget> createState() => new QuestionCardState();
}

class QuestionCardState extends State<QuestionCard> {
  final display = createDisplay(
    length: 3,
    decimal: 2,
  );

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Container(
        padding: EdgeInsets.fromLTRB(15, 15, 15, 5),
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Expanded(
                    child: Text(this.widget.question.questions[0]["body"])),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Text(display(this.widget.question.hotness)),
                      IconButton(
                        icon: Icon(Icons.whatshot),
                        onPressed: _handleHotnessChange,
                      ),
                    ],
                    mainAxisSize: MainAxisSize.min,
                  ),
                  IconButton(
                    icon: Icon(Icons.reply),
                    onPressed: () => showDialog(
                        context: context,
                        barrierDismissible: true,
                        builder: (context) {
                          return QuestionsResponseDialog(
                            question: widget.question,
                          );
                        }),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _handleHotnessChange() {}
}
