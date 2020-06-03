import 'package:flutter/material.dart';

import 'package:flutter_test/flutter_test.dart';

import 'package:expandable/expandable.dart';
import 'package:expandable/expandable_constants.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  group('Expandable widget test', () {
    testWidgets('should render correctly', (WidgetTester tester) async {
      // Given
      final childWidget = Container(
        child: Text('Lorem ipsum dolor sit amet, consectetur '
            'adipiscing elit.'),
      );

      final expandableWidget = ExpandableWidget(
        title: 'This is title',
        child: childWidget,
      );

      // When
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: expandableWidget,
          ),
        ),
      );

      // Then
      expect(find.byKey(const ValueKey(ExpandableKey.rootKey)), findsOneWidget);
      expect(
          find.byKey(const ValueKey(ExpandableKey.headerKey)), findsOneWidget);
      expect(
          find.byKey(const ValueKey(ExpandableKey.childKey)), findsOneWidget);
      expect(
          find.byKey(const ValueKey(ExpandableKey.titleKey)), findsOneWidget);
      expect(
          find.byKey(const ValueKey(ExpandableKey.arrowKey)), findsOneWidget);
    });
  });
}
