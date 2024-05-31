// Mocks generated by Mockito 5.4.4 from annotations
// in zemnanit/test/booking_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i7;

import 'package:flutter_riverpod/flutter_riverpod.dart' as _i6;
import 'package:http/http.dart' as _i2;
import 'package:mockito/mockito.dart' as _i1;
import 'package:mockito/src/dummies.dart' as _i5;
import 'package:state_notifier/state_notifier.dart' as _i8;
import 'package:zemnanit/presentation/user_side/models/auth_state.dart' as _i3;
import 'package:zemnanit/presentation/user_side/services/auth_service.dart'
    as _i4;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: deprecated_member_use
// ignore_for_file: deprecated_member_use_from_same_package
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

class _FakeClient_0 extends _i1.SmartFake implements _i2.Client {
  _FakeClient_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeAuthState_1 extends _i1.SmartFake implements _i3.AuthState {
  _FakeAuthState_1(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [AuthService].
///
/// See the documentation for Mockito's code generation for more information.
class MockAuthService extends _i1.Mock implements _i4.AuthService {
  MockAuthService() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i2.Client get client => (super.noSuchMethod(
        Invocation.getter(#client),
        returnValue: _FakeClient_0(
          this,
          Invocation.getter(#client),
        ),
      ) as _i2.Client);

  @override
  String get baseUrl => (super.noSuchMethod(
        Invocation.getter(#baseUrl),
        returnValue: _i5.dummyValue<String>(
          this,
          Invocation.getter(#baseUrl),
        ),
      ) as String);

  @override
  set onError(_i6.ErrorListener? _onError) => super.noSuchMethod(
        Invocation.setter(
          #onError,
          _onError,
        ),
        returnValueForMissingStub: null,
      );

  @override
  bool get mounted => (super.noSuchMethod(
        Invocation.getter(#mounted),
        returnValue: false,
      ) as bool);

  @override
  _i7.Stream<_i3.AuthState> get stream => (super.noSuchMethod(
        Invocation.getter(#stream),
        returnValue: _i7.Stream<_i3.AuthState>.empty(),
      ) as _i7.Stream<_i3.AuthState>);

  @override
  _i3.AuthState get state => (super.noSuchMethod(
        Invocation.getter(#state),
        returnValue: _FakeAuthState_1(
          this,
          Invocation.getter(#state),
        ),
      ) as _i3.AuthState);

  @override
  set state(_i3.AuthState? value) => super.noSuchMethod(
        Invocation.setter(
          #state,
          value,
        ),
        returnValueForMissingStub: null,
      );

  @override
  _i3.AuthState get debugState => (super.noSuchMethod(
        Invocation.getter(#debugState),
        returnValue: _FakeAuthState_1(
          this,
          Invocation.getter(#debugState),
        ),
      ) as _i3.AuthState);

  @override
  bool get hasListeners => (super.noSuchMethod(
        Invocation.getter(#hasListeners),
        returnValue: false,
      ) as bool);

  @override
  _i7.Future<void> signup(
    String? email,
    String? password,
    String? fullname,
    String? age,
  ) =>
      (super.noSuchMethod(
        Invocation.method(
          #signup,
          [
            email,
            password,
            fullname,
            age,
          ],
        ),
        returnValue: _i7.Future<void>.value(),
        returnValueForMissingStub: _i7.Future<void>.value(),
      ) as _i7.Future<void>);

  @override
  _i7.Future<void> login(
    String? email,
    String? password,
  ) =>
      (super.noSuchMethod(
        Invocation.method(
          #login,
          [
            email,
            password,
          ],
        ),
        returnValue: _i7.Future<void>.value(),
        returnValueForMissingStub: _i7.Future<void>.value(),
      ) as _i7.Future<void>);

  @override
  _i7.Future<void> bookSalon(
    String? hairstyle,
    String? date,
    String? time,
    String? comment,
  ) =>
      (super.noSuchMethod(
        Invocation.method(
          #bookSalon,
          [
            hairstyle,
            date,
            time,
            comment,
          ],
        ),
        returnValue: _i7.Future<void>.value(),
        returnValueForMissingStub: _i7.Future<void>.value(),
      ) as _i7.Future<void>);

  @override
  _i7.Future<void> fetchAppointments() => (super.noSuchMethod(
        Invocation.method(
          #fetchAppointments,
          [],
        ),
        returnValue: _i7.Future<void>.value(),
        returnValueForMissingStub: _i7.Future<void>.value(),
      ) as _i7.Future<void>);

  @override
  _i7.Future<void> fetchSalons() => (super.noSuchMethod(
        Invocation.method(
          #fetchSalons,
          [],
        ),
        returnValue: _i7.Future<void>.value(),
        returnValueForMissingStub: _i7.Future<void>.value(),
      ) as _i7.Future<void>);

  @override
  _i7.Future<void> editAppointment(
    String? id,
    String? hairstyle,
    String? date,
    String? time,
    String? comment,
  ) =>
      (super.noSuchMethod(
        Invocation.method(
          #editAppointment,
          [
            id,
            hairstyle,
            date,
            time,
            comment,
          ],
        ),
        returnValue: _i7.Future<void>.value(),
        returnValueForMissingStub: _i7.Future<void>.value(),
      ) as _i7.Future<void>);

  @override
  _i7.Future<void> deleteAppointment(String? id) => (super.noSuchMethod(
        Invocation.method(
          #deleteAppointment,
          [id],
        ),
        returnValue: _i7.Future<void>.value(),
        returnValueForMissingStub: _i7.Future<void>.value(),
      ) as _i7.Future<void>);

  @override
  _i7.Future<void> updatePassword(
    String? newPassword,
    dynamic oldPassword,
  ) =>
      (super.noSuchMethod(
        Invocation.method(
          #updatePassword,
          [
            newPassword,
            oldPassword,
          ],
        ),
        returnValue: _i7.Future<void>.value(),
        returnValueForMissingStub: _i7.Future<void>.value(),
      ) as _i7.Future<void>);

  @override
  _i7.Future<void> deleteUser() => (super.noSuchMethod(
        Invocation.method(
          #deleteUser,
          [],
        ),
        returnValue: _i7.Future<void>.value(),
        returnValueForMissingStub: _i7.Future<void>.value(),
      ) as _i7.Future<void>);

  @override
  void logout() => super.noSuchMethod(
        Invocation.method(
          #logout,
          [],
        ),
        returnValueForMissingStub: null,
      );

  @override
  bool updateShouldNotify(
    _i3.AuthState? old,
    _i3.AuthState? current,
  ) =>
      (super.noSuchMethod(
        Invocation.method(
          #updateShouldNotify,
          [
            old,
            current,
          ],
        ),
        returnValue: false,
      ) as bool);

  @override
  _i6.RemoveListener addListener(
    _i8.Listener<_i3.AuthState>? listener, {
    bool? fireImmediately = true,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #addListener,
          [listener],
          {#fireImmediately: fireImmediately},
        ),
        returnValue: () {},
      ) as _i6.RemoveListener);

  @override
  void dispose() => super.noSuchMethod(
        Invocation.method(
          #dispose,
          [],
        ),
        returnValueForMissingStub: null,
      );
}
