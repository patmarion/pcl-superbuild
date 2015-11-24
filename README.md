CMake build scripts for cross compiling PCL and its dependencies for Android and iOS.

## Requirements

* Android NDK, Revision 8d
* Android SDK (unsure about specific version)

# Building for Android

    $ mkdir build && cd build
    $ cmake -DBUILD_IOS_DEVICE:BOOL="OFF" ../
    $ export ANDROID_NDK=${PATH_TO_ANDROID_NDK_R8}
    $ make
