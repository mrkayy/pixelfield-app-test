import 'package:hive_ce_flutter/hive_flutter.dart';

part 'fake_collection.model.g.dart';

@HiveType(typeId: 1) // Unique typeId for Collection object
class FakeCollection extends HiveObject {
  FakeCollection({
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

  @HiveField(0)
  final String? collection;
  @HiveField(1)
  final String? status;
  @HiveField(2)
  final String? imageUrl;
  @HiveField(3)
  final FakeBottleDetails? bottleDetails;
  @HiveField(4)
  final FakeSpecifications? specifications;
  @HiveField(5)
  final FakeLabel? label;
  @HiveField(6)
  final FakeTastingNotes? tastingNotes;
  @HiveField(7)
  final List<FakeHistory>? history;
  @HiveField(8)
  final List<String>? attachments;
}

@HiveType(typeId: 2)
class FakeBottleDetails extends HiveObject {
  FakeBottleDetails({this.range, this.name, this.identifier});

  @HiveField(0)
  final String? range;
  @HiveField(1)
  final String? name;
  @HiveField(2)
  final String? identifier;
}

@HiveType(typeId: 3)
class FakeHistory extends HiveObject {
  FakeHistory({this.date, this.event});

  @HiveField(0)
  final DateTime? date;
  @HiveField(1)
  final String? event;
}

@HiveType(typeId: 4)
class FakeLabel extends HiveObject {
  FakeLabel({this.title, this.description, this.attachments});

  @HiveField(0)
  final String? title;
  @HiveField(1)
  final String? description;
  @HiveField(2)
  final List<String>? attachments;
}

@HiveType(typeId: 5)
class FakeSpecifications extends HiveObject {
  FakeSpecifications({
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
  @HiveField(0)
  final String? distillery;
  @HiveField(1)
  final String? region;
  @HiveField(2)
  final String? country;
  @HiveField(3)
  final String? type;
  @HiveField(4)
  final String? ageStatement;
  @HiveField(5)
  final DateTime? filled;
  @HiveField(6)
  final DateTime? bottled;
  @HiveField(7)
  final String? caskNumber;
  @HiveField(8)
  final String? abv;
  @HiveField(9)
  final String? size;
  @HiveField(10)
  final String? finish;
}

@HiveType(typeId: 6)
class FakeTastingNotes extends HiveObject {
  FakeTastingNotes({this.professional, this.user});

  @HiveField(0)
  final FakeProfessional? professional;
  @HiveField(1)
  final FakeProfessional? user;
}

@HiveType(typeId: 7)
class FakeProfessional extends HiveObject {
  FakeProfessional({this.author, this.nose, this.palate, this.finish});

  @HiveField(0)
  final String? author;
  @HiveField(1)
  final String? nose;
  @HiveField(2)
  final String? palate;
  @HiveField(3)
  final String? finish;
}
