.. _fileStructure:

================
 File structure
================

Files are organised as follows:

::

    build                         // Where OpenCOR is built
    cmake                         // Files used to build OpenCOR
    distrib                       // Files used to package OpenCOR
    doc                           // User and developer documentations
     ├─ 3rdparty                  // Third-party libraries used for the documentation
     │   ├─ googleCodePrettify    // Google Code Prettify
     │   ├─ jQuery                // jQuery
     │   └─ KaTeX                 // KaTeX
     ├─ cor                       // COR
     ├─ developer                 // The developer documentation
     ├─ downloads                 // Where the different releases of OpenCOR are stored
     ├─ res                       // Resource files used by the documentation
     └─ user                      // The user documentation
    ext                           // Where external packages are cloned
    formats                       // Some sample formats for CellML export
    i18n                          // Internationalisation files
    models                        // Some sample CellML files
    res                           // Resource files
     ├─ flags                     // Images from the Printable world flags library
     ├─ oxygen                    // Images from the Oxygen library
     └─ translations              // Qt translation files
    scripts                       // Files used to build/package OpenCOR
    src                           // Source code files
     ├─ 3rdparty                  // Third-party libraries statically linked to OpenCOR
     │   ├─ diff_match_patch      // diff-match-patch
     │   ├─ QtSingleApplication   // QtSingleApplication
     │   └─ QtWebKit              // QtWebKit
     ├─ misc                      // Files that do not fit anywhere else
     ├─ plugins                   // Plugins supported by OpenCOR
     │   ├─ api                   // Plugins to access various APIs
     │   │   ├─ BioSignalMLAPI    // The BioSignalML API as a plugin
     │   │   ├─ CellMLAPI         // The CellML API as a plugin
     │   │   ├─ NuMLAPI           // libNuML as a plugin
     │   │   ├─ SBMLAPI           // libSBML as a plugin
     │   │   └─ SEDMLAPI          // libSEDML as a plugin
     │   ├─ dataStore             // Plugins to store and manipulate data
     │   ├─ editing               // Plugins to edit files
     │   ├─ miscellaneous         // Plugins for various things
     │   ├─ organisation          // Plugins to organise files
     │   ├─ sample                // Sample plugins
     │   ├─ simulation            // Plugins to simulate files
     │   ├─ solver                // Plugins to access various solvers
     │   ├─ support               // Plugins to support various third-party libraries and APIs
     │   ├─ test                  // Test plugins
     │   ├─ thirdParty            // Plugins to access various third-party libraries
     │   │   ├─ libgit2           // libgit2 as a plugin
     │   │   ├─ LibXDiff          // LibXDiff as a plugin
     │   │   ├─ LLVMClang         // LLVM+Clang as a plugin
     │   │   ├─ OAuth             // OAuth 2.0 for Qt as a plugin
     │   │   ├─ OpenSSL           // OpenSSL as a plugin
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
