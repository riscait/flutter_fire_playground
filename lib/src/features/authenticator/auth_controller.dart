import 'package:firebase_auth/firebase_auth.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final authenticatorProvider = StateNotifierProvider<AuthController, User?>(
  (ref) => AuthController(initialUser: FirebaseAuth.instance.currentUser),
);

class AuthController extends StateNotifier<User?> {
  // ----- Constructor ----- //
  AuthController({User? initialUser}) : super(initialUser) {
    // Userの変更を検知して状態を更新
    _auth.userChanges().listen((user) {
      state = user;
    });
  }

  final _auth = FirebaseAuth.instance;

  /// FirebaseAuthの匿名認証でサインインする
  Future<void> signInWithAnonymous() async {
    final userCredential = await _auth.signInAnonymously();
    state = userCredential.user;
  }

  /// アカウントを削除する
  Future<void> deleteAccount() async {
    await state?.delete();
  }

  /// Firebase Auth User の表示名を更新する
  Future<void> updateDisplayName(String newName) async {
    await state?.updateProfile(displayName: newName);
  }
}
