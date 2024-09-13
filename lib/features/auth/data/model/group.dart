
import 'dart:convert';

List<GroupConnexion> GroupConnexionFromJson(String str) =>
    List<GroupConnexion>.from(json.decode(str).map((x) => GroupConnexion.fromJson(x)));

String GroupConnexionToJson(List<GroupConnexion> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class GroupConnexion {
  final int id;
  final String name;

  GroupConnexion({required this.id, required this.name});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
    };
  }

  factory GroupConnexion.fromReqBody(String body) {
    Map<String, dynamic> json = jsonDecode(body);
    return GroupConnexion(
      id: 0,
      name: json['name'],
    );
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
      };

  factory GroupConnexion.fromJson(Map<String, dynamic> json) {
    return GroupConnexion(
      id: json["id"],
      name: json["name"],
    );
  }

  factory GroupConnexion.fromMap(Map<String, dynamic> map) {
    return GroupConnexion(
      id: map['id']?.toInt() ?? 0,
      name: map['name'] ?? '',
    );
  }

  void printAttributes() {
    print("id: $id\n");
    print("name: $name\n");
  }

  @override
  String toString() => 'GroupConnexion(id: $id, name: $name)';
}

