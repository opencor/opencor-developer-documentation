.. _buildTestAndRun:

=====================
 Build, test and run
=====================

OpenCOR (and its corresponding :ref:`tests <develop_tests>`) can be built, tested and run either from the command line or using `Qt Creator <https://qt.io/product/development-tools>`__.
By default, `Ninja <https://ninja-build.org/>`__ is used to build OpenCOR, but if it is not available, then `JOM <https://wiki.qt.io/Jom>`__ (on `Windows <https://en.wikipedia.org/wiki/Microsoft_Windows>`__) or `Make <https://gnu.org/software/make>`__ (on `Linux <https://en.wikipedia.org/wiki/Linux>`__/`macOS <https://en.wikipedia.org/wiki/MacOS>`__) will be used.

.. _buildTestAndRunFromTheCommandLine:

From the command line
---------------------

Various batch/VBScript files (``.bat`` \| ``.vbs``) and shell scripts are available on `Windows <https://en.wikipedia.org/wiki/Microsoft_Windows>`__ and `Linux <https://en.wikipedia.org/wiki/Linux>`__/`macOS <https://en.wikipedia.org/wiki/MacOS>`__, respectively:

- |ciScript|_\[|ciBatch|_]: build and test everything, both in release and debug mode;
- |cleanScript|_\[|cleanallScript|_][|cleanBatch|_]: clean (all) the OpenCOR environment;
- |formatScript|_\[|formatBatch|_]: format the OpenCOR code;
- |makeScript|_\[|makeBatch|_]: build a release version of OpenCOR;

  **Note:** if you use `Make <https://gnu.org/software/make>`__, then OpenCOR will, by default, be built sequentially.
  You can, however, specify a maximum number of jobs (``n``) to be run simultaneously by calling ``make -j [n]``.
  If no ``n`` value is provided, then as many jobs as possible will be run simultaneously.

- |maketestsScript|_\[|maketestsBatch|_]: build a debug version of OpenCOR suitable for testing;
- |runScript|_\[|runBatch|_ | |runVBScript|_]: run OpenCOR; and

  **Note:** on Windows, if you run OpenCOR from a console window by entering ``run``, then ``run.bat`` will be executed (rather than ``run.vbs``), offering you the opportunity to use OpenCOR as a `CLI <https://en.wikipedia.org/wiki/Command-line_interface>`__ application.
  However, if you run OpenCOR by double clicking ``run.bat`` in, say, Windows Explorer, then a console window will quickly appear and disappear.
  To avoid this, use ``run.vbs``.

- |runtestsScript|_\[|runtestsBatch|_]: runs OpenCOR's tests.

.. |ciScript| replace:: ``[OpenCOR]/ci``
.. _ciScript: https://github.com/opencor/opencor/blob/master/ci

.. |ciBatch| replace:: ``.bat``
.. _ciBatch: https://github.com/opencor/opencor/blob/master/ci.bat

.. |cleanScript| replace:: ``[OpenCOR]/clean``
.. _cleanScript: https://github.com/opencor/opencor/blob/master/clean

.. |cleanallScript| replace:: ``all``
.. _cleanallScript: https://github.com/opencor/opencor/blob/master/cleanall

.. |cleanBatch| replace:: ``.bat``
.. _cleanBatch: https://github.com/opencor/opencor/blob/master/clean.bat

.. |formatScript| replace:: ``[OpenCOR]/format``
.. _formatScript: https://github.com/opencor/opencor/blob/master/format

.. |formatBatch| replace:: ``.bat``
.. _formatBatch: https://github.com/opencor/opencor/blob/master/format.bat

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

- Start `Qt Creator <https://qt.io/product/development-tools>`__;
- Open |cmakeFile|_ (by selecting the ``File`` | ``Open File or Project...`` menu or by pressing ``Ctrl``\ +\ ``O``;
- Configure the project as you see fit and click on the ``Configure Project`` button;
- Configure `CMake <https://cmake.org/>`__, if needed, by going to the ``Projects`` page and setting, for example, ``ENABLE_TESTS`` to ``ON``, and click on the ``Run CMake`` button; and
- Build and run OpenCOR (by selecting the ``Build`` | ``Run`` menu or by pressing ``Ctrl``\ +\ ``R``).

.. |cmakeFile| replace:: ``[OpenCOR]/CMakeLists.txt``
.. _cmakeFile: https://github.com/opencor/opencor/blob/master/CMakeLists.txt
