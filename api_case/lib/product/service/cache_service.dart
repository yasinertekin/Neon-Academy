import 'package:api_case/product/model/users.dart';
import 'package:sqflite/sqflite.dart';

final class NoteDatabase {
  final String _noteDatabaseName = 'noteDatabase';
  final String _noteTableName = 'note';

  final int _version = 1;
  late Database database;

  String columnNoteTitle = 'name';
  String columnNoteDescription = 'surname';
  String columnNoteId = 'id';
  String columnNoteLinkedinUrl = 'age';
  String columnNoteEmail = 'email';

  Future<void> open() async {
    database = await openDatabase(
      _noteDatabaseName,
      version: _version,
      onCreate: (db, version) {
        createTable(db);
      },
    );
  }

  Future<bool> insert(Users model) async {
    await open(); // Ensure the database is opened before attempting to insert
    final noteMap = <String, dynamic>{
      columnNoteTitle: model.name,
      columnNoteDescription: model.surname,
      columnNoteLinkedinUrl: model.age,
      columnNoteEmail: model.email,
    };
    try {
      final insertedRowId = await database.insert(
        _noteTableName,
        noteMap,
      );
      return insertedRowId != null;
    } catch (e) {
      print('Error inserting data into database: $e');
      return false;
    }
  }

  Future<void> createTable(Database db) async {
    await db.execute(
      '''
    CREATE TABLE $_noteTableName (
      $columnNoteId INTEGER PRIMARY KEY AUTOINCREMENT,
      $columnNoteTitle TEXT,
      $columnNoteDescription TEXT,
      $columnNoteLinkedinUrl TEXT,
      $columnNoteEmail TEXT
      
    )
    ''',
    );
  }

  Future<List<Users>> getList() async {
    open();
    final List<Map> noteMaps = await database.query(_noteTableName);
    return noteMaps
        .map((e) => Users.fromJson(e.cast<String, dynamic>()))
        .toList();
  }

  Future<bool> delete(int id) async {
    await open();
    try {
      await database.delete(
        _noteTableName,
        where: '$columnNoteId = ?',
        whereArgs: [id],
      );
      return true;
    } catch (e) {
      print('Error deleting data from database: $e');
      return false;
    }
  }

  Future<Users> getItem(int id) async {
    await open();

    final noteMaps = await database.query(
      _noteTableName,
      where: '$columnNoteId = ?',
      columns: [columnNoteId],
      whereArgs: [id],
    );

    if (noteMaps.isEmpty) {
      throw Exception('Note not found');
    }

    return Users.fromJson(noteMaps.first.cast<String, dynamic>());
  }

  Future<void> close() async => database.close();

  Future<void> update(Users model) async {
    await open();

    final noteMap = <String, dynamic>{
      columnNoteTitle: model.name,
      columnNoteDescription: model.surname,
      columnNoteLinkedinUrl: model.age,
      columnNoteEmail: model.email,
    };

    await database.update(
      _noteTableName,
      noteMap,
      where: '$columnNoteId = ?',
      whereArgs: [model.id],
    );
  }
}
