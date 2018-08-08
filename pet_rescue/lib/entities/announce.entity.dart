
import 'package:json_annotation/json_annotation.dart';

part 'announce.entity.g.dart';

@JsonSerializable()
class Announce extends Object with _$AnnounceSerializerMixin{
  Announce(this.id, this.title, this.address);

  String id;
  String title;
  String address;

  factory Announce.fromJson(Map<String, dynamic> json) => _$AnnounceFromJson(json);
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
