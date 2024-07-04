package com.example.to_do_app.View

import android.content.Intent
import android.os.Bundle
import android.widget.Button
import android.widget.EditText
import android.widget.Toast
import androidx.appcompat.app.AppCompatActivity
import androidx.lifecycle.lifecycleScope
import com.example.to_do_app.Model.AppDatabase
import com.example.to_do_app.Model.Repo.TaskRepository
import com.example.to_do_app.Model.Task
import com.example.to_do_app.R
import kotlinx.coroutines.launch

class AddingTask : AppCompatActivity() {
    private lateinit var editText: EditText
    private lateinit var openHome: Button
    private lateinit var database: AppDatabase
    private lateinit var taskRepository: TaskRepository

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_task_page)

        editText = findViewById(R.id.editText)
        openHome = findViewById(R.id.openNewActivityButton)
        database = AppDatabase.getDatabase(this)

        openHome.setOnClickListener {
            val taskTitle = editText.text.toString()
            if (taskTitle.isNotEmpty()) {
                val task = Task(taskTitle = taskTitle)
                lifecycleScope.launch {
                    database.taskDao().insertTask(task)
                   // taskRepository.insertTask(task)

                    Toast.makeText(this@AddingTask, "Task added", Toast.LENGTH_SHORT).show()
                }

            } else {
                Toast.makeText(this@AddingTask, "Task title cannot be empty", Toast.LENGTH_SHORT).show()
            }

            // Intent to navigate back to MainActivity
            val intent = Intent(this, MainActivity::class.java)
            startActivity(intent)
        }
    }
}

