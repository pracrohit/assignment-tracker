package com.example.to_do_app.View

import android.content.Intent
import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import android.widget.Button
import android.widget.TextView
import androidx.lifecycle.lifecycleScope
import androidx.recyclerview.widget.LinearLayoutManager
import androidx.recyclerview.widget.RecyclerView
import com.example.to_do_app.Model.AppDatabase
import com.example.to_do_app.Model.RetrofitInstance
import com.example.to_do_app.R
import com.example.to_do_app.ViewModel.TaskAdapter
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.launch
import kotlinx.coroutines.withContext

class MainActivity : AppCompatActivity() {
    private lateinit var database: AppDatabase
    private lateinit var textView: TextView
    private lateinit var openNewActivityButton: Button
    private lateinit var recyclerView: RecyclerView
    private lateinit var taskAdapter: TaskAdapter

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_main)

        // Initialize views and database
        textView = findViewById(R.id.textView)
        openNewActivityButton = findViewById(R.id.openNewActivityButton)
        recyclerView = findViewById(R.id.recyclerView)

        // Initialize Room database and RecyclerView
        database = AppDatabase.getDatabase(this)
        taskAdapter = TaskAdapter()

        recyclerView.apply {
            layoutManager = LinearLayoutManager(this@MainActivity)
            adapter = taskAdapter
        }

        // Fetch data from API and database
        fetchDataFromApi()
        fetchTasksFromDb()

        // Button click listener to open AddingTask activity
        openNewActivityButton.setOnClickListener {
            val intent = Intent(this, AddingTask::class.java)
            startActivity(intent)
        }
    }

    override fun onResume() {
        super.onResume()
        fetchTasksFromDb()
    }

    private fun fetchDataFromApi() {
        lifecycleScope.launch {
            try {
                // Make Retrofit API call
                val response = withContext(Dispatchers.IO) {
                    RetrofitInstance.apiService.getMockData()
                }

                // Update UI with the fetched data
                if (response.isNotEmpty()) {
                    val data = "${response[0].title}'s To Do List" // Example: Display first item
                    textView.text = data
                } else {
                    textView.text = "No data available"
                }
            } catch (e: Exception) {
                textView.text = e.message
                // Handle error gracefully
            }
        }
    }

    private fun fetchTasksFromDb() {
        lifecycleScope.launch {
            val tasks = withContext(Dispatchers.IO) {
                database.taskDao().getAllTasks()
            }
            taskAdapter.setTasks(tasks)
        }
    }
}
