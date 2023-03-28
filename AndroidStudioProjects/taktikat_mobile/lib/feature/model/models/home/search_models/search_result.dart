class SearchResult {
  SearchResult({
    this.id,
    this.title,
    this.image,
    this.status,
    this.type,
  });

  int? id;
  String? title;
  String? image;
  String? status;
  String? type;

  factory SearchResult.fromJson(Map<String, dynamic> json) => SearchResult(
        id: json['id'],
        title: json['title'],
        image: json['image'],
        status: json['status'],
        type: json['type'],
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'image': image,
        'status': status,
        'type': type,
      };
}
