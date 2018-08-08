// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'announce.entity.dart';

// **************************************************************************
// Generator: JsonSerializableGenerator
// **************************************************************************

Announce _$AnnounceFromJson(Map<String, dynamic> json) => new Announce(
    json['id'] as String, json['title'] as String, json['address'] as String);

abstract class _$AnnounceSerializerMixin {
  String get id;
  String get title;
  String get address;
  Map<String, dynamic> toJson() =>
      <String, dynamic>{'id': id, 'title': title, 'address': address};
}
