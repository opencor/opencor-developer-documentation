.. _thirdPartyLibraries:

=======================
 Third-party libraries
=======================

OpenCOR uses various third-party libraries, all of which are listed below, together with the type of license(s) under which they are released, if any.

- `CellML API <https://github.com/cellmlapi/cellml-api/>`__: an interface to manipulate and process `CellML <https://cellml.org/>`__ documents.

  - Location: |CellMLAPI|_.
  - Licensing: `MPL v1.1 <https://opensource.org/licenses/MPL-1.1>`__, `GPL v2.0 <https://opensource.org/licenses/GPL-2.0>`__ (or later) and `LGPL v2.1 <https://opensource.org/licenses/LGPL-2.1>`__ (or later).

  .. |CellMLAPI| replace:: ``[OpenCOR]/src/plugins/thirdParty/CellMLAPI``
  .. _CellMLAPI: https://github.com/opencor/opencor/tree/master/src/plugins/thirdParty/CellMLAPI

- `diff-match-patch <https://code.google.com/p/google-diff-match-patch/>`__: a set of libraries that offer robust algorithms to perform the operations required for synchronising plain text.

  - Location: |diff-match-patch|_.
  - Licensing: `Apache v2.0 <https://opensource.org/licenses/Apache-2.0>`__.

    **Note:** we use an `STL version <https://github.com/leutloff/diff-match-patch-cpp-stl>`__ of that library.

  .. |diff-match-patch| replace:: ``[OpenCOR]/src/3rdparty/diff_match_patch``
  .. _diff-match-patch: https://github.com/opencor/opencor/tree/master/src/3rdparty/diff_match_patch

- `ICU <http://site.icu-project.org/>`__ 56.1: a library that provides `Unicode <https://en.wikipedia.org/wiki/Unicode>`__ and Globalization support for software applications.

  - Location: |ICU|_.
  - Licensing: `Unicode <https://unicode.org/copyright.html#License>`__.

  .. |ICU| replace:: ``[OpenCOR]/distrib/linux/icu``
  .. _ICU: https://github.com/opencor/opencor/tree/master/distrib/linux/icu

- `ipykernel <https://pypi.org/project/ipykernel>`__ 5.1.2: the `IPython <https://ipython.org/>`__ kernel for `Jupyter <https://jupyter.org/>`__.

  - Location: |PythonPackages|_.
  - Licensing: `BSD 2-Clause <https://opensource.org/licenses/BSD-2-Clause>`__.

  .. |PythonPackages| replace:: ``[OpenCOR]/src/plugins/thirdParty/PythonPackages``
  .. _PythonPackages: https://github.com/opencor/opencor/tree/master/src/plugins/thirdParty/PythonPackages

- `IPython <https://ipython.org/>`__ 7.8.0: a command shell that provides a rich architecture for interactive computing.

  - Location: |PythonPackages|_.
  - Licensing: `BSD 2-Clause <https://opensource.org/licenses/BSD-2-Clause>`__.

- `ipywidgets <https://pypi.org/project/ipywidgets>`__ 7.5.1: interactive `HTML <https://html.spec.whatwg.org/multipage>`__ widgets for `Jupyter <https://jupyter.org/>`__ notebooks and the `IPython kernel <https://pypi.org/project/ipykernel>`__.

  - Location: |PythonPackages|_.
  - Licensing: `BSD 2-Clause <https://opensource.org/licenses/BSD-2-Clause>`__.

- `jQuery <https://jquery.com/>`__ 3.6.0: a fast and concise `JavaScript <https://en.wikipedia.org/wiki/JavaScript>`__ library that simplifies `HTML <https://html.spec.whatwg.org/multipage>`__ document traversing, event handling, animating, and `Ajax <https://en.wikipedia.org/wiki/Ajax_(programming)>`__ interactions for rapid web development.

  - Location: |jQuery|_.
  - Licensing: `MIT <https://opensource.org/licenses/MIT>`__.

  .. |jQuery| replace:: ``[OpenCOR]/doc/3rdparty/jQuery``
  .. _jQuery: https://github.com/opencor/opencor/tree/master/doc/3rdparty/jQuery

- `jupyter_console <https://pypi.org/project/jupyter_console>`__ 6.0.0: an `IPython <https://ipython.org/>`__-like terminal frontend for `Jupyter <https://jupyter.org/>`__ kernels in any language.

  - Location: |PythonPackages|_.
  - Licensing: `BSD 2-Clause <https://opensource.org/licenses/BSD-2-Clause>`__.

