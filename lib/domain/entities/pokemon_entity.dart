import 'evolution_entity.dart';

class PokemonEntity {
  final int? id;
  final String? num;
  final String name;
  final String? img;
  final List<String>? type;
  final String height;
  final String? weight;
  final String? candy;
  final String? egg;
  final List<EvolutionEntity>? nextEvolution;
  final List<EvolutionEntity>? prevEvolution;

  PokemonEntity(
      {required this.id,
      required this.num,
      required this.name,
      required this.img,
      required this.type,
      required this.height,
      required this.weight,
      required this.candy,
      required this.egg,
      required this.nextEvolution,
      required this.prevEvolution});
}
