import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../features/update_requester/update_requester.dart';

/// 強制アップデート情報を取得してダイアログを表示するデモページ
class VersionCheckPage extends HookWidget {
  const VersionCheckPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('バージョンアップ情報')),
      body: SafeArea(
        child: Center(
          child: useProvider(updateRequesterProvider).when(
            loading: () => const CircularProgressIndicator(),
            error: (error, stack) => ErrorWidget(error),
            data: (requestType) {
              WidgetsBinding.instance!.addPostFrameCallback((_) {
                if (requestType != UpdateRequestType.not) {
                  showDialog<void>(
                    context: context,
                    builder: (context) {
                      return SimpleDialog(
                        title: const Text('最新の更新があります。\nアップデートをお願いします。'),
                        children: [
                          if (requestType == UpdateRequestType.cancelable)
                            SimpleDialogOption(
                              onPressed: () => Navigator.of(context).pop(),
                              child: const Text('キャンセル'),
                            ),
                          SimpleDialogOption(
                            onPressed: () {
                              // FIXME: App Store or Google Play に飛ばす
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(content: Text('Jump to Store.')),
                              );
                              Navigator.of(context).pop();
                            },
                            child: const Text('アップデート'),
                          ),
                        ],
                      );
                    },
                  );
                }
              });
              return const Text('新しいバージョンがある場合はダイアログが表示されます。');
            },
          ),
        ),
      ),
    );
  }
}
