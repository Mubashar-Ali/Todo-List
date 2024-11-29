import 'package:todo_list/database/db_helper.dart';
import 'package:todo_list/models/todo_model.dart';

class TodoDB {
  insertTodo(TodoModel todo) async {
    final db = await DbHelper.getDB();
    db.insert(TodoModel.tableName, todo.toMap());
  }

  // Get all cards
  Future<List<TodoModel>> getTodos() async {
    final db = await DbHelper.getDB();
    final result = await db.query(TodoModel.tableName);
    return result.map((map) => TodoModel.fromMap(map)).toList();
  }

  // Update a CardModel
  Future<int> updateTodo(TodoModel card) async {
    final db = await DbHelper.getDB();
    return await db.update(
      TodoModel.tableName,
      card.toMap(),
      where: '${TodoModel.columnId} = ?',
      whereArgs: [card.id],
    );
  }

  // Delete a CardModel by ID
  Future<int> deleteTodo(int id) async {
    final db = await DbHelper.getDB();
    return await db.delete(
      TodoModel.tableName,
      where: '${TodoModel.columnId} = ?',
      whereArgs: [id],
    );
  }
}
