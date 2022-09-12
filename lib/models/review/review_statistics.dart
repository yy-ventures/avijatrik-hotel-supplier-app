class ReviewStatistics {
  ReviewStatistics({
    this.ratting,
    this.totalReview,
  });

  ReviewStatistics.fromJson(Map<String, dynamic> json) {
    ratting = json['Ratting'];
    totalReview = json['TotalReview'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['Ratting'] = ratting;
    data['TotalReview'] = totalReview;

    return data;
  }

  num? ratting;
  int? totalReview;
}
