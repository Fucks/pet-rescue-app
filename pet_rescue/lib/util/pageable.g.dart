// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pageable.dart';

// **************************************************************************
// Generator: JsonSerializableGenerator
// **************************************************************************

Pageable _$PageableFromJson(Map<String, dynamic> json) => new Pageable(
    json['page'] as int, json['size'] as int, json['content'] as List);

abstract class _$PageableSerializerMixin {
  int get page;
  int get size;
  List<dynamic> get content;
  Map<String, dynamic> toJson() =>
      <String, dynamic>{'page': page, 'size': size, 'content': content};
}
