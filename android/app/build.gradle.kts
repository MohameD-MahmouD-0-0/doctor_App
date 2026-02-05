plugins {
    id("com.android.application")
    id("kotlin-android")
    // The Flutter Gradle Plugin must be applied after the Android and Kotlin Gradle plugins.
    id("dev.flutter.flutter-gradle-plugin")
}

android {
    namespace = "com.example.doctor"
    compileSdk = flutter.compileSdkVersion
    ndkVersion = "29.0.13113456"

    compileOptions {
        sourceCompatibility = JavaVersion.VERSION_11
        targetCompatibility = JavaVersion.VERSION_11
    }

    kotlinOptions {
        jvmTarget = JavaVersion.VERSION_11.toString()
    }
    
    defaultConfig {
        // TODO: Specify your own unique Application ID (https://developer.android.com/studio/build/application-id.html).
        applicationId = "com.example.doctor"
        // You can update the following values to match your application needs.
        // For more information, see: https://flutter.dev/to/review-gradle-config.
        minSdk = flutter.minSdkVersion
        targetSdk = flutter.targetSdkVersion
        versionCode = flutter.versionCode
        versionName = flutter.versionName
    }
    
    flavorDimensions += "default"
    productFlavors {
        create("Development") {
            dimension = "default"
            resValue(
                type = "string",
                name = "app_name",
                value = "Doctor Development"
            )
            applicationIdSuffix = ".dev"
        }
        create("Production") {
            dimension = "default"
            resValue(
                type = "string",
                name = "app_name",
                value = "Doctor Production"
            )
                applicationIdSuffix = ".production"
        }
    }
    
    buildTypes {
        release {
            // TODO: Add your own signing config for the release build.
            // Signing with the debug keys for now, so `flutter run --release` works.
            signingConfig = signingConfigs.getByName("debug")
        }
    }

    flutter {
        source = "../.."
    }
}

// Copy APK files to Flutter expected location
afterEvaluate {
    android.applicationVariants.all {
        val variant = this
        val flavorName = variant.flavorName?.lowercase() ?: "default"
        val buildType = variant.buildType.name.lowercase()
        
        variant.assembleProvider.get().doLast {
            val flavorDir = variant.flavorName ?: "default"
            val apkOutputDir = file("build/outputs/apk/${flavorDir}/${buildType}")
            val flutterApkDir = file("${rootProject.projectDir}/../build/app/outputs/flutter-apk")
            flutterApkDir.mkdirs()
            
            if (apkOutputDir.exists()) {
                apkOutputDir.listFiles()?.forEach { apkFile ->
                    if (apkFile.isFile && apkFile.name.endsWith(".apk")) {
                        // Copy with flavor name
                        val newName = "app-${flavorName}-${buildType}.apk"
                        val destFile = File(flutterApkDir, newName)
                        apkFile.copyTo(destFile, overwrite = true)
                        
                        // Also copy as app-debug.apk for default flavor (Development) when debug
                        // This allows flutter run to work without specifying flavor
                        if (flavorName == "development" && buildType == "debug") {
                            val defaultName = "app-debug.apk"
                            val defaultDestFile = File(flutterApkDir, defaultName)
                            apkFile.copyTo(defaultDestFile, overwrite = true)
                        }
                    }
                }
            }
        }
    }
}