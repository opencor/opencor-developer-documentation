.. _prerequisites:

===============
 Prerequisites
===============

The following tools are required in order to develop, build , test, run and package OpenCOR:

- `Git <https://git-scm.com/>`__: a distributed version control system;
- `CMake <https://www.cmake.org/>`__ 3.11 or later: a cross-platform build system;
- `Ninja <https://ninja-build.org/>`__ 1.8.2 or later (optional): a small build system with a focus on speed;
- `clcache <https://github.com/frerich/clcache>`__ (optional and Windows only): a compiler cache;
- `ccache <https://ccache.samba.org/>`__ (optional and Linux/macOS only): a compiler cache;
- C++ toolchain: a set of C++ tools.
  The toolchain is different depending on the platform you are using:

  - **Windows:** `Visual Studio Community 2015 with Update 3 <https://www.visualstudio.com/downloads/download-visual-studio-vs>`__ (including the `Debugging Tools for Windows <https://developer.microsoft.com/windows/downloads/windows-10-sdk>`__);
  - **Linux:** GCC/G++ 5.x or later and OpenGL (``g++-5``/``g++`` and ``mesa-common-dev`` packages, respectively) on Ubuntu 16.04/18.04 LTS, as well as GStreamer (``libgstreamer-plugins-base0.10-0`` package) on Ubuntu 16.04 LTS; and
  - **macOS:** `Xcode <https://developer.apple.com/xcode/>`__ 10.1 (including its `Command Line Tools <https://developer.apple.com/downloads/?q=Command%20Line%20Tools>`__).

- `Qt <https://www.qt.io/>`__ 5.9.7 LTS: a cross-platform application and UI framework (`Qt Creator <https://www.qt.io/qt-features-libraries-apis-tools-and-ide/#ide>`__ is its supporting IDE):

  - |Windows|_;
  - |Linux|_; and
  - |macOS|_.

  .. |Windows| replace:: **Windows**
  .. _Windows: https://download.qt.io/official_releases/online_installers/qt-unified-windows-x86-online.exe

  .. |Linux| replace:: **Linux**
  .. _Linux: https://download.qt.io/official_releases/online_installers/qt-unified-linux-x64-online.run

  .. |macOS| replace:: **macOS**
  .. _macOS: https://download.qt.io/official_releases/online_installers/qt-unified-mac-x64-online.dmg

- `NSIS <http://nsis.sourceforge.net/>`__ 3.03 (optional and Windows only): a program for creating Windows installers.
- `PackageMaker <https://developer.apple.com/downloads/?q=Auxiliary%20tools%20for%20Xcode%20-%20Late%20July%202012>`__ (optional and macOS only): a program for creating macOS installers.

Finally, you will need to update your ``PATH`` environment variable by adding Qt to it:

- **Windows:** ``C:\Qt\5.9.7\msvc2015_64\bin``;
- **Linux:** ``/opt/Qt/5.9.7/gcc_64/bin``; and
- **macOS:** ``/Applications/Qt/5.9.7/clang_64/bin``.
