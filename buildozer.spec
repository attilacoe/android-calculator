[app]
title = Calculator
package.name = calculator
package.domain = org.example

source.dir = .
source.include_exts = py,png,jpg,kv,atlas,ttf

version = 1.0
requirements = python3,kivy

orientation = portrait

[buildozer]
log_level = 2

[android]
api = 33
minapi = 21
ndk = 25b

# اضافه کردن این خطوط برای حل مشکل licenses
android.accept_sdk_license = True
android.sdk_dir = /home/runner/.buildozer/android/platform/android-sdk

[android:tool]
android_sdk_tools_revision = 26.1.1
