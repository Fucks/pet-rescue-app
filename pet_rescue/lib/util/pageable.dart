import 'package:json_annotation/json_annotation.dart';

part 'pageable.g.dart';

@JsonSerializable()
class Pageable extends Object with _$PageableSerializerMixin{
  Pageable(this.page, this.size, this.content);

  int page;
  int size;
  List content;

  factory Pageable.fromJson(Map<String, dynamic> json) => _$PageableFromJson(json);
}

/**
 * Necessário mapear desta maneira para gerar automaticamente os de/para do json
 * para a entidade e vice versa.
 *
 * Para gerar posteriormente os códigos é necessário rodar o comando:
 * flutter packages pub run build_runner build
 *
 * Pode ser criado um watcher para fazer essa compilação, utilizando o comando:
 * flutter packages pub run build_runner watch
 */
