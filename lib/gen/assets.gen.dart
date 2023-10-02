/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal,deprecated_member_use

import 'package:flutter/widgets.dart';

class $AssetsIconsGen {
  const $AssetsIconsGen();

  /// File path: assets/icons/Icon ionic-ios-add.png
  AssetGenImage get iconIonicIosAdd =>
      const AssetGenImage('assets/icons/Icon ionic-ios-add.png');

  /// File path: assets/icons/back_arrow.png
  AssetGenImage get backArrow =>
      const AssetGenImage('assets/icons/back_arrow.png');

  /// File path: assets/icons/city_flag.png
  AssetGenImage get cityFlag =>
      const AssetGenImage('assets/icons/city_flag.png');

  /// File path: assets/icons/img.png
  AssetGenImage get img => const AssetGenImage('assets/icons/img.png');

  /// File path: assets/icons/lock.png
  AssetGenImage get lock => const AssetGenImage('assets/icons/lock.png');

  /// File path: assets/icons/person.png
  AssetGenImage get person => const AssetGenImage('assets/icons/person.png');

  /// File path: assets/icons/phone.png
  AssetGenImage get phone => const AssetGenImage('assets/icons/phone.png');

  /// File path: assets/icons/saudi_flag.png
  AssetGenImage get saudiFlag =>
      const AssetGenImage('assets/icons/saudi_flag.png');

  $AssetsIconsSvgGen get svg => const $AssetsIconsSvgGen();

  /// List of all assets
  List<AssetGenImage> get values => [
        iconIonicIosAdd,
        backArrow,
        cityFlag,
        img,
        lock,
        person,
        phone,
        saudiFlag
      ];
}

class $AssetsImagesGen {
  const $AssetsImagesGen();

  /// File path: assets/images/logo.png
  AssetGenImage get logo => const AssetGenImage('assets/images/logo.png');

  /// File path: assets/images/potato.png
  AssetGenImage get potato => const AssetGenImage('assets/images/potato.png');

  /// File path: assets/images/side_image.png
  AssetGenImage get sideImage =>
      const AssetGenImage('assets/images/side_image.png');

  /// File path: assets/images/splash_bg.png
  AssetGenImage get splashBg =>
      const AssetGenImage('assets/images/splash_bg.png');

  /// List of all assets
  List<AssetGenImage> get values => [logo, potato, sideImage, splashBg];
}

class $AssetsIconsSvgGen {
  const $AssetsIconsSvgGen();

  /// File path: assets/icons/svg/cart.svg
  String get cart => 'assets/icons/svg/cart.svg';

  /// File path: assets/icons/svg/fav.svg
  String get fav => 'assets/icons/svg/fav.svg';

  /// File path: assets/icons/svg/main.svg
  String get main => 'assets/icons/svg/main.svg';

  /// File path: assets/icons/svg/my_account.svg
  String get myAccount => 'assets/icons/svg/my_account.svg';

  /// File path: assets/icons/svg/my_orders.svg
  String get myOrders => 'assets/icons/svg/my_orders.svg';

  /// File path: assets/icons/svg/notifications.svg
  String get notifications => 'assets/icons/svg/notifications.svg';

  /// File path: assets/icons/svg/search.svg
  String get search => 'assets/icons/svg/search.svg';

  /// List of all assets
  List<String> get values =>
      [cart, fav, main, myAccount, myOrders, notifications, search];
}

class Assets {
  Assets._();

  static const $AssetsIconsGen icons = $AssetsIconsGen();
  static const $AssetsImagesGen images = $AssetsImagesGen();
}

class AssetGenImage {
  const AssetGenImage(this._assetName);

  final String _assetName;

  Image image({
    Key? key,
    AssetBundle? bundle,
    ImageFrameBuilder? frameBuilder,
    ImageErrorWidgetBuilder? errorBuilder,
    String? semanticLabel,
    bool excludeFromSemantics = false,
    double? scale,
    double? width,
    double? height,
    Color? color,
    Animation<double>? opacity,
    BlendMode? colorBlendMode,
    BoxFit? fit,
    AlignmentGeometry alignment = Alignment.center,
    ImageRepeat repeat = ImageRepeat.noRepeat,
    Rect? centerSlice,
    bool matchTextDirection = false,
    bool gaplessPlayback = false,
    bool isAntiAlias = false,
    String? package,
    FilterQuality filterQuality = FilterQuality.low,
    int? cacheWidth,
    int? cacheHeight,
  }) {
    return Image.asset(
      _assetName,
      key: key,
      bundle: bundle,
      frameBuilder: frameBuilder,
      errorBuilder: errorBuilder,
      semanticLabel: semanticLabel,
      excludeFromSemantics: excludeFromSemantics,
      scale: scale,
      width: width,
      height: height,
      color: color,
      opacity: opacity,
      colorBlendMode: colorBlendMode,
      fit: fit,
      alignment: alignment,
      repeat: repeat,
      centerSlice: centerSlice,
      matchTextDirection: matchTextDirection,
      gaplessPlayback: gaplessPlayback,
      isAntiAlias: isAntiAlias,
      package: package,
      filterQuality: filterQuality,
      cacheWidth: cacheWidth,
      cacheHeight: cacheHeight,
    );
  }

  ImageProvider provider({
    AssetBundle? bundle,
    String? package,
  }) {
    return AssetImage(
      _assetName,
      bundle: bundle,
      package: package,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}
