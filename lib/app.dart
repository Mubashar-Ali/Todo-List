import 'package:flutter/material.dart';
import 'package:todo_list/components/card.dart';
import 'package:todo_list/database/todo_db.dart';
import 'package:todo_list/models/todo_model.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  final db = TodoDB();
  late final TextEditingController titleController = TextEditingController();
  late final TextEditingController descriptionController =
      TextEditingController();

  List<TodoModel> todos = [];

  @override
  void initState() {
    super.initState();
    // titleController = TextEditingController();
    // descriptionController = TextEditingController();
    fetchTodos();
  }

  fetchTodos() async {
    todos = await db.getTodos();
    setState(() {});
  }

  Future<void> addTodo() async {
    final title = titleController.text.trim();
    final description = descriptionController.text.trim();

    if (title.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Title cannot be empty!')),
      );
      return;
    }

    final newTodo = TodoModel(
      title: title,
      description: description,
    );

    await db.insertTodo(newTodo);
    titleController.clear();
    descriptionController.clear();

    fetchTodos(); // Refresh the list
  }

  Future<void> deleteTodo(int id) async {
    await db.deleteTodo(id);
    fetchTodos(); // Refresh the list
  }

  @override
  void dispose() {
    titleController.dispose();
    descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      // backgroundColor: Colors.black,
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                TextField(
                  controller: titleController,
                  decoration: const InputDecoration(labelText: 'Title'),
                ),
                TextField(
                  controller: descriptionController,
                  decoration: const InputDecoration(labelText: 'Description'),
                ),
                const SizedBox(height: 16),
                // ElevatedButton(
                //   onPressed: addTodo,
                //   child: const Text('Add Todo'),
                // ),
              ],
            ),
          ),
          Expanded(
            child: todos.isEmpty
                ? const Center(child: Text('No todos found!!'))
                : ListView.builder(
                    itemCount: todos.length,
                    itemBuilder: (context, index) {
                      final todo = todos[index];
                      // return ListTile(
                      //   title: Text(todo.title),
                      //   subtitle: Text(todo.description ?? ''),
                      //   trailing: IconButton(
                      //     icon: const Icon(Icons.delete, color: Colors.red),
                      //     onPressed: () => deleteTodo(todo.id!),
                      //   ),
                      // );
                      return MyCard(title: todo.title, description: todo.description);
                    },
                  ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        shape: const CircleBorder(),
        foregroundColor: Colors.white,
        backgroundColor: Colors.blue,
        onPressed: addTodo,
        // onPressed: () {
        //   print('Clicked...');
        // },
        child: const Icon(Icons.add, size: 24),
      ),
    );
  }
}
