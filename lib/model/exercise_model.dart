class ExerciseModel {
  ExerciseModel({
    required this.count,
    required this.results,
  });
  late final int count;
  late final List<Results> results;

  ExerciseModel.fromJson(Map<String, dynamic> json){
    count = json['count'];
    results = List.from(json['results']).map((e)=>Results.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['count'] = count;
    _data['results'] = results.map((e)=>e.toJson()).toList();
    return _data;
  }
}

class Results {
  Results({
    required this.id,
    required this.uuid,
    required this.exerciseBase,
    required this.image,
    required this.isMain,
    required this.style,
    required this.license,
    required this.licenseAuthor,
    required this.authorHistory,
  });
  late final int id;
  late final String uuid;
  late final int exerciseBase;
  late final String image;
  late final bool isMain;
  late final String style;
  late final int license;
  late final String licenseAuthor;
  late final List<dynamic> authorHistory;

  Results.fromJson(Map<String, dynamic> json){
    id = json['id'];
    uuid = json['uuid'];
    exerciseBase = json['exercise_base'];
    image = json['image'];
    isMain = json['is_main'];
    style = json['style'];
    license = json['license'];
    licenseAuthor = json['license_author'];
    authorHistory = List.castFrom<dynamic, dynamic>(json['author_history']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['uuid'] = uuid;
    _data['exercise_base'] = exerciseBase;
    _data['image'] = image;
    _data['is_main'] = isMain;
    _data['style'] = style;
    _data['license'] = license;
    _data['license_author'] = licenseAuthor;
    _data['author_history'] = authorHistory;
    return _data;
  }
}
class StretchesModel {
  StretchesModel({
    required this.image,
    required this.name,
    required this.level,
  });
  late final String name;
  late final String image;
  late final String level;

  StretchesModel.fromJson(Map<String, dynamic> json){
    name = json['name'];
    image = json['image'];
    level = json['level'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['image'] = image;
    _data['name'] = name;
    _data['level'] = level;
    return _data;
  }
}