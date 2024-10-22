String pngIconsName(String? icon) {
  return 'assets/icons/$icon.png';
}

String jpgImageName(String? image) {
  return 'assets/images/$image.jpg';
}

class AppIcons {
  static String get icon => pngIconsName('img');
}

class AppImages {
  static String get cloud => jpgImageName('cloud');
}
