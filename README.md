# flutter_fire_playground

FlutterFire の使用例アプリプロジェクトです。

## Getting Started

当アプリをお手元で起動して動かすためにはFirebaseを有効化する必要があります。

1. Firebaseコンソールで新規プロジェクトを作成します。
2. Firebaseのプロジェクト設定でiOSとAndroidのアプリを追加します。
3. パッケージ名/Bundle IDは 'jp.co.altive.flutterfireplayground'を使用してください。
4. Android: `google-services.json` をダウンロードして `android/app` に配置します。
5. iOS: `GoogleService-Info.plist` をダウンロードして `iOS/Runner` に配置します。
6. 最後に、Firebaseコンソールの `Authentication` セクションでAnonymousログインを有効にします。

## Firebase Plugins

- `firebase_analytics`
- `firebase_auth`
- `firebase_core`
- `firebase_remote_config`
