import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../models/task_model.dart';

class TaskService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  String get _userId => _auth.currentUser!.uid;

  CollectionReference get _tasksCollection => _firestore.collection('tasks');

  Stream<List<TaskModel>> getTasksStream() {
    return _tasksCollection.where('userId', isEqualTo: _userId).snapshots().map(
      (snapshot) {
        final tasks = snapshot.docs
            .map((doc) => TaskModel.fromFirestore(doc))
            .toList();

        // Sort locally so this query does not require a Firestore composite
        // index for userId + createdAt.
        tasks.sort((a, b) => b.createdAt.compareTo(a.createdAt));
        return tasks;
      },
    );
  }

  Future<void> addTask(TaskModel task) async {
    await _tasksCollection.add(task.toMap());
  }

  Future<void> updateTask(TaskModel task) async {
    await _tasksCollection.doc(task.id).update(task.toMap());
  }

  Future<void> deleteTask(String taskId) async {
    await _tasksCollection.doc(taskId).delete();
  }

  Future<void> toggleTaskCompletion(TaskModel task) async {
    await _tasksCollection.doc(task.id).update({
      'isCompleted': !task.isCompleted,
    });
  }
}
