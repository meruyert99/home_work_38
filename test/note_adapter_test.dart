void main() {
  test('normal data', () {
    final model = NoteModel(id: 1, title: 'Title', content: 'Text');

    final note = NoteAdapter.fromModel(model);

    expect(note.title, 'Title');
  });

  test('empty data', () {
    final model = NoteModel();

    final note = NoteAdapter.fromModel(model);

    expect(note.title, 'No title');
    expect(note.id, -1);
  });

  test('incorrect data (null fields)', () {
    final model = NoteModel(id: null, title: null, content: null);

    final note = NoteAdapter.fromModel(model);

    expect(note.content, '');
  });
}
