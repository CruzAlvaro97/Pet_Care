import 'package:flutter/material.dart';
import 'package:pet_society/src/utils/index_utils.dart';
import 'package:pet_society/src/views/widget/decoration_widget/container_decoration_widget.dart';

class QuestionItemWidget extends StatelessWidget {
  final String question;
  final String answer;

  const QuestionItemWidget({
    super.key,
    required this.question,
    required this.answer,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: containerDecoration(),
      child: Column(
        children: [
          ExpansionTile(
            childrenPadding:
                const EdgeInsets.only(left: 15, right: 15, bottom: 15),
            textColor: CustomColor.primary,
            iconColor: CustomColor.primary,
            title: Text(
              question,
              style: CustomTextStyle.questionText,
            ),
            children: [
              Text(
                answer,
                style: CustomTextStyle.questionText,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
