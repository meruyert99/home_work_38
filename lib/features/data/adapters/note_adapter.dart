import '../../domain/entities/note.dart';
import '../models/note_model.dart';

class NoteAdapter {
  static Note fromModel(NoteModel model) {
    return Note(
      id: model.id ?? -1,
      title: model.title ?? 'No title',
      content: model.content ?? '',
    );
  }

  static NoteModel toModel(Note note) {
    return NoteModel(
      id: note.id,
      title: note.title,
      content: note.content,
    );
  }
}
