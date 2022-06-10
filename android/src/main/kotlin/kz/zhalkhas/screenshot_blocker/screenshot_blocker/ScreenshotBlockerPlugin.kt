package kz.zhalkhas.screenshot_blocker.screenshot_blocker

import android.app.Activity
import android.view.WindowManager.LayoutParams.FLAG_SECURE
import androidx.annotation.NonNull
import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.embedding.engine.plugins.activity.ActivityAware
import io.flutter.embedding.engine.plugins.activity.ActivityPluginBinding
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.common.MethodChannel.Result


/** ScreenshotBlockerPlugin */
class ScreenshotBlockerPlugin : FlutterPlugin, MethodCallHandler, ActivityAware {
    /// The MethodChannel that will the communication between Flutter and native Android
    ///
    /// This local reference serves to register the plugin with the Flutter Engine and unregister it
    /// when the Flutter Engine is detached from the Activity
    private lateinit var channel: MethodChannel
    private var activity: Activity? = null

    override fun onAttachedToEngine(@NonNull flutterPluginBinding: FlutterPlugin.FlutterPluginBinding) {
        channel = MethodChannel(flutterPluginBinding.binaryMessenger, "screenshot_blocker")
        channel.setMethodCallHandler(this)
    }

    override fun onMethodCall(@NonNull call: MethodCall, @NonNull result: Result) {

        when (call.method) {
            "blockWindow" -> {
                if (activity != null && !checkIfBlocked()) {
                    activity?.window?.addFlags(FLAG_SECURE)
                    result.success(null)
                } else {
                    result.error("No Activity attached", "No Activity attached to a plugin", null)
                }
            }
            "unblockWindow" -> {
                if (activity != null && checkIfBlocked()) {
                    activity?.window?.clearFlags(FLAG_SECURE)
                    result.success(null)
                } else {
                    result.error("No Activity attached", "No Activity attached to a plugin", null)
                }
            }
            "getWindowStatus" -> {
                if (activity != null) {
                    val flags = activity?.window?.attributes?.flags ?: 0
                    val isBlocked = (FLAG_SECURE and flags) > 0;
                    result.success(isBlocked)
                } else {
                    result.error("No Activity attached", "No Activity attached to a plugin", null)
                }
            }
            else -> result.notImplemented()

        }
    }

    fun checkIfBlocked(): Boolean {
        val flags = activity?.window?.attributes?.flags ?: 0
        return (FLAG_SECURE and flags) > 0;
    }

    override fun onDetachedFromEngine(@NonNull binding: FlutterPlugin.FlutterPluginBinding) {
        channel.setMethodCallHandler(null)
    }

    override fun onAttachedToActivity(binding: ActivityPluginBinding) {
        activity = binding.activity
    }

    override fun onDetachedFromActivityForConfigChanges() {
        activity = null
    }

    override fun onReattachedToActivityForConfigChanges(binding: ActivityPluginBinding) {
        activity = binding.activity
    }

    override fun onDetachedFromActivity() {
        activity = null
    }
}
