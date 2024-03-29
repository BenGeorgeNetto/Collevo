import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collevo/services/auth/auth_provider.dart';
import 'package:collevo/services/auth/auth_service.dart';
import 'package:collevo/services/auth/auth_user.dart';
import 'package:collevo/services/preferences/preferences_service.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart' show immutable;

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc(AuthProvider provider)
      : super(const AuthStateUninitialized(isLoading: true)) {
    on<AuthEventShouldRegister>((event, emit) {
      emit(const AuthStateRegistering(
        exception: null,
        isLoading: false,
      ));
    });

    on<AuthEventForgotPassword>((event, emit) async {
      emit(const AuthStateForgotPassword(
        exception: null,
        hasSentEmail: false,
        isLoading: false,
      ));
      final email = event.email;
      if (email == null) {
        return;
      }

      emit(const AuthStateForgotPassword(
        exception: null,
        hasSentEmail: false,
        isLoading: true,
      ));

      bool didSendEmail;
      Exception? exception;
      try {
        await provider.sendPasswordReset(toEmail: email);
        didSendEmail = true;
        exception = null;
      } on Exception catch (e) {
        didSendEmail = false;
        exception = e;
      }

      emit(AuthStateForgotPassword(
        exception: exception,
        hasSentEmail: didSendEmail,
        isLoading: false,
      ));
    });

    on<AuthEventSendEmailVerification>((event, emit) async {
      await provider.sendEmailVerification();
      emit(state);
    });

    on<AuthEventRegister>((event, emit) async {
      final email = event.email;
      final password = event.password;
      try {
        await provider.createUser(
          email: email,
          password: password,
        );
        await provider.sendEmailVerification();

        await updateDocumentsWithEmail(email);

        emit(const AuthStateNeedsVerification(isLoading: false));
      } on Exception catch (e) {
        emit(AuthStateRegistering(
          exception: e,
          isLoading: false,
        ));
      }
    });

    on<AuthEventInitialize>((event, emit) async {
      await provider.initialize();
      final user = provider.currentUser;
      if (user == null) {
        emit(
          const AuthStateLoggedOut(
            exception: null,
            isLoading: false,
          ),
        );
      } else if (!user.isEmailVerified) {
        emit(const AuthStateNeedsVerification(isLoading: false));
      } else {
        emit(AuthStateLoggedIn(
          user: user,
          isLoading: false,
        ));
      }
    });

    on<AuthEventLogIn>((event, emit) async {
      emit(
        const AuthStateLoggedOut(
          exception: null,
          isLoading: true,
          loadingText: 'Please wait while I log you in',
        ),
      );
      final email = event.email;
      final password = event.password;
      final preferencesService = PreferencesService();
      try {
        final user = await provider.logIn(
          email: email,
          password: password,
        );

        if (!user.isEmailVerified) {
          emit(
            const AuthStateLoggedOut(
              exception: null,
              isLoading: false,
            ),
          );
          emit(const AuthStateNeedsVerification(isLoading: false));
        } else {
          emit(
            const AuthStateLoggedOut(
              exception: null,
              isLoading: false,
            ),
          );
          await preferencesService.setUserDetails(email);
          preferencesService.setUid();
          emit(AuthStateLoggedIn(
            user: user,
            isLoading: false,
          ));
        }
      } on Exception catch (e) {
        emit(
          AuthStateLoggedOut(
            exception: e,
            isLoading: false,
          ),
        );
      }
    });

    on<AuthEventLogOut>((event, emit) async {
      try {
        await provider.logOut();
        await PreferencesService().clearPreferences();
        emit(
          const AuthStateLoggedOut(
            exception: null,
            isLoading: false,
          ),
        );
      } on Exception catch (e) {
        emit(
          AuthStateLoggedOut(
            exception: e,
            isLoading: false,
          ),
        );
      }
    });
  }

  Future<bool> isEmailWhitelisted(String email) async {
    try {
      final snapshot = await FirebaseFirestore.instance
          .collection('whitelist')
          .doc('students')
          .get();
      final whitelist = snapshot.data()?['emails'] ?? [];
      return whitelist.contains(email);
    } catch (e) {
      return false;
    }
  }

  Future<void> updateDocumentsWithEmail(String email) async {
    final AuthService authService = AuthService.firebase();
    final AuthUser? currentUser = authService.currentUser;

    if (currentUser == null) {
      // print('User is not logged in.');
      return;
    }

    final String uid = currentUser.id;

    try {
      final QuerySnapshot querySnapshot = await FirebaseFirestore.instance
          .collectionGroup('student_data')
          .where('email', isEqualTo: email)
          .limit(1)
          .get();

      final List<DocumentSnapshot> documents = querySnapshot.docs;
      for (final DocumentSnapshot doc in documents) {
        print('Updating document: ${doc.reference.id}');
        final DocumentReference docRef = doc.reference;
        await docRef.update({'uid': uid});
      }
    } catch (e) {
      print('An error occurred while updating the documents: $e');
    }
  }
}
