.. _buildTestAndRun:

=====================
 Build, test and run
=====================

OpenCOR (and its corresponding :ref:`tests <develop_tests>`) can be built, tested and run either from the command line or using `Qt Creator <https://www.qt.io/ide/>`_.
By default, `Ninja <https://ninja-build.org/>`_ is used to build OpenCOR, but if it is not available on your system, then `JOM <https://wiki.qt.io/Jom>`_ (on `Windows <https://en.wikipedia.org/wiki/Microsoft_Windows>`_) or `Make <https://www.gnu.org/software/make/>`_ (on `Linux <https://en.wikipedia.org/wiki/Linux>`_ / `macOS <https://en.wikipedia.org/wiki/MacOS>`_) will be used instead.

.. _buildTestAndRunFromTheCommandLine:

From the command line
---------------------

Various batch / VBScript files (``.bat`` \| ``.vbs``) and shell scripts are available on `Windows <https://en.wikipedia.org/wiki/Microsoft_Windows>`_ and `Linux <https://en.wikipedia.org/wiki/Linux>`_ / `macOS <https://en.wikipedia.org/wiki/MacOS>`_, respectively:

- |cleanScript|_\[|cleanallScript|_][|cleanBatch|_]: cleans (all) the OpenCOR environment;
- |makeScript|_\[|makeBatch|_]: compiles and links everything that is required to get a release version of OpenCOR;
    **Note:** if you use ``make`` and don't have `Ninja <https://ninja-build.org/>`_ installed on your system, then OpenCOR will, by default, be compiled sequentially.
    You can, however, specify a maximum number of jobs (``n``) to be run simultaneously by calling ``make`` with ``-j [n]``.
    If no ``n`` value is provided, then as many jobs as possible will be run simultaneously.
- |maketestsScript|_\[|maketestsBatch|_]: builds a release version of OpenCOR and its tests;
- |runScript|_\[|runBatch|_ | |runVBScript|_]: runs OpenCOR; and
    **Note:** on Windows, if you were to run OpenCOR from a console window by entering ``run``, then ``run.bat`` would be executed (rather than ``run.vbs``), offering you the opportunity to use OpenCOR as a `CLI <https://en.wikipedia.org/wiki/Command-line_interface>`_ application.
    However, if you were to run OpenCOR by double clicking ``run.bat`` in, say, Windows Explorer, then a console window would quickly appear and disappear.
    To avoid this, use ``run.vbs`` instead.
- |runtestsScript|_\[|runtestsBatch|_]: runs OpenCOR's tests.

.. |cleanScript| replace:: ``[OpenCOR]/clean``
.. _cleanScript: https://github.com/opencor/opencor/blob/master/clean

.. |cleanallScript| replace:: ``all``
.. _cleanallScript: https://github.com/opencor/opencor/blob/master/cleanall

.. |cleanBatch| replace:: ``.bat``
.. _cleanBatch: https://github.com/opencor/opencor/blob/master/clean.bat

.. |makeScript| replace:: ``[OpenCOR]/make``
.. _makeScript: https://github.com/opencor/opencor/blob/master/make

.. |makeBatch| replace:: ``.bat``
.. _makeBatch: https://github.com/opencor/opencor/blob/master/make.bat

.. |maketestsScript| replace:: ``[OpenCOR]/maketests``
.. _maketestsScript: https://github.com/opencor/opencor/blob/master/maketests

.. |maketestsBatch| replace:: ``.bat``
.. _maketestsBatch: https://github.com/opencor/opencor/blob/master/maketests.bat

.. |runScript| replace:: ``[OpenCOR]/run``
.. _runScript: https://github.com/opencor/opencor/blob/master/run

.. |runBatch| replace:: ``.bat``
.. _runBatch: https://github.com/opencor/opencor/blob/master/run.bat

.. |runVBScript| replace:: ``.vbs``
.. _runVBScript: https://github.com/opencor/opencor/blob/master/run.vbs

.. |runtestsScript| replace:: ``[OpenCOR]/runtests``
.. _runtestsScript: https://github.com/opencor/opencor/blob/master/runtests

.. |runtestsBatch| replace:: ``.bat``
.. _runtestsBatch: https://github.com/opencor/opencor/blob/master/runtests.bat

Using Qt Creator
----------------

- Start `Qt Creator <https://www.qt.io/ide/>`_;
- Open |cmakeFile|_ (by selecting the ``File`` | ``Open File or Project...`` menu or by pressing ``Ctrl``\ +\ ``O``;
- Configure the project as you see fit and click on the ``Configure Project`` button;
- Configure CMake, if needed, by going to the ``Projects`` page and setting, for example, ``ENABLE_TESTS`` to ``ON``, and click on the ``Apply Configuration Changes`` button; and
- Build and run OpenCOR (by selecting the ``Build`` | ``Run`` menu or by pressing ``Ctrl`` + ``R``).

.. |cmakeFile| replace:: ``[OpenCOR]/CMakeLists.txt``
.. _cmakeFile: https://github.com/opencor/opencor/blob/master/CMakeLists.txt
