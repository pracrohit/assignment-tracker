package com.example.to_do_app.Model.Repo

import android.util.Log
import com.example.to_do_app.Model.Task
import com.example.to_do_app.Model.TaskDao
import com.google.firebase.database.FirebaseDatabase
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.flow.Flow
import kotlinx.coroutines.tasks.await
import kotlinx.coroutines.withContext
import kotlinx.coroutines.flow.first


class TaskRepository(private val taskDao: TaskDao) {

    private val firebaseDatabase = FirebaseDatabase.getInstance().getReference("tasks")

    suspend fun insertTask(task: Task) {
        taskDao.insertTask(task)
        syncTaskWithFirebase(task)
    }

    // Update task and sync with Firebase
    suspend fun updateTask(task: Task) {
        taskDao.updateTask(task)
        syncTaskWithFirebase(task)
    }

    // Delete task and sync with Firebase
    suspend fun deleteTask(task: Task) {
        taskDao.deleteTask(task)
        deleteTaskFromFirebase(task)
    }

    // Get all tasks
    fun getAllTasks(): Flow<List<Task>> {
        return taskDao.getAllTasks()
    }

     suspend fun syncAllTasks() = withContext(Dispatchers.IO) {
        try {
            val tasks = taskDao.FetchAll().first()
            for (task in tasks) {
                firebaseDatabase.child(task.id.toString()).setValue(task).await()
            }
            Log.d("FirebaseSync", "All tasks synced successfully")
        } catch (e: Exception) {
            Log.e("FirebaseSync", "Error syncing all tasks", e)
        }
    }


    // Method to sync tasks with Firebase Realtime Database
    private suspend fun syncTaskWithFirebase(task: Task) = withContext(Dispatchers.IO) {
        //firebaseDatabase.child(task.id.toString()).setValue(task)
        try {
            firebaseDatabase.child(task.id.toString()).setValue(task).await()
            Log.d("FirebaseSync", "Task synced successfully: ${task.id}")
        } catch (e: Exception) {
            Log.e("FirebaseSync", "Error syncing task: ${task.id}", e)
        }

    }

    // Delete task from Firebase
    private suspend fun deleteTaskFromFirebase(task: Task) = withContext(Dispatchers.IO) {
      //  firebaseDatabase.child(task.id.toString()).removeValue()
        try {
            firebaseDatabase.child(task.id.toString()).removeValue().await()
            Log.d("FirebaseSync", "Task deleted successfully: ${task.id}")
        } catch (e: Exception) {
            Log.e("FirebaseSync", "Error deleting task: ${task.id}", e)
        }

    }


    // Existing Room operations...
}
