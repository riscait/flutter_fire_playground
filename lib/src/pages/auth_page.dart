import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../features/authenticator/authenticator.dart';

/// 強制アップデート情報を取得してダイアログを表示するデモページ
class AuthPage extends HookWidget {
  const AuthPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = useProvider(authenticatorProvider);
    final authenticator = useProvider(authenticatorProvider.notifier);
    final nameController =
        useTextEditingController(text: user?.displayName ?? '');
    final hasSigned = user != null;

    void _showNameFieldDialog() {
      showDialog<void>(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text('ニックネーム変更'),
            content: TextField(
              controller: nameController,
            ),
            actions: [
              TextButton(
                onPressed: Navigator.of(context).pop,
                child: const Text('キャンセル'),
              ),
              TextButton(
                onPressed: () {
                  authenticator.updateDisplayName(nameController.text);
                  Navigator.of(context).pop();
                },
                child: const Text('変更'),
              ),
            ],
          );
        },
      );
    }

    return Scaffold(
      appBar: AppBar(title: const Text('Authentication')),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(32),
          children: [
            Text('ログイン状態：${hasSigned ? 'ログイン済み' : '未ログイン'}'),
            const SizedBox(height: 16),
            if (hasSigned) ...[
              Text('ニックネーム：${user!.displayName ?? '名無し'}'),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: _showNameFieldDialog,
                child: const Text('ニックネーム変更'),
              ),
              const SizedBox(height: 16),
              OutlinedButton(
                onPressed: authenticator.deleteAccount,
                child: const Text('アカウント削除'),
              ),
            ] else
              ElevatedButton(
                onPressed: authenticator.signInWithAnonymous,
                child: const Text('匿名アカウント作成'),
              ),
          ],
        ),
      ),
    );
  }
}
