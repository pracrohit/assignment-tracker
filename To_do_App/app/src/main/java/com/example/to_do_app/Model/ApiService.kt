package com.example.to_do_app.Model
import okhttp3.ResponseBody
import retrofit2.http.GET
interface ApiService {
    @GET("Devloper") // Replace with your API endpoint
    suspend fun getMockData(): List<MockData> // Change return type based on your API response
}