import 'package:flutter/material.dart';

import 'package:quizz/models/quiz_model.dart';

class QuestionCard extends StatefulWidget {
  final Question question;

  const QuestionCard({Key? key, required this.question}) : super(key: key);

  @override
  State<QuestionCard> createState() => _QuestionCardState();
}

class _QuestionCardState extends State<QuestionCard> {
  int? selectedOptionId;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(8.0),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.question.description,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18.0,
              ),
            ),
            const SizedBox(height: 10.0),
            Column(
              children: widget.question.options.map((option) {
                return RadioListTile<int>(
                  title: Text(option
                      .description), // Use 'description' instead of 'text'
                  value: option.id,
                  groupValue: selectedOptionId,
                  onChanged: (value) {
                    setState(() {
                      selectedOptionId = value;
                      for (var opt in widget.question.options) {
                        opt.isSelected = opt.id == value;
                      }
                    });
                  },
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }
}
