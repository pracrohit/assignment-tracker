package com.example.to_do_app.ViewModel

import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import android.widget.Button
import android.widget.CheckBox
import android.widget.TextView
import androidx.recyclerview.widget.RecyclerView
import com.example.to_do_app.Model.Task
import com.example.to_do_app.R
import kotlinx.coroutines.*
import kotlinx.coroutines.flow.Flow
import kotlinx.coroutines.flow.collect

class TaskAdapter(private val onDeleteClick: (Task) -> Unit, private val onEditClick: (Task) -> Unit,private val onTaskStatusChanged: (Task) -> Unit ) : RecyclerView.Adapter<TaskAdapter.TaskViewHolder>() {

    private var tasks: List<Task> = listOf()
    private var filteredTasks: List<Task> = listOf()
    class TaskViewHolder(itemView: View) : RecyclerView.ViewHolder(itemView) {

        val taskTitle: TextView = itemView.findViewById(R.id.taskTitle)
        val deleteButton: Button = itemView.findViewById(R.id.deleteButton)
        val editButton: Button = itemView.findViewById(R.id.editButton)
        val completedCheckBox: CheckBox = itemView.findViewById(R.id.check)
    }

    override fun onCreateViewHolder(parent: ViewGroup, viewType: Int): TaskViewHolder {
        val itemView = LayoutInflater.from(parent.context).inflate(R.layout.item_task, parent, false)
        return TaskViewHolder(itemView)
    }

    override fun onBindViewHolder(holder: TaskViewHolder, position: Int) {
        val task = filteredTasks[position]
        var str=""
        if(task.completed) str="is completed"
        holder.taskTitle.text = "${task.taskTitle} ${str}"
        holder.deleteButton.setOnClickListener {
            onDeleteClick(task)
        }
        holder.editButton.setOnClickListener {
            onEditClick(task)
        }
        holder.completedCheckBox.setOnCheckedChangeListener { _, isChecked ->
            task.completed = isChecked
            onTaskStatusChanged(task)
        }
    }

    override fun getItemCount(): Int {
        return filteredTasks.size
    }

    fun setTasks(tasks: Flow<List<Task>>) {
        // Use lifecycleScope from the fragment or activity
        CoroutineScope(Dispatchers.Main).launch {
            tasks.collect { taskList ->
                this@TaskAdapter.tasks = taskList
                filterTasks("") // Initialize with empty query to show all tasks
                notifyDataSetChanged()
            }
        }
    }
    fun filterTasks(query: String) {
        filteredTasks = if (query.isEmpty()) {
            tasks
        } else {
            tasks.filter {
                it.taskTitle.contains(query, ignoreCase = true)
            }
        }
        notifyDataSetChanged()
    }
}
