class NotesRepositoryImpl implements NotesRepository {
  final NotesRemoteDataSource remote;
  final NotesLocalDataSource local;

  NotesRepositoryImpl({
    required this.remote,
    required this.local,
  });

  @override
  Future<List<Note>> getNotes() async {
    // 1. сначала локальные данные
    final cached = await local.getCachedNotes();

    if (cached.isNotEmpty) {
      return cached
          .map((e) => NoteAdapter.fromModel(NoteModel.fromJson(e)))
          .toList();
    }

    // 2. если нет — идём в API
    final remoteData = await remote.fetchNotes();

    // 3. кэшируем
    await local.cacheNotes(remoteData);

    return remoteData
        .map((e) => NoteAdapter.fromModel(NoteModel.fromJson(e)))
        .toList();
  }

  @override
  Future<void> addNote(Note note) async {
    final model = NoteAdapter.toModel(note);

    final cached = await local.getCachedNotes();

    cached.add(model.toJson());

    await local.cacheNotes(cached);
  }
}
