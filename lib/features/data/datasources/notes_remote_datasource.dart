class NotesRemoteDataSource {
  Future<List<Map<String, dynamic>>> fetchNotes() async {
    await Future.delayed(Duration(milliseconds: 300));

    return [
      {"id": 1, "title": "Remote Note", "content": "From API"}
    ];
  }
}
