import 'package:flutter/cupertino.dart';
import 'package:sqflite/sqflite.dart';
import 'package:todo_app/models/model.dart';

class SqfliteHelper {
  late Database db;

  // خطوات انشاء DB
  // 1- create db
  // 2- create table
  // 3- crud => insert - delete - update - get

// initDatabase

  Future<void> initDatabase() async {
    // step1 => create db
    await openDatabase(
      'tasks.db',
      version: 1,
      onOpen: (db) => debugPrint('Database opened'),
      onCreate: (db, version) async {
        // step2 => create table
        await db.execute(
          '''
            CREATE TABLE Tasks(
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            title TEXT,
            note TEXT,
            date TEXT,
            startTime TEXT,
            endTime TEXT,
            color INTEGER,
            isCompleted INTEGER
            )
        ''',
        ).then((value) => debugPrint('Database created successfully'));
      },
    )
        .then(
      (value) => db = value,
    );
  }

  // get

  Future<List<Map<String, Object?>>> getFromDatabase() async {
    return await db.rawQuery('SELECT * FROM Tasks');
  }

// insert

  Future<int> insertToDatabase(TaskModel model) async {
    return await db.rawInsert(
      '''
      INSERT INTO Tasks(
      title,note,date,startTime,endTime, color,isCompleted)
      VALUES(
      '${model.title}','${model.note}','${model.date}','${model.startTime}','${model.endTime}',
      '${model.color}','${model.isCompleted}'
      )
      ''',
    );
  }

  //update
  Future<int> updateDatabase(int id)async{
    return await db.rawUpdate(
        '''
        UPDATE Tasks
        SET isCompleted = ?
        WHERE id = ?
        ''',[1,id]
    );
}

//delete
  Future<int> deleteFromDatabase(int id)async{
    return await db.rawDelete(
        '''
        DELETE FROM Tasks WHERE id = ?
        ''',[id]
    );
}
}
