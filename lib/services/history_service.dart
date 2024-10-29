// // import 'package:flutter/material.dart';
// // import 'package:matedoro_flutter/models/pomodoro_session.dart';
// // import 'package:matedoro_flutter/models/work_session.dart';
// // import 'package:path/path.dart';
// // import 'package:sqflite/sqflite.dart';
// // import 'package:uuid/uuid.dart';
// // import 'package:uuid/v4.dart';

// // // void main() async {
// // //   WidgetsFlutterBinding.ensureInitialized();
// // //   // Open the database and store the reference.
// // //   final database = openDatabase(
// // //     // Set the path to the database. Note: Using the `join` function from the
// // //     // `path` package is best practice to ensure the path is correctly
// // //     // constructed for each platform.
// // //     join(await getDatabasesPath(), 'matedoro.db'),
// // //     // When the database is first created, create a table to store dogs.
// // //     onCreate: (db, version) {
// // //       // Run the CREATE TABLE statement on the database.
// // //       return db.execute(
// // //         '''
// // //           CREATE TABLE "PomodoroSession"(
// // //             "id" UUID NOT NULL,
// // //             "work_session" UUID NOT NULL,
// // //             "pomodori_count" BIGINT NOT NULL,
// // //             "focus_time" BIGINT NOT NULL,
// // //             "break_time" BIGINT NOT NULL
// // //           );
// // //           ALTER TABLE
// // //             "PomodoroSession" ADD PRIMARY KEY("id");
// // //           CREATE TABLE "WorkSession"(
// // //             "id" UUID NOT NULL,
// // //             "date" TIMESTAMP(0) WITHOUT TIME ZONE NOT NULL,
// // //             "total_focus_time" BIGINT NOT NULL
// // //           );
// // //           ALTER TABLE
// // //             "WorkSession" ADD PRIMARY KEY("id");
// // //           ALTER TABLE
// // //             "PomodoroSession" ADD CONSTRAINT "pomodorosession_work_session_foreign" FOREIGN KEY("work_session") REFERENCES "WorkSession"("id");
// // //         ''',
// // //       );
// // //     },
// // //     // Set the version. This executes the onCreate function and provides a
// // //     // path to perform database upgrades and downgrades.
// // //     version: 1,
// // //   );


// // // }

// // class DatabaseService {
// //   late Database _database;

// //   Uuid uuid = Uuid();

// //   DatabaseService() {
// //     initialise();
// //   }

// //   Future initialise() async {
// //     _database = await openDatabase(
// //     // Set the path to the database. Note: Using the `join` function from the
// //     // `path` package is best practice to ensure the path is correctly
// //     // constructed for each platform.
// //     join(await getDatabasesPath(), 'matedoro.db'),
// //     // When the database is first created, create a table to store dogs.
// //     onCreate: (db, version) {
// //       // Run the CREATE TABLE statement on the database.
// //       return db.execute(
// //         '''
// //           CREATE TABLE "PomodoroSession"(
// //             "id" UUID NOT NULL,
// //             "work_session" UUID NOT NULL,
// //             "pomodori_count" BIGINT NOT NULL,
// //             "focus_time" BIGINT NOT NULL,
// //             "break_time" BIGINT NOT NULL
// //           );
// //           ALTER TABLE
// //             "PomodoroSession" ADD PRIMARY KEY("id");
// //           CREATE TABLE "WorkSession"(
// //             "id" UUID NOT NULL,
// //             "date" TIMESTAMP(0) WITHOUT TIME ZONE NOT NULL,
// //             "total_focus_time" BIGINT NOT NULL
// //           );
// //           ALTER TABLE
// //             "WorkSession" ADD PRIMARY KEY("id");
// //           ALTER TABLE
// //             "PomodoroSession" ADD CONSTRAINT "pomodorosession_work_session_foreign" FOREIGN KEY("work_session") REFERENCES "WorkSession"("id");
// //         ''',
// //       );
// //     },
// //     // Set the version. This executes the onCreate function and provides a
// //     // path to perform database upgrades and downgrades.
// //     version: 1,
// //   );
// //   }

// //   WorkSession createWorkSession() {
// //     WorkSession workSession = WorkSession(
// //       id: uuid.v4(),
// //       date: DateTime.now().millisecondsSinceEpoch,
// //       totalFocusTime: 0
// //     );

// //     _database.insert(
// //       'WorkSession',
// //       workSession.toMap(),
// //     );

// //     return workSession;
// //   }

// //   PomodoroSession createPomodoroSession(WorkSession workSession) {
// //     PomodoroSession pomodoroSession = PomodoroSession(
// //       id: uuid.v4(),
// //       workSessionId: workSession.id,
// //       pomodoriCount: 1,
// //       focusTime: 0,
// //       breakTime: 0
// //     );

// //     _database.insert(
// //       'PomodoroSession',
// //       pomodoroSession.toMap(),
// //     );

// //     return pomodoroSession;
// //   }
// // }


// import 'package:matedoro_flutter/models/session.dart';
// import 'package:matedoro_flutter/models/cycle.dart';
// import 'package:uuid/uuid.dart';

// class HistoryService {
//   Uuid uuid = Uuid();

//   WorkSession createWorkSession() {
//     WorkSession workSession = WorkSession(
//       id: uuid.v4(),
//       date: DateTime.now().millisecondsSinceEpoch,
//       totalFocusTime: 0
//     );

//     // _database.insert(
//     //   'WorkSession',
//     //   workSession.toMap(),
//     // );

//     return workSession;
//   }

//   PomodoroSession createPomodoroSession(WorkSession workSession) {
//     PomodoroSession pomodoroSession = PomodoroSession(
//       id: uuid.v4(),
//       workSessionId: workSession.id,
//       pomodoriCount: 1,
//       focusTime: 0,
//       breakTime: 0
//     );

//     // _database.insert(
//     //   'PomodoroSession',
//     //   pomodoroSession.toMap(),
//     // );

//     return pomodoroSession;
//   }
// }