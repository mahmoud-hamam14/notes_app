import 'package:hive/hive.dart';
part 'note_model.g.dart'; // This line is necessary for Hive to generate the adapter code for this model. 

@HiveType(
  typeId: 0,
) // This annotation tells Hive that this class is a Hive object and assigns it a unique type ID.
class NoteModel extends HiveObject {
  @HiveField(
    0,
  ) // This annotation tells Hive that this field should be stored in the database and assigns it a unique field ID.
  final String title;

  @HiveField(1)
  final String subtitle;

  @HiveField(2)
  final String date;

  @HiveField(3)
  final int color;

  NoteModel({
    required this.title,
    required this.subtitle,
    required this.date,
    required this.color,
  });
}
