import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../features/update_requester/update_requester.dart';

/// 強制アップデート情報を取得してダイアログを表示するデモページ
class VersionCheckPage extends ConsumerWidget {
  const VersionCheckPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    return Scaffold(
      appBar: AppBar(title: const Text('バージョンアップダイアログ')),
      body: SafeArea(
        child: Center(
          // FutureProviderなので、 `when` で loading, error, data のハンドリングができる
          child: watch(updateRequesterProvider).when(
            loading: () => const CircularProgressIndicator(),
            error: (error, stack) => ErrorWidget(error),
            data: (requestType) => _ContentAndDialog(requestType: requestType),
          ),
        ),
      ),
    );
  }
}

class _ContentAndDialog extends StatelessWidget {
  const _ContentAndDialog({
    Key? key,
    required this.requestType,
  }) : super(key: key);

  final UpdateRequestType requestType;

  @override
  Widget build(BuildContext context) {
    // ビルド後にダイアログを表示させるための記法
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      if (requestType != UpdateRequestType.not) {
        // 新しいアプリバージョンがある場合はダイアログを表示する
        showDialog<void>(
          context: context,
          // ダイアログの外をタップしても閉じられないようにする
          barrierDismissible: false,
          builder: (context) {
            return WillPopScope(
              // AndroidのBackボタンで閉じられないようにする
              onWillPop: () async => false,
              child: AlertDialog(
                title: const Text('最新の更新があります。\nアップデートをお願いします。'),
                actions: [
                  if (requestType == UpdateRequestType.cancelable)
                    TextButton(
                      onPressed: () => Navigator.of(context).pop(),
                      child: const Text('キャンセル'),
                    ),
                  TextButton(
                    onPressed: () {
                      // 要追加: App Store or Google Play に飛ばす処理
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Jump to Store.')),
                      );
                      Navigator.of(context).pop();
                    },
                    child: const Text('アップデート'),
                  ),
                ],
              ),
            );
          },
        );
      }
    });
    return const Text('新しいバージョンがある場合はダイアログが表示されます。');
  }
}
