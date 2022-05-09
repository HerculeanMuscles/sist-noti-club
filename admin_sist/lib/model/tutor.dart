
class Tutor {
  String? id;
  final String title;
  final String date;
  final String description;

  Tutor({
    this.id ='',
    required this.title,
    required this.date,
    required this.description,
  });

  Map<String, dynamic> toJson() => {
    'id': id,
    'title': title,
    'date': date,
    'description' : description,
  };

  static Tutor fromJson(Map<String, dynamic> json) => Tutor(
      id: json['id'],
      title: json['title'],
      date: json['date'],
      description: json['description']
  );
}