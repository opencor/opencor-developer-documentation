.. _thirdPartyLibraries:

=======================
 Third-party libraries
=======================

OpenCOR uses various APIs, as well as software- and image-based third-party libraries, all of which are listed below, together with the type of license(s) under which they are released, if any.

APIs
----

- libBioSignalML: a library for reading and writing BioSignalML documents.

  - Location: |BioSignalMLAPI|_.
  - Licensing: none.

.. |BioSignalMLAPI| replace:: ``[OpenCOR]/src/plugins/api/BioSignalMLAPI``
.. _BioSignalMLAPI: https://github.com/opencor/opencor/tree/master/src/plugins/api/BioSignalMLAPI

- `CellML API <https://github.com/cellmlapi/cellml-api/>`_ (from `opencor/cellml-api <https://github.com/opencor/cellml-api>`_ on GitHub): an interface to manipulate and process `CellML <https://www.cellml.org/>`_ documents.

  - Location: |CellMLAPI|_.
  - Licensing: `MPL v1.1 <https://opensource.org/licenses/MPL-1.1>`_, `GPL v2.0 <https://opensource.org/licenses/GPL-2.0>`_ (or later) and `LGPL v2.1 <https://opensource.org/licenses/LGPL-2.1>`_ (or later).

.. |CellMLAPI| replace:: ``[OpenCOR]/src/plugins/api/CellMLAPI``
.. _CellMLAPI: https://github.com/opencor/opencor/tree/master/src/plugins/api/CellMLAPI

- `libNuML <https://github.com/NuML/NuML/>`_ 1.1.1: a library for reading and writing `NuML <https://github.com/NuML/NuML/>`_ models.

  - Location: |NuMLAPI|_.
  - Licensing: `LGPL v2.1 <https://opensource.org/licenses/LGPL-2.1>`_ (or later).

.. |NuMLAPI| replace:: ``[OpenCOR]/src/plugins/api/NuMLAPI``
.. _NuMLAPI: https://github.com/opencor/opencor/tree/master/src/plugins/api/NuMLAPI

- `libSBML <http://sbml.org/Software/libSBML/>`_ 5.16.0: a programming library to help you read, write, manipulate, translate and validate `SBML <http://www.sbml.org/>`_ files and data streams.

  - Location: |SBMLAPI|_.
  - Licensing: `LGPL v2.1 <https://opensource.org/licenses/LGPL-2.1>`_ (or later).

.. |SBMLAPI| replace:: ``[OpenCOR]/src/plugins/api/SBMLAPI``
.. _SBMLAPI: https://github.com/opencor/opencor/tree/master/src/plugins/api/SBMLAPI

- `libSEDML <https://github.com/fbergmann/libSEDML/>`_ 0.4.3: a library for reading and writing `SED-ML <http://www.sed-ml.org/>`_ models.

  - Location: |SEDMLAPI|_.
  - Licensing: `BSD 2-Clause <https://opensource.org/licenses/BSD-2-Clause>`_.

.. |SEDMLAPI| replace:: ``[OpenCOR]/src/plugins/api/CellMLAPI``
.. _SEDMLAPI: https://github.com/opencor/opencor/tree/master/src/plugins/api/SEDMLAPI

Software
--------

- `diff-match-patch <https://code.google.com/p/google-diff-match-patch/>`_: a set of libraries that offer robust algorithms to perform the operations required for synchronising plain text.

  - Location: |diff-match-patchSoftware|_.
  - Licensing: `Apache v2.0 <https://opensource.org/licenses/Apache-2.0>`_.
      **Note:** we use an STL version of that library.

.. |diff-match-patchSoftware| replace:: ``[OpenCOR]/src/3rdparty/diff_match_patch``
.. _diff-match-patchSoftware: https://github.com/opencor/opencor/tree/master/src/3rdparty/diff_match_patch

