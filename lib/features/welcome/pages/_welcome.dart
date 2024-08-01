import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:task_manager/features/welcome/widgets/_custom_textfield.dart';

import '../provider/_task_provider.dart';
import '../widgets/_body_widget.dart';
import '../widgets/_custom_elevated_button.dart';

class WelcomeScreen extends ConsumerWidget {
  WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context).colorScheme;
    final read = ref.watch(taskProivder);
    final write = ref.read(taskProivder);
    return Scaffold(
      backgroundColor: theme.surface,
      appBar: AppBar(
        backgroundColor: theme.primary,
        foregroundColor: theme.onPrimary,
        title: const Text('Task Manager'),
        centerTitle: true,
      ),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            const SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Expanded(
                  child: CustomTextField(
                    theme: theme,
                    controller: _controller,
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                CustomElevatedButton(
                  theme: theme,
                  onPressed: () {
                    String text = _controller.text.trim();
                    if (text.length > 0) {
                      write.addTasks({'task': text, 'created': DateTime.now()});
                      _controller.clear();
                    }
                  },
                )
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Expanded(
                child: BodyWidget(
              theme: theme,
            ))
          ],
        ),
      )),
    );
  }

  final TextEditingController _controller = TextEditingController();
}
