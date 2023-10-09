class ImageConstants {

  ImageConstants._init();
  static ImageConstants? _instace;

  static ImageConstants get instance => _instace ??= ImageConstants._init();

  String get logo => toPng('veli');

  String get pt => toPng('pt');
  String get projeIcon => toPng('cirlce_hwa');

  String toPng(String name) => 'asset/img/$name.png';
}