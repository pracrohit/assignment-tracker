package com.example.to_do_app.View

import android.annotation.SuppressLint
import android.os.Bundle
import android.widget.Button
import android.widget.EditText
import androidx.appcompat.app.AppCompatActivity
import androidx.lifecycle.lifecycleScope
import com.example.to_do_app.Model.AppDatabase
import com.example.to_do_app.Model.Repo.TaskRepository
import com.example.to_do_app.R
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.launch
import kotlinx.coroutines.withContext

class EditTaskActivity : AppCompatActivity() {
    private lateinit var database: AppDatabase
    private lateinit var taskTitleEditText: EditText
    private lateinit var saveButton: Button
    private var taskId: Int = -1
    private lateinit var taskRepository: TaskRepository
    @SuppressLint("MissingInflatedId")
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_edit_task)

        database = AppDatabase.getDatabase(this)
        taskTitleEditText = findViewById(R.id.editText)
        saveButton = findViewById(R.id.save)

        taskId = intent.getIntExtra("taskId", -1)

        if (taskId == -1) {
            finish() // Handle invalid task ID gracefully
        } else {
            lifecycleScope.launch {
                val task = withContext(Dispatchers.IO) {
                    database.taskDao().getTaskById(taskId)
                }
                task?.let {
                    taskTitleEditText.setText(it.taskTitle)
                }

                saveButton.setOnClickListener {
                    updateTask()
                }
            }
        }
    }

    private fun updateTask() {
        val newTaskTitle = taskTitleEditText.text.toString().trim()
        if (newTaskTitle.isNotEmpty()) {
            lifecycleScope.launch {
                val task = withContext(Dispatchers.IO) {
                    database.taskDao().getTaskById(taskId)
                }
                task?.let {
                    it.taskTitle = newTaskTitle
                    database.taskDao().updateTask(it)
                }
                taskRepository.syncAllTasks()
                finish()
            }
        } else {
            // Handle empty task title
        }
    }
}
