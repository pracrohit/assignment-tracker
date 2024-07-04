plugins {
    alias(libs.plugins.android.application)
    alias(libs.plugins.jetbrains.kotlin.android)
    alias(libs.plugins.jetbrains.kotlin.ksp)
    id("com.google.gms.google-services")
    id ("kotlin-parcelize")
}

android {
    namespace = "com.example.to_do_app"
    compileSdk = 34

    defaultConfig {
        applicationId = "com.example.to_do_app"
        minSdk = 24
        targetSdk = 34
        versionCode = 1
        versionName = "1.0"

        testInstrumentationRunner = "androidx.test.runner.AndroidJUnitRunner"
    }

    buildTypes {
        release {
            isMinifyEnabled = false
            proguardFiles(
                getDefaultProguardFile("proguard-android-optimize.txt"),
                "proguard-rules.pro"
            )
        }
    }
    compileOptions {
        sourceCompatibility = JavaVersion.VERSION_1_8
        targetCompatibility = JavaVersion.VERSION_1_8
    }
    kotlinOptions {
        jvmTarget = "1.8"
    }
}

dependencies {
    implementation(libs.androidx.core.ktx)
    implementation(libs.androidx.appcompat)
    implementation(libs.material)
    implementation(libs.androidx.activity)
    implementation(libs.androidx.constraintlayout)
    implementation(libs.retrofit)
    implementation(libs.converter.gson)
    implementation(libs.android.room.runtime)
    implementation(libs.google.firebase.database.ktx)
    implementation(libs.firebase.database)
    ksp(libs.android.room.compiler)
    implementation(libs.android.room.ktx)
    implementation(platform(libs.firebase.bom))
   // implementation(libs.implementation.com.firebase.database.ktx)
    implementation ("com.google.firebase:firebase-analytics:17.5.0")

    //implementation(libs.firebase.analytics)
    testImplementation(libs.junit)
    androidTestImplementation(libs.androidx.junit)
    androidTestImplementation(libs.androidx.espresso.core)
}