- `jQuery <https://jquery.com/>`_ 3.3.1: a fast and concise `JavaScript <https://en.wikipedia.org/wiki/JavaScript>`_ library that simplifies `HTML <https://www.w3.org/html/>`_ document traversing, event handling, animating, and `Ajax <https://en.wikipedia.org/wiki/Ajax_(programming)>`_ interactions for rapid web development.

  - Location: |jQuerySoftware|_.
  - Licensing: `MIT <https://opensource.org/licenses/MIT>`_.

.. |jQuerySoftware| replace:: ``[OpenCOR]/doc/3rdparty/jQuery``
.. _jQuerySoftware: https://github.com/opencor/opencor/tree/master/doc/3rdparty/jQuery

- `libgit2 <https://libgit2.github.com/>`_ 0.26.0: a portable, pure C implementation of the `Git <https://git-scm.com/>`_ core methods provided as a re-entrant linkable library with a solid API.

  - Location: |libgit2Software|_.
  - Licensing: `GPL v2.0 <https://opensource.org/licenses/GPL-2.0>`_ with linking exception.

.. |libgit2Software| replace:: ``[OpenCOR]/src/plugins/thirdParty/libgit2``
.. _libgit2Software: https://github.com/opencor/opencor/tree/master/src/plugins/thirdParty/libgit2

- `LibXDiff <http://www.xmailserver.org/xdiff-lib.html>`_ 0.23: a library that implements basic and yet complete functionalities to create file differences/patches to both binary and text files.

  - Location: |LibXDiffSoftware|_.
  - Licensing: `LGPL v2.1 <https://opensource.org/licenses/LGPL-2.1>`_.

.. |LibXDiffSoftware| replace:: ``[OpenCOR]/src/plugins/thirdParty/LibXDiff``
.. _LibXDiffSoftware: https://github.com/opencor/opencor/tree/master/src/plugins/thirdParty/LibXDiff

- `LLVM <http://www.llvm.org/>`_\ +\ `Clang <http://clang.llvm.org/>`_ 5.0.1 a collection of modular and reusable compiler and toolchain technologies.

  - Location: |LLVM+ClangSoftware|_.
  - Licensing: `UoI/NCSA <https://opensource.org/licenses/UoI-NCSA>`_.

.. |LLVM+ClangSoftware| replace:: ``[OpenCOR]/src/plugins/thirdParty/LLVMClang``
.. _LLVM+ClangSoftware: https://github.com/opencor/opencor/tree/master/src/plugins/thirdParty/LLVMClang

- `OAuth 2.0 for Qt <https://github.com/pipacs/o2>`_ 1.0.1: a library that encapsulates the `OAuth <https://oauth.net/>`_ 1.0 and 2.0 client authentication flows, and the sending of authenticated `HTTP <https://www.w3.org/Protocols/>`_ requests.

  - Location: |OAuthSoftware|_.
  - Licensing: `BSD 2-Clause <https://opensource.org/licenses/BSD-2-Clause>`_.

.. |OAuthSoftware| replace:: ``[OpenCOR]/src/plugins/thirdParty/OAuth``
.. _OAuthSoftware: https://github.com/opencor/opencor/tree/master/src/plugins/thirdParty/OAuth

- `OpenSSL <https://www.openssl.org/>`_ 1.0.2n: a toolkit implementing the Secure Sockets Layer (SSL v2/v3) and Transport Layer Security (TLS) protocols, as well as a full-strength general purpose cryptography library.

  - Location: |OpenSSLSoftware|_.
  - Licensing: OpenSSL and SSLeay, which are both `BSD <https://opensource.org/licenses/BSD-3-Clause>`_-style licenses (more information `here <https://www.openssl.org/source/license.html>`_).

.. |OpenSSLSoftware| replace:: ``[OpenCOR]/src/plugins/thirdParty/OpenSSL``
.. _OpenSSLSoftware: https://github.com/opencor/opencor/tree/master/src/plugins/thirdParty/OpenSSL

