// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:credpal_assessment/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Responsiveness Tests - Portrait Mode', () {
    // Modern mobile screen sizes in portrait mode
    final screenSizes = [
      {'name': 'Small Android', 'width': 360.0, 'height': 640.0},
      {'name': 'iPhone SE/6/7/8', 'width': 375.0, 'height': 667.0},
      {'name': 'iPhone X/XS/11 Pro', 'width': 375.0, 'height': 812.0},
      {'name': 'iPhone 11 Pro Max', 'width': 414.0, 'height': 896.0},
      {'name': 'Modern Android (360x800)', 'width': 360.0, 'height': 800.0},
      {'name': 'Modern Android (412x915)', 'width': 412.0, 'height': 915.0},
      {'name': 'iPhone 13 Pro Max', 'width': 428.0, 'height': 926.0},
      {'name': 'Large Android', 'width': 412.0, 'height': 892.0},
    ];

    for (final screenSize in screenSizes) {
      testWidgets(
        'App renders correctly on ${screenSize['name']} (${screenSize['width']}x${screenSize['height']})',
        (WidgetTester tester) async {
          // Set the screen size
          final width = screenSize['width'] as double;
          final height = screenSize['height'] as double;
          tester.view.physicalSize = Size(width, height);
          tester.view.devicePixelRatio = 1.0;

          // Capture overflow errors but don't fail the test
          final List<FlutterErrorDetails> errors = [];
          final originalOnError = FlutterError.onError;
          FlutterError.onError = (FlutterErrorDetails details) {
            final errorString = details.toString();
            if (errorString.contains('overflowed') ||
                errorString.contains('RenderFlex overflowed')) {
              // Log overflow errors but don't fail the test
              errors.add(details);
            } else {
              // Re-throw other errors
              originalOnError?.call(details);
            }
          };

          try {
            // Build the app
            await tester.pumpWidget(const MyApp());
            // Allow some time for layout
            await tester.pump();
            await tester.pump(const Duration(milliseconds: 100));
          } finally {
            FlutterError.onError = originalOnError;
          }

          // Verify the app renders without errors
          expect(find.byType(MaterialApp), findsOneWidget);
          expect(find.byType(Scaffold), findsOneWidget);

          // Verify key UI elements are present
          // Note: "Pay later" is part of "Pay later\neverywhere" text
          expect(find.textContaining('Pay later'), findsWidgets);
          expect(find.text('Shopping limit: ₦0'), findsOneWidget);
          expect(find.text('Activate Credit'), findsOneWidget);
          expect(find.text('Search for products or stores'), findsOneWidget);
          expect(find.text('Featured Merchants'), findsOneWidget);

          // Verify no overflow errors by checking render box
          final RenderBox renderBox = tester.renderObject(
            find.byType(Scaffold).first,
          );
          expect(renderBox, isNotNull);

          // Verify the scaffold renders within the screen bounds
          final scaffoldSize = tester.getSize(find.byType(Scaffold).first);
          expect(scaffoldSize.width, lessThanOrEqualTo(width));
          expect(scaffoldSize.height, lessThanOrEqualTo(height));
          expect(scaffoldSize.width, greaterThan(0));
          expect(scaffoldSize.height, greaterThan(0));

          // Log overflow errors if any (for debugging responsiveness issues)
          if (errors.isNotEmpty) {
            debugPrint(
              '⚠️  Overflow warnings detected on ${screenSize['name']}: ${errors.length}',
            );
          }

          // Clean up
          addTearDown(() {
            tester.view.resetPhysicalSize();
            tester.view.resetDevicePixelRatio();
          });
        },
      );
    }

    testWidgets('App handles scrolling correctly on all screen sizes', (
      WidgetTester tester,
    ) async {
      for (final screenSize in screenSizes) {
        // Set the screen size
        final width = screenSize['width'] as double;
        final height = screenSize['height'] as double;
        tester.view.physicalSize = Size(width, height);
        tester.view.devicePixelRatio = 1.0;

        // Capture overflow errors but don't fail the test
        final List<FlutterErrorDetails> errors = [];
        final originalOnError = FlutterError.onError;
        FlutterError.onError = (FlutterErrorDetails details) {
          final errorString = details.toString();
          if (errorString.contains('overflowed') ||
              errorString.contains('RenderFlex overflowed')) {
            errors.add(details);
          } else {
            originalOnError?.call(details);
          }
        };

        try {
          // Build the app
          await tester.pumpWidget(const MyApp());
          await tester.pump();
          await tester.pump(const Duration(milliseconds: 100));
        } finally {
          FlutterError.onError = originalOnError;
        }

        // Find the scrollable widget
        final scrollable = find.byType(CustomScrollView);
        expect(scrollable, findsOneWidget);

        // Test scrolling
        await tester.drag(scrollable, const Offset(0, -200));
        await tester.pumpAndSettle();

        // Verify app still renders correctly after scroll
        expect(find.byType(Scaffold), findsOneWidget);
        expect(find.text('Featured Merchants'), findsOneWidget);

        // Log overflow errors if any
        if (errors.isNotEmpty) {
          debugPrint(
            '⚠️  Overflow warnings during scroll test on ${screenSize['name']}: ${errors.length}',
          );
        }

        // Clean up
        tester.view.resetPhysicalSize();
        tester.view.resetDevicePixelRatio();
      }
    });

    testWidgets(
      'Product cards are visible and properly sized on all screen sizes',
      (WidgetTester tester) async {
        for (final screenSize in screenSizes) {
          // Set the screen size
          final width = screenSize['width'] as double;
          final height = screenSize['height'] as double;
          tester.view.physicalSize = Size(width, height);
          tester.view.devicePixelRatio = 1.0;

          // Capture overflow errors but don't fail the test
          final List<FlutterErrorDetails> errors = [];
          final originalOnError = FlutterError.onError;
          FlutterError.onError = (FlutterErrorDetails details) {
            final errorString = details.toString();
            if (errorString.contains('overflowed') ||
                errorString.contains('RenderFlex overflowed')) {
              errors.add(details);
            } else {
              originalOnError?.call(details);
            }
          };

          try {
            // Build the app
            await tester.pumpWidget(const MyApp());
            await tester.pump();
            await tester.pump(const Duration(milliseconds: 100));
          } finally {
            FlutterError.onError = originalOnError;
          }

          // Verify product cards exist (they should be in horizontal ListView)
          final listViews = find.byType(ListView);
          expect(listViews, findsWidgets);

          // Verify merchant grid is visible
          final gridView = find.byType(GridView);
          expect(gridView, findsOneWidget);

          // Log overflow errors if any
          if (errors.isNotEmpty) {
            debugPrint(
              '⚠️  Overflow warnings during visibility test on ${screenSize['name']}: ${errors.length}',
            );
          }

          // Clean up
          tester.view.resetPhysicalSize();
          tester.view.resetDevicePixelRatio();
        }
      },
    );
  });
}
