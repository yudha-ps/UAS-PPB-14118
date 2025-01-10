class DataModel {
  final String id;
  final String name;

  DataModel({required this.id, required this.name});

  factory DataModel.fromMap(Map<String, dynamic> data, String documentId) {
    return DataModel(
      id: documentId,
      name: data['name'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
    };
  }
}
