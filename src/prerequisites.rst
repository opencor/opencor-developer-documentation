.. _prerequisites:

===============
 Prerequisites
===============

The following tools are required to develop, build , test, run, and package OpenCOR:

- `Git <https://git-scm.com/>`__: a distributed version control system;
- `CMake <https://cmake.org/>`__ 3.22 or later: a cross-platform build system;
- C++ toolchain: a set of C++ tools:

  - **Windows:** `Visual Studio Community 2022 <https://apps.microsoft.com/detail/xpdcfjdklzjlp8>`__ (``Desktop development with C++`` with ``MSVC v143 - VS 2022 C++ x64/x86 build tools`` and ``Windows 11 SDK (10.0.22621.0)``);
  - **Linux:** G++ and OpenGL (``g++``, ``libffi7``, ``libgl1-mesa-dev``, and ``libtinfo5`` packages, respectively) on Ubuntu 22.04 LTS; and
  - **macOS:** `Xcode <https://developer.apple.com/xcode/>`__ 16 (including its `Command Line Tools <https://developer.apple.com/downloads/?q=Command%20Line%20Tools>`__).

- `Qt <https://qt.io/>`__ 5.12 LTS: a cross-platform application and UI framework (`Qt Creator <https://qt.io/product/development-tools>`__ is its supporting IDE):

  - |Windows|_;
  - |Linux|_; and
  - |macOS|_.

  .. |Windows| replace:: **Windows**
  .. _Windows: https://download.qt.io/official_releases/online_installers/qt-online-installer-windows-x64-online.exe

  .. |Linux| replace:: **Linux**
  .. _Linux: https://download.qt.io/official_releases/online_installers/qt-online-installer-linux-x64-online.run

  .. |macOS| replace:: **macOS**
  .. _macOS: https://download.qt.io/official_releases/online_installers/qt-online-installer-mac-x64-online.dmg

Additionally, you may also want to rely on the following optional tools:

- `Ninja <https://ninja-build.org/>`__ 1.8.2 or later: a small build system with a focus on speed;
- `buildcache <https://gitlab.com/bits-n-bites/buildcache>`__: a compiler cache;
- `clcache <https://github.com/frerich/clcache>`__ (Windows only): a compiler cache;
- `ccache <https://ccache.dev/>`__ (Linux/macOS only): a compiler cache;
- `ClangFormat <https://clang.llvm.org/docs/ClangFormat.html>`__: a tool to format C/C++ code; and
- `Clang-Tidy <https://clang.llvm.org/extra/clang-tidy/>`__: a `Clang <https://clang.llvm.org/>`__-based C++ linter tool;
- `NSIS <https://nsis.sourceforge.io/>`__ 3.0 or later (Windows only): a program to create Windows installers.

**Note:** the `HelpWindow plugin <https://opencor.ws/user/plugins/miscellaneous/helpWindow.html>`__ only gets built if `Python <https://www.python.org/>`__ 3.12 is installed on your system, as well as the `Sphinx <https://pypi.org/project/Sphinx/>`__, `sphinx-copybutton <https://pypi.org/project/sphinx-copybutton/>`__, and `sphinx-inline-tabs <https://pypi.org/project/sphinx-inline-tabs/>`__ packages.
