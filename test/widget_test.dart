import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:task_manager_app/widgets/custom_text_field.dart';

void main() {
  testWidgets('custom text field renders label and icon', (
    WidgetTester tester,
  ) async {
    final controller = TextEditingController();

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: CustomTextField(
            controller: controller,
            label: 'Email',
            hint: 'Enter your email',
            prefixIcon: Icons.email_outlined,
          ),
        ),
      ),
    );

    expect(find.text('Email'), findsOneWidget);
    expect(find.text('Enter your email'), findsOneWidget);
    expect(find.byIcon(Icons.email_outlined), findsOneWidget);

    controller.dispose();
  });
}
