
# Scripting Shortcuts Test Project

This simple project is designed to test the new scripting capabilities introduced in the Shortcuts app in macOS Monterey beta 2 (21A5268h).

ScriptingBridge demo code was shown in the ['Meet Shortcuts For macOS'][1] WWDC 2021 video along with [the entitlements][2] required to run it.

An NSAppleEventsUsageDescription string is has to be added to info.plist or it will silently fail. 
 
![run shortcut screenshot](https://i.imgur.com/Z5v0eN3.png)
![list shortcuts screenshot](https://i.imgur.com/2sDpYsK.png)
 
[1]: https://developer.apple.com/videos/play/wwdc2021/10232/?time=1559
[2]: https://developer.apple.com/library/archive/documentation/Miscellaneous/Reference/EntitlementKeyReference/Chapters/AppSandboxTemporaryExceptionEntitlements.html#//apple_ref/doc/uid/TP40011195-CH5-SW1
