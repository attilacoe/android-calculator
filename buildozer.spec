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
api = 30
minapi = 21
ndk = 21.4.7075529

# اضافه کردن این خطوط
android.accept_sdk_license = True
android.auto_accept_license = True

[android:tool]
android_sdk_tools_revision = 26.1.1
