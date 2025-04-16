
class Collections {
  final String? collection;
  final String? status;
  final String? imageUrl;
  final BottleDetails? bottleDetails;
  final Specifications? specifications;
  final Label? label;
  final TastingNotes? tastingNotes;
  final List<History>? history;
  final List<String>? attachments;

  Collections({
    this.collection,
    this.status,
    this.imageUrl,
    this.bottleDetails,
    this.specifications,
    this.label,
    this.tastingNotes,
    this.history,
    this.attachments,
  });
}

class BottleDetails {
  final String? range;
  final String? name;
  final String? identifier;

  BottleDetails({this.range, this.name, this.identifier});
}

class History {
  final DateTime? date;
  final String? event;

  History({this.date, this.event});
}

class Label {
  final String? title;
  final String? description;
  final List<String>? attachments;

  Label({this.title, this.description, this.attachments});
}

class Specifications {
  final String? distillery;
  final String? region;
  final String? country;
  final String? type;
  final String? ageStatement;
  final DateTime? filled;
  final DateTime? bottled;
  final String? caskNumber;
  final String? abv;
  final String? size;
  final String? finish;

  Specifications({
    this.distillery,
    this.region,
    this.country,
    this.type,
    this.ageStatement,
    this.filled,
    this.bottled,
    this.caskNumber,
    this.abv,
    this.size,
    this.finish,
  });
}

class TastingNotes {
  final Professional? professional;
  final Professional? user;

  TastingNotes({this.professional, this.user});
}

class Professional {
  final String? author;
  final String? nose;
  final String? palate;
  final String? finish;

  Professional({this.author, this.nose, this.palate, this.finish});
}
