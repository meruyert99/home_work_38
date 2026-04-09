abstract class NotesRepository {
  Future<List<Note>> getNotes();
  Future<void> addNote(Note note);
}
