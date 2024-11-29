class TodoModel {
  int? id;
  String title;
  String? description;
  String? category;
  bool isDone;
  DateTime date;

  TodoModel({
    this.id,
    required this.title,
    this.description,
    this.category,
    this.isDone = false,
    DateTime? date,
  }) : date = date ?? DateTime.now();

  static String tableName = 'Todo';
  static String columnId = 'id';
  static String columnTitle = 'title';
  static String columnDescription = 'description';
  static String columnCategory = 'category';
  static String columnIsDone = 'isDone';
  static String columnDate = 'date';

  static String createTable = '''
    CREATE TABLE $tableName (
      $columnId INTEGER PRIMARY KEY AUTOINCREMENT,
      $columnTitle TEXT NOT NULL,
      $columnDescription TEXT,
      $columnCategory TEXT,
      $columnIsDone INTEGER DEFAULT 0,
      $columnDate TEXT
    )
  ''';

  // Convert the CardModel to a Map
  Map<String, dynamic> toMap() {
    return {
      columnId: id,
      columnTitle: title,
      columnDescription: description,
      columnCategory: category,
      columnIsDone: isDone ? 1 : 0, // Convert boolean to int for SQLite
      columnDate: date.toIso8601String(), // Store DateTime as ISO string
    };
  }

  // Create a CardModel from a Map
  factory TodoModel.fromMap(Map<String, dynamic> map) {
    return TodoModel(
      id: map[columnId] as int?,
      title: map[columnTitle] as String,
      description: map[columnDescription] as String?,
      category: map[columnCategory] as String?,
      isDone: (map[columnIsDone] as int) == 1, // Convert int to boolean
      date: DateTime.parse(map[columnDate] as String), // Parse ISO string to DateTime
    );
  }
}
