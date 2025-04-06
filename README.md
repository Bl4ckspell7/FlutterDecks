# FlutterDecks
![](https://github.com/Bl4ckspell7/FlutterDecks/actions/workflows/build.yaml/badge.svg)
![](https://img.shields.io/github/v/release/Bl4ckspell7/FlutterDecks)


A modern flashcard learning app built with Flutter.

### Run
```bash
flutter run
```

### Build apk
```bash
flutter build apk
```

### Generate app icon
1. place `icon.png` file inside [./assets/icon/](./assets/icon/)
2. adjust config [./flutter_launcher_icons.yaml](./flutter_launcher_icons.yaml) if necessary
3. generate using:
```bash
dart run flutter_launcher_icons
```

### Generate native splash
1. place used files (app icon/background/branding) inside [./assets/splash/](./assets/splash/)
2. adjust config [./flutter_native_splash.yaml](./flutter_native_splash.yaml) if necessary
```bash
dart run flutter_native_splash:create
```

## Create Release
Create tags:
```bash
git tag -a v0.0.1 -m "version 0.0.1"
git push origin v0.0.1
```
Delete tags:
```bash
git tag -d v0.0.1
git push origin :refs/tags/v0.0.1
```