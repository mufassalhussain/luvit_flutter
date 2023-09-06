class Profile {
  const Profile({
    required this.name,
    required this.imageTitle,
    this.bigTitle,
    this.littleTitle,
    this.tags,
    required this.distance,
    required this.imageAsset,
  });
  final String name;
  final String distance;
  final String? imageTitle;
  final String? bigTitle;
  final String? littleTitle;
  final List<String>? tags;
  final String imageAsset;
}
