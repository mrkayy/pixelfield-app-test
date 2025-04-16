import 'package:json_annotation/json_annotation.dart';
import 'package:pixel_field_app/features/collections/domain_layer/entities/collections.entity.dart';

part 'collection.model.g.dart';

@JsonSerializable()
class CollectionsListModel {
  @JsonKey(name: "data")
  List<CollectionsModel>? collectionData;

  CollectionsListModel({this.collectionData});

  factory CollectionsListModel.fromJson(Map<String, dynamic> json) =>
      _$CollectionsListModelFromJson(json);
  Map<String, dynamic> toJson() => _$CollectionsListModelToJson(this);
}

@JsonSerializable()
class CollectionsModel extends Collections {
  CollectionsModel({
    super.collection,
    super.status,
    this.history,
    this.attachments,
    this.specifications,
    this.label,
    this.tastingNote,
    this.imageUrl,
    this.bottleDetail,
  }) : super(
         imageUrl: imageUrl,
         bottleDetails: bottleDetail,
         tastingNotes: tastingNote,
         specifications: specifications,
         label: label,
         history: history,
         attachments: attachments,
       );

  @JsonKey(name: "image_url")
  final String? imageUrl;
  @JsonKey(name: "bottle_details")
  final BottleDetailsModel? bottleDetail;
  @JsonKey(name: "tasting_notes")
  final TastingNotesModel? tastingNote;
  @JsonKey(name: "specifications")
  final SpecificationsModel? specifications;
  @JsonKey(name: "label")
  final LabelModel? label;
  @JsonKey(name: "history")
  final List<HistoryModel>? history;
  @JsonKey(name: "attachments")
  final List<String>? attachments;

  factory CollectionsModel.fromJson(Map<String, dynamic> json) =>
      _$CollectionsModelFromJson(json);
  Map<String, dynamic> toJson() => _$CollectionsModelToJson(this);
}

@JsonSerializable()
class BottleDetailsModel extends BottleDetails {
  BottleDetailsModel({super.range, super.name, super.identifier});

  factory BottleDetailsModel.fromJson(Map<String, dynamic> json) =>
      _$BottleDetailsModelFromJson(json);
  Map<String, dynamic> toJson() => _$BottleDetailsModelToJson(this);
}

@JsonSerializable()
class HistoryModel extends History {
  HistoryModel({super.date, super.event});

  factory HistoryModel.fromJson(Map<String, dynamic> json) =>
      _$HistoryModelFromJson(json);
  Map<String, dynamic> toJson() => _$HistoryModelToJson(this);
}

@JsonSerializable()
class LabelModel extends Label {
  LabelModel({super.title, super.description, super.attachments});

  factory LabelModel.fromJson(Map<String, dynamic> json) =>
      _$LabelModelFromJson(json);
  Map<String, dynamic> toJson() => _$LabelModelToJson(this);
}

@JsonSerializable()
class SpecificationsModel extends Specifications {
  @JsonKey(name: "age_statement")
  final String? ageStatement;
  @JsonKey(name: "cask_number")
  final String? caskNumber;

  SpecificationsModel({
    super.distillery,
    super.region,
    super.country,
    super.type,
    this.ageStatement,
    super.filled,
    super.bottled,
    this.caskNumber,
    super.abv,
    super.size,
    super.finish,
  }) : super(ageStatement: ageStatement, caskNumber: caskNumber);

  factory SpecificationsModel.fromJson(Map<String, dynamic> json) =>
      _$SpecificationsModelFromJson(json);
  Map<String, dynamic> toJson() => _$SpecificationsModelToJson(this);
}

@JsonSerializable()
class TastingNotesModel extends TastingNotes {
  TastingNotesModel({this.professional, this.user})
    : super(professional: professional, user: user);
  @JsonKey(name: "professional")
  final ProfessionalModel? professional;
  @JsonKey(name: "user")
  final ProfessionalModel? user;

  factory TastingNotesModel.fromJson(Map<String, dynamic> json) =>
      _$TastingNotesModelFromJson(json);
  Map<String, dynamic> toJson() => _$TastingNotesModelToJson(this);
}

@JsonSerializable()
class ProfessionalModel extends Professional {
  ProfessionalModel({super.author, super.nose, super.palate, super.finish});

  factory ProfessionalModel.fromJson(Map<String, dynamic> json) =>
      _$ProfessionalModelFromJson(json);
  Map<String, dynamic> toJson() => _$ProfessionalModelToJson(this);
}
