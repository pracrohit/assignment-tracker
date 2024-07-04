package com.example.androidassign_md002

import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import android.widget.Button
import android.widget.EditText
import android.widget.ImageView
import android.widget.TextView
import com.example.androidassign_md002.R

class MainActivity : AppCompatActivity() {

    private lateinit var textViewWelcome: TextView
    private lateinit var editTextInput: EditText
    private lateinit var buttonUpdate: Button
    private lateinit var imageViewStatic: ImageView

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_main)

        // Initialize views
        textViewWelcome = findViewById(R.id.textViewWelcome)
        editTextInput = findViewById(R.id.editTextInput)
        buttonUpdate = findViewById(R.id.buttonUpdate)
        imageViewStatic = findViewById(R.id.imageViewStatic)

        // Set initial text for TextView
        textViewWelcome.text = "Welcome!"

        // Set click listener for the button
        buttonUpdate.setOnClickListener {
            val inputText = editTextInput.text.toString()
            textViewWelcome.text = inputText
        }
    }
}
