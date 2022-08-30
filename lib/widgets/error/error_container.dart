import 'package:flutter/material.dart';
import 'error_text.dart';

class ErrorContainer extends StatelessWidget {
  const ErrorContainer({
    Key? key,
    required this.messages,
    this.showAsterisk = false,
    this.showErrorIcon = false,
  }) : super(key: key);

  final Map<String, String> messages;
  final bool showAsterisk;
  final bool showErrorIcon;

  @override
  Widget build(BuildContext context) {
    return messages.isNotEmpty
        ? Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: List.generate(messages.entries.length, (index) {
              final message = messages.entries.elementAt(index);

              return ErrorText(
                text: message.value,
                showErrorIcon: showErrorIcon,
              );
            }),
          )
        : const SizedBox();
  }
}
