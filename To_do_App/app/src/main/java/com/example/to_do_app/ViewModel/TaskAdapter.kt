package com.example.to_do_app.ViewModel

import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import android.widget.TextView
import androidx.recyclerview.widget.RecyclerView
import com.example.to_do_app.Model.Task
import com.example.to_do_app.R
import kotlinx.coroutines.*
import kotlinx.coroutines.flow.Flow
import kotlinx.coroutines.flow.collect

class TaskAdapter : RecyclerView.Adapter<TaskAdapter.TaskViewHolder>() {

    private var tasks: List<Task> = listOf()

    class TaskViewHolder(itemView: View) : RecyclerView.ViewHolder(itemView) {
        val taskTitle: TextView = itemView.findViewById(R.id.taskTitle)
    }

    override fun onCreateViewHolder(parent: ViewGroup, viewType: Int): TaskViewHolder {
        val itemView = LayoutInflater.from(parent.context).inflate(R.layout.item_task, parent, false)
        return TaskViewHolder(itemView)
    }

    override fun onBindViewHolder(holder: TaskViewHolder, position: Int) {
        val task = tasks[position]
        holder.taskTitle.text = task.taskTitle
    }

    override fun getItemCount(): Int {
        return tasks.size
    }

    fun setTasks(tasks: Flow<List<Task>>) {
        // Use lifecycleScope from the fragment or activity
        CoroutineScope(Dispatchers.Main).launch {
            tasks.collect { taskList ->
                this@TaskAdapter.tasks = taskList
                notifyDataSetChanged()
            }
        }
    }
}
