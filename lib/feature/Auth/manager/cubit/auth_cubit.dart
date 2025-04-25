import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());
  Future<void> register({
    required String name,
    required String email,
    required String password,
    required String confirmPassword,
  }) async {
    emit(RegisterLoading());
    if (confirmPassword != password) {
      emit(
        RegisterFailure(errorMessage: 'your confirm password is not correct'),
      );
      return;
    }
    try {
      final credential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      await credential.user!.updateDisplayName(name);
      emit(RegisterSuccess());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        emit(
          RegisterFailure(errorMessage: 'The password provided is too weak.'),
        );
      } else if (e.code == 'email-already-in-use') {
        emit(
          RegisterFailure(
            errorMessage: 'The account already exists for that email.',
          ),
        );
      } else {
        emit(
          RegisterFailure(
            errorMessage: e.message ?? 'An unknown error occurred.',
          ),
        );
      }
    } catch (e) {
      emit(RegisterFailure(errorMessage: e.toString()));
    }
  }

  Future<void> login({required String email, required String password}) async {
    emit(LoginLoading());
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      emit(LoginSuccess());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        emit(LoginFailure(errorMessage: 'No user found for that email.'));
      } else if (e.code == 'in_valid password') {
        emit(
          LoginFailure(errorMessage: 'Wrong password provided for that user.'),
        );
      } else {
        emit(
          LoginFailure(errorMessage: e.message ?? 'An unknown error occurred.'),
        );
      }
    } catch (e) {
      emit(LoginFailure(errorMessage: e.toString()));
    }
  }
}
