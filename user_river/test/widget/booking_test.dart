import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:mockito/annotations.dart';
import 'package:zemnanit/presentation/user_side/screens/appointments.dart';
import 'package:zemnanit/presentation/user_side/screens/booking.dart';
import 'package:zemnanit/presentation/user_side/screens/home.dart';
import 'package:zemnanit/presentation/user_side/screens/login_user.dart';
import 'package:zemnanit/presentation/user_side/screens/salonss.dart';
import 'package:zemnanit/presentation/user_side/services/auth_service.dart';
import 'package:zemnanit/presentation/user_side/providers/auth_provider.dart';

import 'booking_test.mocks.dart';
@GenerateMocks([AuthService])
void main() {
  group('ZemnanitDrop Widget Tests', () {
    late MockAuthService mockAuthService;
    late ProviderContainer container;

    setUp(() {
      mockAuthService = MockAuthService();
      container = ProviderContainer(
        overrides: [
          authServiceProvider.overrideWith((ref) => mockAuthService),
        ],
      );
    });

    Future<void> pumpZemnanitDropWidget(WidgetTester tester) async {
      await tester.pumpWidget(
        ProviderScope(
          overrides: [
            authServiceProvider.overrideWith((ref) => mockAuthService),
          ],
          child: MaterialApp(home: ZemnanitDrop()),
        ),
      );
    }

    testWidgets('Displays booking form', (WidgetTester tester) async {
      await pumpZemnanitDropWidget(tester);

      expect(find.text('Book a Salon'), findsOneWidget);
      expect(find.byType(TextField), findsNWidgets(2));
      expect(find.text('Select Time'), findsOneWidget);
      expect(find.text('Select a date:'), findsOneWidget);
      expect(find.text('Book'), findsOneWidget);
    });

    
  
  });
}