- `JupyterLab <https://pypi.org/project/jupyterlab>`__ 1.1.3: an extensible environment for interactive and reproducible computing, based on the `Jupyter <https://jupyter.org/>`__ Notebook and Architecture.

  - Location: |PythonPackages|_.
  - Licensing: `BSD 2-Clause <https://opensource.org/licenses/BSD-2-Clause>`__.

- `KaTeX <https://katex.org/>`__ 0.13.11: the fastest math typesetting library for the Web.

  - Location: |KaTeX|_.
  - Licensing: `MIT <https://opensource.org/licenses/MIT>`__.

  .. |KaTeX| replace:: ``[SphinxTheme]/static/katex``
  .. _KaTeX: https://github.com/opencor/sphinx-theme/tree/master/static/katex

- libBioSignalML: a library for reading and writing BioSignalML documents.

  - Location: |libBioSignalML|_.
  - Licensing: none.

  .. |libBioSignalML| replace:: ``[OpenCOR]/src/plugins/thirdParty/libBioSignalML``
  .. _libBioSignalML: https://github.com/opencor/opencor/tree/master/src/plugins/thirdParty/libBioSignalML

- `libgit2 <https://libgit2.github.com/>`__ 1.1.0: a portable, pure C implementation of the `Git <https://git-scm.com/>`__ core methods provided as a re-entrant linkable library with a solid API.

  - Location: |libgit2|_.
  - Licensing: `GPL v2.0 <https://opensource.org/licenses/GPL-2.0>`__ with linking exception.

  .. |libgit2| replace:: ``[OpenCOR]/src/plugins/thirdParty/libgit2``
  .. _libgit2: https://github.com/opencor/opencor/tree/master/src/plugins/thirdParty/libgit2

- `libNuML <https://github.com/NuML/NuML/>`__ 1.1.4: a library for reading and writing `NuML <https://github.com/NuML/NuML/>`__ models.

  - Location: |libNuML|_.
  - Licensing: `LGPL v2.1 <https://opensource.org/licenses/LGPL-2.1>`__ (or later).

  .. |libNuML| replace:: ``[OpenCOR]/src/plugins/thirdParty/libNuML``
  .. _libNuML: https://github.com/opencor/opencor/tree/master/src/plugins/thirdParty/libNuML

- `libSBML <http://sbml.org/Software/libSBML/>`__ 5.19.0: a programming library to help you read, write, manipulate, translate and validate `SBML <http://sbml.org/>`__ files and data streams.

  - Location: |libSBML|_.
  - Licensing: `LGPL v2.1 <https://opensource.org/licenses/LGPL-2.1>`__ (or later).

  .. |libSBML| replace:: ``[OpenCOR]/src/plugins/thirdParty/libSBML``
  .. _libSBML: https://github.com/opencor/opencor/tree/master/src/plugins/thirdParty/libSBML

- `libSEDML <https://github.com/fbergmann/libSEDML/>`__ 0.4.4: a library for reading and writing `SED-ML <https://sed-ml.github.io/>`__ files.

  - Location: |libSEDML|_.
  - Licensing: `BSD 2-Clause <https://opensource.org/licenses/BSD-2-Clause>`__.

  .. |libSEDML| replace:: ``[OpenCOR]/src/plugins/thirdParty/libSEDML``
  .. _libSEDML: https://github.com/opencor/opencor/tree/master/src/plugins/thirdParty/libSEDML

- `LibXDiff <http://xmailserver.org/xdiff-lib.html>`__ 0.23: a library that implements basic and yet complete functionalities to create file differences/patches to both binary and text files.

  - Location: |LibXDiff|_.
  - Licensing: `LGPL v2.1 <https://opensource.org/licenses/LGPL-2.1>`__.

  .. |LibXDiff| replace:: ``[OpenCOR]/src/plugins/thirdParty/LibXDiff``
  .. _LibXDiff: https://github.com/opencor/opencor/tree/master/src/plugins/thirdParty/LibXDiff

- `LLVM <https://llvm.org/>`__\ +\ `Clang <https://clang.llvm.org/>`__ 12.0.0: a collection of modular and reusable compiler and toolchain technologies.

  - Location: |LLVM+Clang|_.
  - Licensing: `Apache v2.0 <https://opensource.org/licenses/Apache-2.0>`__ with LLVM Exceptions.

  .. |LLVM+Clang| replace:: ``[OpenCOR]/src/plugins/thirdParty/LLVMClang``
  .. _LLVM+Clang: https://github.com/opencor/opencor/tree/master/src/plugins/thirdParty/LLVMClang

