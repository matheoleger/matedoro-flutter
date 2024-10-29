import 'package:flutter/material.dart';
import 'package:matedoro_flutter/models/session.dart';
import 'package:matedoro_flutter/models/cycle.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:uuid/uuid.dart';
import 'package:uuid/v4.dart';

// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   // Open the database and store the reference.
//   final database = openDatabase(
//     // Set the path to the database. Note: Using the `join` function from the
//     // `path` package is best practice to ensure the path is correctly
//     // constructed for each platform.
//     join(await getDatabasesPath(), 'matedoro.db'),
//     // When the database is first created, create a table to store dogs.
//     onCreate: (db, version) {
//       // Run the CREATE TABLE statement on the database.
//       return db.execute(
//         '''
//           CREATE TABLE "PomodoroSession"(
//             "id" UUID NOT NULL,
//             "work_session" UUID NOT NULL,
//             "pomodori_count" BIGINT NOT NULL,
//             "focus_time" BIGINT NOT NULL,
//             "break_time" BIGINT NOT NULL
//           );
//           ALTER TABLE
//             "PomodoroSession" ADD PRIMARY KEY("id");
//           CREATE TABLE "WorkSession"(
//             "id" UUID NOT NULL,
//             "date" TIMESTAMP(0) WITHOUT TIME ZONE NOT NULL,
//             "total_focus_time" BIGINT NOT NULL
//           );
//           ALTER TABLE
//             "WorkSession" ADD PRIMARY KEY("id");
//           ALTER TABLE
//             "PomodoroSession" ADD CONSTRAINT "pomodorosession_work_session_foreign" FOREIGN KEY("work_session") REFERENCES "WorkSession"("id");
//         ''',
//       );
//     },
//     // Set the version. This executes the onCreate function and provides a
//     // path to perform database upgrades and downgrades.
//     version: 1,
//   );

// }

class DatabaseService {
  late Database _database;

  Uuid uuid = Uuid();

  DatabaseService() {
    initialise();
  }

  Future initialise() async {
    _database = await openDatabase(
      // Set the path to the database. Note: Using the `join` function from the
      // `path` package is best practice to ensure the path is correctly
      // constructed for each platform.
      join(await getDatabasesPath(), 'matedoro.db'),
      // When the database is first created, create a table to store dogs.
      onCreate: (db, version) {
        print("nique te amer ?");
        // Run the CREATE TABLE statement on the database.
        db.execute('''
          CREATE TABLE Session (
              id TEXT NOT NULL PRIMARY KEY,
              date TEXT NOT NULL, -- storing TIMESTAMP as TEXT in ISO 8601 format (YYYY-MM-DD HH:MM:SS)
              total_focus_time INTEGER NOT NULL
          );
        ''');
        db.execute('''
          CREATE TABLE Cycle (
              id TEXT NOT NULL PRIMARY KEY,
              session_id TEXT NOT NULL,
              focus_time INTEGER NOT NULL,
              FOREIGN KEY (session_id) REFERENCES Session(id)
          );
        ''');
        // return db.execute(
        //   '''
        //   CREATE TABLE Session (
        //       id TEXT NOT NULL PRIMARY KEY,
        //       date TEXT NOT NULL, -- storing TIMESTAMP as TEXT in ISO 8601 format (YYYY-MM-DD HH:MM:SS)
        //       total_focus_time INTEGER NOT NULL
        //   );
        //   CREATE TABLE Cycle (
        //       id TEXT NOT NULL PRIMARY KEY,
        //       session_id TEXT NOT NULL,
        //       focus_time INTEGER NOT NULL,
        //       FOREIGN KEY (session_id) REFERENCES Session(id)
        //   );
        // ''',
        // );
      },
      // Set the version. This executes the onCreate function and provides a
      // path to perform database upgrades and downgrades.
      version: 1,
    );
  }

  Session createSession() {
    Session session = Session(
        id: uuid.v4(),
        date: DateTime.now().millisecondsSinceEpoch.toString(),
        totalFocusTime: 0);

    _database.insert(
      'Session',
      session.toMap(),
    );

    return session;
  }

  Cycle createCycle(Session session) {
    Cycle cycle = Cycle(
      id: uuid.v4(),
      sessionId: session.id,
      focusTime: 0,
    );

    _database.insert(
      'Cycle',
      cycle.toMap(),
    );

    return cycle;
  }

  void updateCycle(Cycle cycle) {
    var mappedCycle = cycle.toMap();
    mappedCycle.remove('id');

    _database.update(
      'Cycle',
      mappedCycle,
      where: 'id = ?', 
      whereArgs: [cycle.id]
    );
  }

  Future<List<Session>> getAllSessions() async {
    List<Map<String, dynamic>> sessionsMap = await _database.query('Session');
    return sessionsMap.map((session) => Session.fromMap(session)).toList();
  }

  Future<Session> getSessionWithCycles(String id) async {
    List<Map<String, dynamic>> sessionsMap =
        await _database.query('Session', where: 'id = ?', whereArgs: [id]);
    List<Map<String, dynamic>> cyclesMap = await _database
        .query('Cycle', where: 'session_id = ?', whereArgs: [id]);

    List<Cycle> cycles =
        cyclesMap.map((cycle) => Cycle.fromMap(cycle)).toList();

    Session session = Session.fromMap(sessionsMap.first);
    session.cycles = cycles;

    return session;
  }

  Future<List<Cycle>> getCyclesForSession(String sessionId) async {
    List<Map<String, dynamic>> cyclesMap = await _database
        .query('Cycle', where: 'session_id = ?', whereArgs: [sessionId]);
    return cyclesMap.map((cycle) => Cycle.fromMap(cycle)).toList();
  }
}
