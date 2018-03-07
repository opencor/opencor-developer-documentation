.. _prerequisites:

===============
 Prerequisites
===============

The following tools are required in order to develop, build , test, run and package OpenCOR:

- `Git <https://git-scm.com/>`__: a distributed version control system;
- `CMake <https://www.cmake.org/>`__ 3.3 or later: a cross-platform build system;
- `Ninja <https://ninja-build.org/>`__ (optional): a small build system with a focus on speed;
- `clcache <https://github.com/frerich/clcache>`__ (optional and Windows only): a compiler cache;
- `ccache <https://ccache.samba.org/>`__ (optional and Linux/macOS only): a compiler cache;
- C++ toolchain: a set of C++ tools.
  The toolchain is different depending on the platform you are using:

  - **Windows:** `Visual Studio Community 2015 with Update 3 <https://www.visualstudio.com/downloads/download-visual-studio-vs>`__;
  - **Linux:** GCC/G++ 5.x (``g++-5`` package), as well as OpenGL and GStreamer (``mesa-common-dev`` and ``libgstreamer-plugins-base0.10-0`` packages, respectively) on Ubuntu; and
  - **macOS:** `Xcode <https://developer.apple.com/xcode/>`__ 9.2 (including its `command line tools <https://developer.apple.com/downloads/?q=Command%20Line%20Tools>`__).

- `Qt <https://www.qt.io/>`__ 5.9.4 LTS: a cross-platform application and UI framework (`Qt Creator <https://www.qt.io/ide/>`__ is its supporting IDE):

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

Finally, you will need to update your ``PATH`` environment variable by adding the following path(s):

- **Windows:** ``C:\Program Files\Git\bin``, ``C:\Program Files\CMake\bin``, ``C:\Qt\5.9.4\msvc2015_64\bin`` and ``C:\Qt\Tools\QtCreator\bin``;
- **Linux:** ``/opt/Qt/5.9.4/gcc_64/bin`` in ``/etc/environment`` on Ubuntu; and
- **macOS:** ``/Applications/Qt/5.9.4/clang_64/bin`` in ``/etc/profile``.
