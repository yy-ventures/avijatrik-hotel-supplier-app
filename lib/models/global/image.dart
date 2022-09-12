class GlobalImage {
  GlobalImage({
    this.src,
    this.position,
    this.alt,
    this.gallerySlug,
  });

  GlobalImage.fromJson(Map<String, dynamic> json) {
    src = json['Src'];
    position = json['Position'];
    alt = json['Alt'];
    gallerySlug = json['GallerySlug'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['Src'] = src;
    data['Position'] = position;
    data['Alt'] = alt;
    data['GallerySlug'] = gallerySlug;

    return data;
  }

  String? src;
  String? position;
  String? alt;
  String? gallerySlug;
}
