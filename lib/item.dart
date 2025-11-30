class Item {
  final String id;
  final String title;
  final String desc;
  final String createdAt;
  Item({
    required this.id,
    required this.title,
    required this.desc,
    required this.createdAt,
  });
  factory Item.fromJson(Map<String, dynamic> json) {
    return Item(
      id: json['id'],
      title: json['title'],
      desc: json['desc'],
      createdAt: json['createdAt'],
    );
  }
}
