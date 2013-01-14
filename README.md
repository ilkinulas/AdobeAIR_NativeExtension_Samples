Adobe AIR Native Extension Samples
-----------------------------------
* Examples in this repository uses native extensions developed by *freshplanet* https://github.com/freshplanet/
* ANEFacebookSample : Uses facebook application native activity to connect to facebook. If the android device has an older version of the Facebook application connecting to facebook will be handled by WebView.
Native Extension page : https://github.com/freshplanet/ANE-Facebook

* ANEInAppPurchaseSample : Google Play test purchase.
Native Extension page : https://github.com/freshplanet/ANE-In-App-Purchase

Compiling ANE tips:
* You must use 32 bit JVM. Flex SDK can not build the native extension with 64 JVM.
 1. Edit "/Applications/Adobe Flash Builder 4.7/sdks/4.6.0/bin/jvm.config" file. Add "-d32" parameter to "java.args".
 2. export JAVA_HOME=/System/Library/Java/JavaVirtualMachines/1.6.0.jdk/Contents/Home/


Facebook integration tips:
* If you can not figure out the value of the android hash-key, check the logcat error message returned from facebook. Copy the hash-key written in the error log and paste it into the proper field in facebook application console.

NOT : samples are for android only.