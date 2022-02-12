class WordResponse {
  String? word;
  List<Phonetics>? phonetics;
  List<Meanings>? meanings;

  WordResponse({this.word, this.phonetics, this.meanings});

  WordResponse.fromJson(Map<String, dynamic> json) {
    word = json['word'];
    if (json['phonetics'] != null) {
      phonetics = <Phonetics>[];
      json['phonetics'].forEach((v) {
        phonetics!.add(new Phonetics.fromJson(v));
      });
    }
    if (json['meanings'] != null) {
      meanings = <Meanings>[];
      json['meanings'].forEach((v) {
        meanings!.add(new Meanings.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['word'] = this.word;
    if (this.phonetics != null) {
      data['phonetics'] = this.phonetics!.map((v) => v.toJson()).toList();
    }
    if (this.meanings != null) {
      data['meanings'] = this.meanings!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Phonetics {
  String? text;
  String? audio;

  Phonetics({this.text, this.audio});

  Phonetics.fromJson(Map<String, dynamic> json) {
    text = json['text'];
    audio = json['audio'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['text'] = this.text;
    data['audio'] = this.audio;
    return data;
  }
}

class Meanings {
  String? partOfSpeech;
  List<Definitions>? definitions;

  Meanings({this.partOfSpeech, this.definitions});

  Meanings.fromJson(Map<String, dynamic> json) {
    partOfSpeech = json['partOfSpeech'];
    if (json['definitions'] != null) {
      definitions = <Definitions>[];
      json['definitions'].forEach((v) {
        definitions!.add(new Definitions.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['partOfSpeech'] = this.partOfSpeech;
    if (this.definitions != null) {
      data['definitions'] = this.definitions!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Definitions {
  String? definition;
  String? example;
  List<String>? synonyms;

  Definitions({this.definition, this.example, this.synonyms});

  Definitions.fromJson(Map<String, dynamic> json) {
    definition = json['definition'];
    example = json['example'];
    synonyms = json['synonyms'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['definition'] = this.definition;
    data['example'] = this.example;
    data['synonyms'] = this.synonyms;
    return data;
  }
}
