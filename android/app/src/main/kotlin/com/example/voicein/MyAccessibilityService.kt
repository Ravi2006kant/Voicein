package com.example.voicein

import android.accessibilityservice.AccessibilityService
import android.util.Log
import android.view.accessibility.AccessibilityEvent

class MyAccessibilityService : AccessibilityService() {

    override fun onServiceConnected() {
        super.onServiceConnected()
        Log.d("ACCESSIBILITY", "SERVICE CONNECTED")
    }

    override fun onAccessibilityEvent(event: AccessibilityEvent?) {

        val packageName = event?.packageName?.toString()

        Log.d("ACCESSIBILITY", "APP: $packageName")

        if (packageName == "com.google.android.gm") {
            Log.d("ACCESSIBILITY", "GMAIL DETECTED")
        }
    }

    override fun onInterrupt() {}
}