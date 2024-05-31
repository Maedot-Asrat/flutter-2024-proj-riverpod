import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:http/http.dart' as http;
import 'package:zemnanit/presentation/admin_side/screens/admin_dashboard.dart';
import 'package:zemnanit/presentation/admin_side/screens/login_admin.dart';
import 'package:zemnanit/presentation/user_side/screens/home.dart';
import 'package:zemnanit/presentation/user_side/screens/login_user.dart';
import 'package:zemnanit/presentation/user_side/screens/booking.dart';
import 'package:zemnanit/presentation/user_side/services/auth_service.dart';
import 'package:zemnanit/presentation/user_side/providers/auth_provider.dart';
import 'package:mockito/annotations.dart';
import 'dart:convert';

import 'app_test.mocks.dart';  // Adjust the import according to your test file location

@GenerateMocks([http.Client, AuthService])
void main() {
  group('Integration Tests for Zemnanit App', () {
    late MockClient mockClient;
    late MockAuthService mockAuthService;
    late ProviderContainer container;

    setUp(() {
      mockClient = MockClient();
      mockAuthService = MockAuthService();
      container = ProviderContainer(
        overrides: [
          authServiceProvider.overrideWith((ref) => AuthService(client: mockClient)),
        ],
      );
    });

    Future<void> pumpApp(WidgetTester tester, Widget home) async {
      await tester.pumpWidget(
        ProviderScope(
          overrides: [
            authServiceProvider.overrideWith((ref) => AuthService(client: mockClient)),
          ],
          child: MaterialApp(home: home),
        ),
      );
      await tester.pump(); // Add pump to ensure widget is fully built
    }

    testWidgets('User Login Flow', (WidgetTester tester) async {
      // Mock the HTTP response for user login
      when(mockClient.post(
        any,
        headers: anyNamed('headers'),
        body: anyNamed('body'),
      )).thenAnswer((_) async => http.Response(jsonEncode({'access_token': 'dummy_token'}), 200));

      // Start from User Login screen
      await pumpApp(tester, Log_in());

      // Enter email and password
      await tester.enterText(find.byType(TextField).at(0), 'test@example.com');
      await tester.enterText(find.byType(TextField).at(1), 'password');
      await tester.tap(find.byKey(ValueKey('loginButton')));
      await tester.pumpAndSettle();

      // Verify navigation to Home screen
      expect(find.byType(Home), findsOneWidget);
    });

   
    testWidgets('Booking Form Flow', (WidgetTester tester) async {
      // Navigate to Booking screen
      await pumpApp(tester, ZemnanitDrop());

      // Verify the presence of booking form elements
      expect(find.text('Book a Salon'), findsOneWidget);
      expect(find.byType(TextField), findsNWidgets(2));
      expect(find.text('Select Time'), findsOneWidget);
      expect(find.text('Select a date:'), findsOneWidget);
      expect(find.text('Book'), findsOneWidget);

      // Enter booking details
      await tester.enterText(find.byType(TextField).at(0), 'Client Name');
      await tester.enterText(find.byType(TextField).at(1), 'Service Details');
      await tester.tap(find.text('Select Time'));
      await tester.tap(find.text('Select a date:'));
      await tester.tap(find.text('Book'));
      await tester.pumpAndSettle();

      // Verify the booking is successful (Here you should add more logic depending on your app's behavior after booking)
    });
  });
}
