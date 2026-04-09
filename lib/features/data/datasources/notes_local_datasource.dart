class NotesLocalDataSource {
  List<Map<String, dynamic>> _cache = [];

  Future<void> cacheNotes(List<Map<String, dynamic>> notes) async {
    _cache = notes;
  }

  Future<List<Map<String, dynamic>>> getCachedNotes() async {
    return _cache;
  }
}
