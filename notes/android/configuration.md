## Configure your build with Gradle

The Android build system compiles app resources and source code, and packages
them into APKs that we can test, deploy, sign, and distribute. **Gradle
Intensifies**. 


### Gradle

Gradle is a build tool, used to automate and manage the build process of Android
applications, allowing the developer to define flexible custom build
configurations. Each build configuration can define its own set of code and
resources, while reusing common parts to all versions of our app. The Android
plugin for Gradle works with the build toolkit to provide processes and
configuratble settings that are specific to building and testing Android
applications.

## The Build Process

The build process involves many tools and processes that convert your project
into an *Android Application Package* (APK).

![build_process](images/build-process.png)

The Build process for a typical Android app module, follow these general steps:

1. The compilers convert your source code into DEX (Dalvik Executable) files,
   which include the bytecode that runs on Android devices, and everything else
   into compiled resources
2. The APK Packager combines the DEX files and compiled resources into a single
   APK. Before your app can be installed and eployed onto an Android device,
   however, the APK must be signed.
3. The APK Packager signes your APK using either the debug release keystore:

    * If you are building a debug version of your app, the packager signs your app
  with the debug keystore. Android Studio automataically configures new projects
  with a debug keystore.
    * If you are building a release version of your app, the packager signs your app
  with the release keystore. To create a release keystore, read about signing
  your app in Android Studio.
4. Before generating your final APK, the packager uses the zipalign tool to
   optimize your app to use less memory when running on a device.

At the end of the buld process, you either have a debug APK or release APK of
your app that you can use to deploy, test, or release to external users.

## Custom build configurations

Gradle and the Android plugin help you configure the following aspects of your
build.

*Build Types*
> Build types define certain properties that Gradle uses when building and
> packaging your app, and are typically configured for different stages of your
> development lifecycle. For example, the debug build type enables debug options
> and signs the APK with the debug key, while the release build type may shrink,
> obfuscate, and sign your APK with a release key for distribution. You must
> define at least one build type in order to build your app-Android Studio
> creates the debug and release build types by default.

*Product flavors*
> Product falovors represent different versions of your app that you may release
> to users, such as free and paid versions of your app. You can customize
> product flavors to use different code and resources, while sharing and reusing
> the parts that are common to all versions of your app. Product flavors are
> optional and you must create them manually.

*Build variants*
> A build variant is a cross product of a build type and a product flaovor, and
> is the configuration Gradle uses to build your app. Using build variants, you
> can build the debug version of your product flavors during development, or
> signsign release versions of your product flaovrs for distribution. Although
> you do not configure the build variants directly, you do configure the build
> types and product flavors that form them. Creating additional build types or
> product flavors also creates additional build variants.
