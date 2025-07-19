import 'package:flutter/material.dart';

void main() {
  runApp(const TaskManagerApp());
}

class TaskManagerApp extends StatelessWidget {
  const TaskManagerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Task Manager',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
        useMaterial3: true,
      ),
      home: const TaskListScreen(),
    );
  }
}

class TaskListScreen extends StatefulWidget {
  const TaskListScreen({super.key});

  @override
  State<TaskListScreen> createState() => _TaskListScreenState();
}

class _TaskListScreenState extends State<TaskListScreen> {
  final List<String> _tasks = [];
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _addTask(String task) {
    setState(() {
      _tasks.add(task);
    });
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Task "$task" added')),
    );
  }

  void _showAddTaskDialog() {
    _controller.clear();
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text('Add New Task'),
        content: TextFormField(
          controller: _controller,
          decoration: const InputDecoration(
            hintText: 'Enter task',
            border: OutlineInputBorder(),
          ),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Task cannot be empty';
            }
            return null;
          },
        ),
        actions: [
          TextButton(
            onPressed: () {
              final task = _controller.text.trim();
              if (task.isNotEmpty) {
                _addTask(task);
              }
              Navigator.pop(context);
            },
            child: const Text('Add'),
          ),
        ],
      ),
    );
  }

  void _navigateToDetails(String task) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => TaskDetailScreen(task: task),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const Drawer(child: Center(child: Text('Drawer menu here'))),
      appBar: AppBar(title: const Text('Task Manager')),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.list), label: 'Tasks'),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Settings'),
        ],
      ),
      body: Scrollbar(
        child: ListView.builder(
          itemCount: _tasks.length,
          itemBuilder: (_, index) {
            return GestureDetector(
              onTap: () => _navigateToDetails(_tasks[index]),
              child: TaskTile(task: _tasks[index]),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _showAddTaskDialog,
        child: const Icon(Icons.add),
      ),
    );
  }
}

// ✅ Reusable Task tile widget
class TaskTile extends StatelessWidget {
  final String task;
  const TaskTile({super.key, required this.task});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(task),
      trailing: PopupMenuButton<String>(
        onSelected: (value) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('$value on "$task"')));
        },
        itemBuilder: (context) => [
          const PopupMenuItem(value: 'Edit', child: Text('Edit')),
          const PopupMenuItem(value: 'Delete', child: Text('Delete')),
        ],
      ),
    );
  }
}

// ✅ Navigation target screen
class TaskDetailScreen extends StatelessWidget {
  final String task;
  const TaskDetailScreen({super.key, required this.task});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Task Detail')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.task_alt, size: 60, color: Colors.teal),
            const SizedBox(height: 20),
            Text('Task: $task', style: Theme.of(context).textTheme.headlineSmall),
          ],
        ),
      ),
    );
  }
}
