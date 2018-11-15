.. _develop_tests:

=======
 Tests
=======

Tests can be created at the :ref:`plugins <develop_plugins_index>` level.
Tests must:

- Be located under the ``tests`` folder of a plugin folder (e.g. |tests|_ for the `Compiler <https://github.com/opencor/opencor/tree/master/src/plugins/miscellaneous/Compiler/>`__ plugin);

  .. |tests| replace:: ``[OpenCOR]/src/plugins/miscellaneous/Compiler/tests``
  .. _tests: https://github.com/opencor/opencor/blob/master/src/plugins/miscellaneous/Compiler/tests

- Consist of at least one set of ``.cpp`` and ``.h`` files (e.g. |tests.cpp|_ and |tests.h|_ for the `Compiler <https://github.com/opencor/opencor/tree/master/src/plugins/miscellaneous/Compiler/>`__ plugin);

  .. |tests.cpp| replace:: ``[OpenCOR]/src/plugins/miscellaneous/Compiler/tests/tests.cpp``
  .. _tests.cpp: https://github.com/opencor/opencor/blob/master/src/plugins/miscellaneous/Compiler/tests/tests.cpp

  .. |tests.h| replace:: ``[OpenCOR]/src/plugins/miscellaneous/Compiler/tests/tests.h``
  .. _tests.h: https://github.com/opencor/opencor/blob/master/src/plugins/miscellaneous/Compiler/tests/tests.h

- Be listed under the ``TESTS`` header in the call to our `CMake <https://www.cmake.org/>`__ |add_plugin|_ macro of the plugin's ``CMakeLists.txt`` file (e.g. |CMakeLists.txt|_ for the `Compiler <https://github.com/opencor/opencor/tree/master/src/plugins/miscellaneous/Compiler/>`__ plugin):

  .. code-block:: cmake

     project(MyPlugin)

     # Add the plugin

     add_plugin(MyPlugin
         ...
         TESTS
             tests1
             tests2
             tests3
             ...
     )

  .. |add_plugin| replace:: ``add_plugin()``
  .. _add_plugin: https://github.com/opencor/opencor/blob/master/cmake/common.cmake

  .. |CMakeLists.txt| replace:: ``[OpenCOR]/src/plugins/miscellaneous/Compiler/CMakeLists.txt``
  .. _CMakeLists.txt: https://github.com/opencor/opencor/blob/master/src/plugins/miscellaneous/Compiler/CMakeLists.txt

Some useful functions can be found under the main tests folder (see |testsutils.cpp|_ and |testsutils.h|_).

.. |testsutils.cpp| replace:: ``[OpenCOR]/src/tests/src/testsutils.cpp``
.. _testsutils.cpp: https://github.com/opencor/opencor/blob/master/src/tests/src/testsutils.cpp

.. |testsutils.h| replace:: ``[OpenCOR]/src/tests/src/testsutils.h``
.. _testsutils.h: https://github.com/opencor/opencor/blob/master/src/tests/src/testsutils.h