- `lxml <https://lxml.de/>`__ 4.4.1: a Pythonic binding for the C libraries `libxml2 <http://xmlsoft.org/>`__ and `libxslt <http://xmlsoft.org/XSLT/>`__.

  - Location: |PythonPackages|_.
  - Licensing: `BSD 2-Clause <https://opensource.org/licenses/BSD-2-Clause>`__.

- `Matplotlib <https://matplotlib.org/>`__ 3.1.1: a `Python <https://python.org/>`__ 2D plotting library which produces publication quality figures in a variety of hardcopy formats and interactive environments across platforms.

  - Location: |PythonPackages|_.
  - Licensing: `Matplotlib License <https://matplotlib.org/users/license.html>`__.

- `Mesa <https://mesa3d.org/>`__ 21.0.3: a system for rendering interactive 3D graphics.

  - Location: |Mesa|_.
  - Licensing: `MIT <https://opensource.org/licenses/MIT>`__.

  .. |Mesa| replace:: ``[OpenCOR]/distrib/linux/mesa``
  .. _Mesa: https://github.com/opencor/opencor/tree/master/distrib/linux/mesa

- `nbconvert <https://pypi.org/project/nbconvert>`__ 5.6.0: a tool that converts notebooks to various other formats via `Jinja <https://palletsprojects.com/p/jinja/>`__ templates.

  - Location: |PythonPackages|_.
  - Licensing: `BSD 2-Clause <https://opensource.org/licenses/BSD-2-Clause>`__.

- `notebook <https://pypi.org/project/notebook>`__ 6.0.2: a web application that allows you to create and share documents that contain live code, equations, visualizations, and explanatory text.

  - Location: |PythonPackages|_.
  - Licensing: `BSD 2-Clause <https://opensource.org/licenses/BSD-2-Clause>`__.

- `NumPy <https://numpy.org/>`__ 1.17.2: the fundamental package for scientific computing with `Python <https://python.org/>`__.

  - Location: |PythonPackages|_.
  - Licensing: `BSD 2-Clause <https://opensource.org/licenses/BSD-2-Clause>`__.

- `OAuth 2.0 for Qt <https://github.com/pipacs/o2>`__ 1.0.1: a library that encapsulates the `OAuth <https://oauth.net/>`__ 1.0 and 2.0 client authentication flows, and the sending of authenticated `HTTP <https://w3.org/Protocols>`__ requests.

  - Location: |OAuth|_.
  - Licensing: `BSD 2-Clause <https://opensource.org/licenses/BSD-2-Clause>`__.

  .. |OAuth| replace:: ``[OpenCOR]/src/plugins/thirdParty/OAuth``
  .. _OAuth: https://github.com/opencor/opencor/tree/master/src/plugins/thirdParty/OAuth

- `OpenSSL <https://openssl.org/>`__ 1.1.1k: a toolkit implementing the Secure Sockets Layer (SSL v2/v3) and Transport Layer Security (TLS) protocols, as well as a full-strength general purpose cryptography library.

  - Location: |OpenSSL|_.
  - Licensing: `OpenSSL and SSLeay <https://openssl.org/source/license.html>`__, which are both `BSD <https://opensource.org/licenses/BSD-3-Clause>`__-style licenses.

  .. |OpenSSL| replace:: ``[OpenCOR]/src/plugins/thirdParty/OpenSSL``
  .. _OpenSSL: https://github.com/opencor/opencor/tree/master/src/plugins/thirdParty/OpenSSL

- `Oxygen <https://packages.ubuntu.com/impish/oxygen-icon-theme>`__ 5.83.0: icons used in various parts of OpenCOR.

  - Location: |OxygenImages|_.
  - Licensing: `LGPL v3.0 <https://opensource.org/licenses/LGPL-3.0>`__.

  .. |OxygenImages| replace:: ``[OpenCOR]/res/oxygen``
  .. _OxygenImages: https://github.com/opencor/opencor/tree/master/res/oxygen

- `Printable world flags <https://printableworldflags.com/flag-icon>`__: flag icons used in our Language menu.

  - Location: |PrintableWorldFlagsImages|_.
  - Licensing: none.

  .. |PrintableWorldFlagsImages| replace:: ``[OpenCOR]/res/flags``
  .. _PrintableWorldFlagsImages: https://github.com/opencor/opencor/tree/master/res/flags