- `QScintilla <https://riverbankcomputing.com/software/qscintilla/intro>`_ 2.10.2: a `Qt <https://www.qt.io/>`_ port of the `Scintilla <http://www.scintilla.org/>`_ editing component.

  - Location: |QScintillaSoftware|_.
  - Licensing: `GPL v3.0 <https://opensource.org/licenses/GPL-3.0>`_.

.. |QScintillaSoftware| replace:: ``[OpenCOR]/src/plugins/thirdParty/QScintilla``
.. _QScintillaSoftware: https://github.com/opencor/opencor/tree/master/src/plugins/thirdParty/QScintilla

- `QtSingleApplication <https://code.qt.io/cgit/qt-solutions/qt-solutions.git/tree/qtsingleapplication>`_: a class that ensures that only one instance of the `GUI <https://en.wikipedia.org/wiki/Graphical_user_interface>`_ version of OpenCOR can be run at any given time.

  - Location: |QtSingleApplicationSoftware|_.
  - Licensing: `LGPL v2.1 <https://opensource.org/licenses/LGPL-2.1>`_ (or later).

.. |QtSingleApplicationSoftware| replace:: ``[OpenCOR]/src/3rdparty/QtSingleApplication``
.. _QtSingleApplicationSoftware: https://github.com/opencor/opencor/tree/master/src/3rdparty/QtSingleApplication

- `QtWebKit <http://code.qt.io/cgit/qt/qtwebkit.git/tree/>`_: a `Qt <https://www.qt.io/>`_ port of `WebKit <https://webkit.org/>`_, a web browser engine.

  - Location: |QtWebKitSoftware|_.
  - Licensing: `LGPL v2.1 <https://opensource.org/licenses/LGPL-2.1>`_.
      **Note:** we use the `Reloaded <https://github.com/annulen/webkit/wiki>`_ version of that library.

.. |QtWebKitSoftware| replace:: ``[OpenCOR]/src/3rdparty/QtWebKit``
.. _QtWebKitSoftware: https://github.com/opencor/opencor/tree/master/src/3rdparty/QtWebKit

- `Qwt <http://qwt.sourceforge.net/>`_ 6.1.3: a set of widgets and utility classes primarily aimed at programs with a technical background.

  - Location: |QwtSoftware|_.
  - Licensing: `Qwt License v1.0 <http://qwt.sourceforge.net/qwtlicense.html>`_ (a slightly less restricive version of `LGPL v2.1 <https://opensource.org/licenses/LGPL-2.1>`_) and `LGPL v2.1 <https://opensource.org/licenses/LGPL-2.1>`_ for the `MathML <https://www.w3.org/Math/>`_ text engine, which is based on the QtMmlWidget code.
      **Note:** we have contributed some code to the `MathML <https://www.w3.org/Math/>`_ renderer, but it has yet to be fully incorporated in the `Qwt <http://qwt.sourceforge.net/>`_ project.
      So, in the meantime, we use our version of the `MathML <https://www.w3.org/Math/>`_ renderer.

.. |QwtSoftware| replace:: ``[OpenCOR]/src/plugins/thirdParty/Qwt``
.. _QwtSoftware: https://github.com/opencor/opencor/tree/master/src/plugins/thirdParty/Qwt

- `SUNDIALS <http://computation.llnl.gov/projects/sundials>`_ 3.1.0: a SUite of Non-linear and DIfferential/ALgebraic equation Solvers.

  - Location: |SUNDIALSSoftware|_.
  - Licensing: `BSD 3-Clause <https://opensource.org/licenses/BSD-3-Clause>`_.

.. |SUNDIALSSoftware| replace:: ``[OpenCOR]/src/plugins/thirdParty/SUNDIALS``
.. _SUNDIALSSoftware: https://github.com/opencor/opencor/tree/master/src/plugins/thirdParty/SUNDIALS

