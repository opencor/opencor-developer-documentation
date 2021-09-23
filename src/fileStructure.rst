.. _fileStructure:

================
 File structure
================

Files are organised as follows:

::

  build                         // Where OpenCOR is built
  cmake                         // Files used to build OpenCOR
  distrib                       // Files used to package OpenCOR
   ├─ linux                     // Linux-specific
   ├─ macos                     // macOS-specific
   └─ windows                   // Windows-specific
  doc                           // Documentation
   ├─ 3rdparty                  // Third-party libraries used for the documentation
   │   └─ jQuery                // jQuery
   ├─ cor                       // COR
   ├─ downloads                 // Where the different releases of OpenCOR are stored
   └─ res                       // Resource files used by the documentation
  ext                           // Where external packages are cloned
  i18n                          // Internationalisation files
  models                        // Some sample CellML files
   └─ tests                     // Some test files
       ├─ cellml                // Some test CellML files
       ├─ combine               // Some test COMBINE archives
       ├─ jupyter               // Some test Jupyter notebooks
       └─ sedml                 // Some test SED-ML files
  res                           // Resource files
   ├─ flags                     // Images from the Printable world flags library
   ├─ oxygen                    // Images from the Oxygen library
   └─ translations              // Qt translation files
  scripts                       // Files used to build/package OpenCOR
  src                           // Source code files
   ├─ 3rdparty                  // Third-party libraries statically linked to OpenCOR
   │   ├─ diff_match_patch      // diff-match-patch
   │   ├─ linux                 // Linux-specific
   │   │   ├─ icu               // ICU
   │   │   └─ mesa              // Mesa
   │   ├─ QtSingleApplication   // QtSingleApplication
   │   └─ QtWebKit              // QtWebKit
   ├─ misc                      // Files that do not fit anywhere else
   ├─ plugins                   // Plugins
   │   ├─ dataStore             // Plugins to store and manipulate data
   │   ├─ editing               // Plugins to edit files
   │   ├─ miscellaneous         // Plugins for various things
   │   ├─ organisation          // Plugins to organise files
   │   ├─ sample                // Sample plugins
   │   ├─ simulation            // Plugins to simulate files
   │   ├─ solver                // Plugins to access various solvers
   │   ├─ support               // Plugins to support various third-party libraries
   │   ├─ test                  // Test plugins
   │   ├─ thirdParty            // Plugins to access various third-party libraries
   │   │   ├─ CellMLAPI         // The CellML API as a plugin
   │   │   ├─ libBioSignalML    // libBioSignalML as a plugin
   │   │   ├─ libgit2           // libgit2 as a plugin
   │   │   ├─ libNuML           // libNuML as a plugin
   │   │   ├─ libSBML           // libSBML as a plugin
   │   │   ├─ libSEDML          // libSEDML as a plugin
   │   │   ├─ LibXDiff          // LibXDiff as a plugin
   │   │   ├─ LLVMClang         // LLVM+Clang as a plugin
   │   │   ├─ OAuth             // OAuth 2.0 for Qt as a plugin
   │   │   ├─ OpenSSL           // OpenSSL as a plugin
   │   │   ├─ Python            // Python as a plugin
   │   │   ├─ PythonPackages    // Some Python packages as a plugin
   │   │   ├─ PythonQt          // PythonQt as a plugin
   │   │   ├─ QScintilla        // QScintilla as a plugin
   │   │   ├─ Qwt               // Qwt as a plugin
   │   │   ├─ SUNDIALS          // Part of SUNDIALS as a plugin
   │   │   ├─ Zinc              // Zinc as a plugin
   │   │   └─ zlib              // zlib as a plugin
   │   ├─ tools                 // Plugins to access various tools
   │   └─ widget                // Plugins to access various ad hoc widgets
   ├─ tests                     // The main program for the tests
   │   ├─ res                   // Resource files
   │   └─ src                   // Source code files
   └─ windows                   // Windows CLI version of OpenCOR