- `Python <https://python.org/>`__ 3.7.5: a programming language that lets you work quickly and integrate systems more effectively.

  - Location: |Python|_.
  - Licensing: `PSF v2.0 <https://opensource.org/licenses/Python-2.0>`__.

  .. |Python| replace:: ``[OpenCOR]/src/plugins/thirdParty/Python``
  .. _Python: https://github.com/opencor/opencor/tree/master/src/plugins/thirdParty/Python

- `PythonQt <https://mevislab.github.io/pythonqt>`__ 3.2.2: a dynamic `Python <https://python.org/>`__ binding for the `Qt <https://qt.io/>`__ framework.

  - Location: |PythonQt|_.
  - Licensing: `LGPL v2.1 <https://opensource.org/licenses/LGPL-2.1>`__.

  .. |PythonQt| replace:: ``[OpenCOR]/src/plugins/thirdParty/PythonQt``
  .. _PythonQt: https://github.com/opencor/opencor/tree/master/src/plugins/thirdParty/PythonQt

- `qimage2ndarray <https://pypi.org/project/qimage2ndarray>`__ 1.8: a small `Python <https://python.org/>`__ extension for quickly converting between `QImage <https://doc.qt.io/qt-5/qimage.html>`__ and `numpy.ndarray <https://docs.scipy.org/doc/numpy/reference/generated/numpy.ndarray.html>`__ (in both directions).

  - Location: |PythonPackages|_.
  - Licensing: `BSD 2-Clause <https://opensource.org/licenses/BSD-2-Clause>`__.

- `QScintilla <https://riverbankcomputing.com/software/qscintilla/intro>`__ 2.13.0: a `Qt <https://qt.io/>`__ port of the `Scintilla <https://scintilla.org/>`__ editing component.

  - Location: |QScintilla|_.
  - Licensing: `GPL v3.0 <https://opensource.org/licenses/GPL-3.0>`__.

  .. |QScintilla| replace:: ``[OpenCOR]/src/plugins/thirdParty/QScintilla``
  .. _QScintilla: https://github.com/opencor/opencor/tree/master/src/plugins/thirdParty/QScintilla

- `qtconsole <https://pypi.org/project/qtconsole>`__ 4.5.5: a rich `Qt <https://qt.io/>`__-based console for working with `Jupyter <https://jupyter.org/>`__ kernels, supporting rich media output, session export, and more.

  - Location: |PythonPackages|_.
  - Licensing: `BSD 2-Clause <https://opensource.org/licenses/BSD-2-Clause>`__.

- `QtSingleApplication <https://code.qt.io/cgit/qt-solutions/qt-solutions.git/tree/qtsingleapplication>`__: a class that ensures that only one instance of the `GUI <https://en.wikipedia.org/wiki/Graphical_user_interface>`__ version of OpenCOR can be run at any given time.

  - Location: |QtSingleApplication|_.
  - Licensing: `LGPL v2.1 <https://opensource.org/licenses/LGPL-2.1>`__ (or later).

  .. |QtSingleApplication| replace:: ``[OpenCOR]/src/3rdparty/QtSingleApplication``
  .. _QtSingleApplication: https://github.com/opencor/opencor/tree/master/src/3rdparty/QtSingleApplication

- `QtWebKit <https://github.com/qt/qtwebkit>`__ 5.212.0 Alpha 3: a `Qt <https://qt.io/>`__ port of `WebKit <https://webkit.org/>`__, a web browser engine.

  - Location: |QtWebKit|_.
  - Licensing: `LGPL v2.1 <https://opensource.org/licenses/LGPL-2.1>`__.

  .. |QtWebKit| replace:: ``[OpenCOR]/src/3rdparty/QtWebKit``
  .. _QtWebKit: https://github.com/opencor/opencor/tree/master/src/3rdparty/QtWebKit

- `Qwt <https://qwt.sourceforge.io/>`__ 6.1.6: a set of widgets and utility classes primarily aimed at programs with a technical background.

  - Location: |Qwt|_.
  - Licensing: `Qwt License v1.0 <https://qwt.sourceforge.net/qwtlicense.html>`__ (a slightly less restricive version of `LGPL v2.1 <https://opensource.org/licenses/LGPL-2.1>`__) and `LGPL v2.1 <https://opensource.org/licenses/LGPL-2.1>`__ for the `MathML <https://w3.org/Math>`__ text engine, which is based on the QtMmlWidget code.

    **Note:** we have contributed some code to the `MathML <https://w3.org/Math>`__ renderer, but it has yet to be fully incorporated in the `Qwt <https://qwt.sourceforge.net/>`__ project.
    So, in the meantime, we use `our version <https://github.com/uwerat/qwt-mml-dev>`__ of the `MathML <https://w3.org/Math>`__ renderer.

  .. |Qwt| replace:: ``[OpenCOR]/src/plugins/thirdParty/Qwt``
  .. _Qwt: https://github.com/opencor/opencor/tree/master/src/plugins/thirdParty/Qwt

