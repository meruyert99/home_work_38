void main() {
  late NotesRepositoryImpl repo;
  late NotesRemoteDataSource remote;
  late NotesLocalDataSource local;

  setUp(() {
    remote = NotesRemoteDataSource();
    local = NotesLocalDataSource();
    repo = NotesRepositoryImpl(remote: remote, local: local);
  });

  test('returns cached data first', () async {
    await local.cacheNotes([
      {"id": 1, "title": "Cached", "content": "Local"}
    ]);

    final result = await repo.getNotes();

    expect(result.first.title, "Cached");
  });

  test('fetches from remote if cache empty', () async {
    final result = await repo.getNotes();

    expect(result.isNotEmpty, true);
  });
}