- `web-xslt <https://github.com/davidcarlisle/web-xslt>`_: `XSLT <https://www.w3.org/TR/xslt>`_ and `JavaScript <https://en.wikipedia.org/wiki/JavaScript>`_ code intended mostly for manipulating `MathML <https://www.w3.org/Math/>`_ and `OpenMath <https://www.openmath.org/>`_.

  - Location: |web-xsltSoftware|_.
  - Licensing: `W3C <https://opensource.org/licenses/W3C>`_, `Apache v2.0 <https://opensource.org/licenses/Apache-2.0>`_, `MIT <https://opensource.org/licenses/MIT>`_, `MPL v1.1 <https://opensource.org/licenses/MPL-1.1>`_ or `MPL v2.0 <https://opensource.org/licenses/MPL-2.0>`_.
      **Note:** we currently use only (a slightly improved version of) |ctopff.xsl|_ to convert `Content MathML <https://www.w3.org/TR/MathML3/chapter4.html>`_ to `Presentation MathML <https://www.w3.org/TR/MathML2/chapter3.html>`_.

.. |web-xsltSoftware| replace:: ``[OpenCOR]/src/plugins/miscellaneous/Core/res/web-xslt``
.. _web-xsltSoftware: https://github.com/opencor/opencor/tree/master/src/plugins/miscellaneous/Core/res/web-xslt

.. |ctopff.xsl| replace:: ``ctopff.xsl``
.. _ctopff.xsl: https://github.com/davidcarlisle/web-xslt/blob/master/ctop/ctopff.xsl

- `Zinc <https://github.com/OpenCMISS/zinc>`_ 3.1.2: a library for creating software to interact with and visualise complex finite element models and image-based fields.

  - Location: |ZincSoftware|_.
  - Licensing: `MPL v2.0 <https://opensource.org/licenses/MPL-2.0>`_.

.. |ZincSoftware| replace:: ``[OpenCOR]/src/plugins/thirdParty/Zinc``
.. _ZincSoftware: https://github.com/opencor/opencor/tree/master/src/plugins/thirdParty/Zinc

- `zlib <http://www.zlib.net/>`_ 1.2.11: a massively spiffy yet delicately unobtrusive compression library.

  - Location: |zlibSoftware|_.
  - Licensing: `Zlib <https://opensource.org/licenses/Zlib>`__.

.. |zlibSoftware| replace:: ``[OpenCOR]/src/plugins/thirdParty/zlib``
.. _zlibSoftware: https://github.com/opencor/opencor/tree/master/src/plugins/thirdParty/zlib

Images
------

- `Oxygen <https://packages.ubuntu.com/bionic/oxygen-icon-theme>`_ 5.43.0: icons used in various parts of OpenCOR.

  - Location: |OxygenImages|_.
  - Licensing: `LGPL v3.0 <https://opensource.org/licenses/LGPL-3.0>`_.

.. |OxygenImages| replace:: ``[OpenCOR]/res/oxygen``
.. _OxygenImages: https://github.com/opencor/opencor/tree/master/res/oxygen

- `Printable world flags <https://www.printableworldflags.com/flag-icon/>`_: flag icons used in our Language menu.

  - Location: |FlagsImages|_.
  - Licensing: none.

.. |FlagsImages| replace:: ``[OpenCOR]/res/flags``
.. _FlagsImages: https://github.com/opencor/opencor/tree/master/res/flags

- `Qt Creator <https://code.qt.io/cgit/qt-creator/qt-creator.git/tree/>`_: icons used in our `Editor <https://github.com/opencor/opencor/tree/master/src/plugins/widget/EditorWidget>`_ widget.

  - Location: |QtCreatorImages|_.
  - Licensing: `GPL v3.0 <https://opensource.org/licenses/GPL-3.0>`_.

.. |QtCreatorImages| replace:: ``[OpenCOR]/src/plugins/widget/EditorWidget/res/qtCreator``
.. _QtCreatorImages: https://github.com/opencor/opencor/tree/master/src/plugins/widget/EditorWidget/res/qtCreator
