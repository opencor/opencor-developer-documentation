.. _prerequisites:

===============
 Prerequisites
===============

The following tools are required to develop, build , test, run and package OpenCOR:

- `Git <https://git-scm.com/>`__: a distributed version control system;
- `CMake <https://cmake.org/>`__ 3.14 or later: a cross-platform build system;
- C++ toolchain: a set of C++ tools.
  The toolchain is different depending on the platform you are using:

  - **Windows:** `Visual Studio Community 2019 <https://visualstudio.com/downloads/download-visual-studio-vs>`__ ( ``Desktop development with C++`` with ``MSVC v142 - VS 2019 C++ x64/x86 build tools`` and ``Windows 10 SDK (10.0.19041.0)``);
  - **Linux:** G++ and OpenGL (``g++``, ``libgl1-mesa-dev`` and ``libtinfo5`` packages, respectively) on Ubuntu 20.04 LTS; and
  - **macOS:** `Xcode <https://developer.apple.com/xcode/>`__ 13 (including its `Command Line Tools <https://developer.apple.com/downloads/?q=Command%20Line%20Tools>`__).

- `Qt <https://qt.io/>`__ 5.12 LTS: a cross-platform application and UI framework (`Qt Creator <https://qt.io/qt-features-libraries-apis-tools-and-ide/#ide>`__ is its supporting IDE):

  - |Windows|_;
  - |Linux|_; and
  - |macOS|_.

  .. |Windows| replace:: **Windows**
  .. _Windows: https://download.qt.io/official_releases/online_installers/qt-unified-windows-x86-online.exe

  .. |Linux| replace:: **Linux**
  .. _Linux: https://download.qt.io/official_releases/online_installers/qt-unified-linux-x64-online.run

  .. |macOS| replace:: **macOS**
  .. _macOS: https://download.qt.io/official_releases/online_installers/qt-unified-mac-x64-online.dmg

Additionally, you may also want to rely on the following optional tools:

- `Ninja <https://ninja-build.org/>`__ 1.8.2 or later: a small build system with a focus on speed;
- `buildcache <https://github.com/mbitsnbites/buildcache>`__: a compiler cache;
- `clcache <https://github.com/frerich/clcache>`__ (Windows only): a compiler cache;
- `ccache <https://ccache.dev/>`__ (Linux/macOS only): a compiler cache;
- `Clang-Tidy <https://clang.llvm.org/extra/clang-tidy/>`__: a `Clang <https://clang.llvm.org/>`__-based C++ linter tool;
- `ClangFormat <https://clang.llvm.org/docs/ClangFormat.html>`__: a tool to format C/C++ code; and
- `NSIS <https://nsis.sourceforge.io/>`__ 3.0 or later (Windows only): a program to create Windows installers.
