package com.example.voicein

import android.accessibilityservice.AccessibilityService
import android.view.accessibility.AccessibilityEvent
import android.util.Log

class MyAccessibilityService : AccessibilityService() {

    override fun onAccessibilityEvent(event: AccessibilityEvent?) {

        val packageName = event?.packageName?.toString()

        Log.d("ACCESSIBILITY", "App Opened: $packageName")

        if (packageName == "com.google.android.gm") {
            Log.d("ACCESSIBILITY", "GMAIL DETECTED")
        }
    }

    override fun onInterrupt() {}
}