- `SciPy <https://scipy.org/>`__ 1.3.1: a `Python <https://python.org/>`__-based ecosystem of open-source software for mathematics, science and engineering.

  - Location: |PythonPackages|_.
  - Licensing: `BSD 3-Clause <https://opensource.org/licenses/BSD-3-Clause>`__.

- `Sphinx <https://pypi.org/project/Sphinx>`__ 2.2.0: a tool that makes it easy to create intelligent and beautiful documentation for `Python <https://python.org/>`__ projects (or other documents consisting of multiple `reStructuredText <https://en.wikipedia.org/wiki/ReStructuredText>`__ sources).

  - Location: |PythonPackages|_.
  - Licensing: `BSD 2-Clause <https://opensource.org/licenses/BSD-2-Clause>`__.

- `SUNDIALS <https://computation.llnl.gov/projects/sundials>`__ 5.7.0: a SUite of Non-linear and DIfferential/ALgebraic equation Solvers.

  - Location: |SUNDIALS|_.
  - Licensing: `BSD 3-Clause <https://opensource.org/licenses/BSD-3-Clause>`__.

  .. |SUNDIALS| replace:: ``[OpenCOR]/src/plugins/thirdParty/SUNDIALS``
  .. _SUNDIALS: https://github.com/opencor/opencor/tree/master/src/plugins/thirdParty/SUNDIALS

- `traitlets <https://pypi.org/project/traitlets>`__ 4.3.2: a configuration system for `Python <https://python.org/>`__ applications.

  - Location: |PythonPackages|_.
  - Licensing: `BSD 2-Clause <https://opensource.org/licenses/BSD-2-Clause>`__.

- `web-xslt <https://github.com/davidcarlisle/web-xslt>`__: `XSLT <https://w3.org/TR/xslt>`__ and `JavaScript <https://en.wikipedia.org/wiki/JavaScript>`__ code intended mostly for manipulating `MathML <https://w3.org/Math>`__ and `OpenMath <https://openmath.github.io/>`__.

  - Location: |web-xslt|_.
  - Licensing: `W3C <https://opensource.org/licenses/W3C>`__, `Apache v2.0 <https://opensource.org/licenses/Apache-2.0>`__, `MIT <https://opensource.org/licenses/MIT>`__, `MPL v1.1 <https://opensource.org/licenses/MPL-1.1>`__ or `MPL v2.0 <https://opensource.org/licenses/MPL-2.0>`__.

    **Note:** we only use (a slightly improved version of) |ctopff.xsl|_ to convert `Content MathML <https://w3.org/TR/MathML3/chapter4.html>`__ to `Presentation MathML <https://w3.org/TR/MathML2/chapter3.html>`__.

  .. |web-xslt| replace:: ``[OpenCOR]/src/plugins/miscellaneous/Core/res/web-xslt``
  .. _web-xslt: https://github.com/opencor/opencor/tree/master/src/plugins/miscellaneous/Core/res/web-xslt

  .. |ctopff.xsl| replace:: ``ctopff.xsl``
  .. _ctopff.xsl: https://github.com/davidcarlisle/web-xslt/blob/master/ctop/ctopff.xsl

- `Zinc <https://github.com/OpenCMISS/zinc>`__ 3.1.2: a library for creating software to interact with and visualise complex finite element models and image-based fields.

  - Location: |Zinc|_.
  - Licensing: `MPL v2.0 <https://opensource.org/licenses/MPL-2.0>`__.

  .. |Zinc| replace:: ``[OpenCOR]/src/plugins/thirdParty/Zinc``
  .. _Zinc: https://github.com/opencor/opencor/tree/master/src/plugins/thirdParty/Zinc

- `zlib <https://zlib.net/>`__ 1.2.11: a massively spiffy yet delicately unobtrusive compression library.

  - Location: |zlib|_.
  - Licensing: `Zlib <https://opensource.org/licenses/Zlib>`__.

  .. |zlib| replace:: ``[OpenCOR]/src/plugins/thirdParty/zlib``
  .. _zlib: https://github.com/opencor/opencor/tree/master/src/plugins/thirdParty/zlib
