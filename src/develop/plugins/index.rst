.. _develop_plugins_index:

=========
 Plugins
=========

To help you get started, you might want to have a look at the following sample plugins.
They illustrate the basic concepts needed to develop plugins for OpenCOR:

.. toctree::
   :maxdepth: 1

   sample
   sampleTools
   sampleView
   sampleWindow

**Note:** these plugins only get built if the CMake ``ENABLE_SAMPLE_PLUGINS`` option is set to ``ON``.

Category
--------

All plugins come under a given category.
Currently supported categories are:

- **Analysis**: plugins to analyse files.
- |API|_: plugins to access various APIs.
- |Data Store|_: plugins to store and manipulate data.
- |Editing|_: plugins to edit files.
- |Miscellaneous|_: plugins that do not fit in any other category.
- |Organisation|_: plugins to organise files.
- |Sample|_: plugins that illustrate various plugin-related aspects.
- |Simulation|_: plugins to simulate files.
- |Solver|_: plugins to access various solvers.
- |Support|_: plugins to support various third-party libraries and APIs.
- |Test|_: test plugins.
- |Third-party|_: plugins to access various third-party libraries.
- |Tools|_: plugins to access various tools.
- |Widget|_: plugins to access various ad hoc widgets.

.. |API| replace:: **API**
.. _API: https://github.com/opencor/opencor/tree/master/src/plugins/api/

.. |Data Store| replace:: **Data Store**
.. _Data Store: https://github.com/opencor/opencor/tree/master/src/plugins/dataStore/

.. |Editing| replace:: **Editing**
.. _Editing: https://github.com/opencor/opencor/tree/master/src/plugins/editing/

.. |Miscellaneous| replace:: **Miscellaneous**
.. _Miscellaneous: https://github.com/opencor/opencor/tree/master/src/plugins/miscellaneous/

.. |Organisation| replace:: **Organisation**
.. _Organisation: https://github.com/opencor/opencor/tree/master/src/plugins/organisation/

.. |Sample| replace:: **Sample**
.. _Sample: https://github.com/opencor/opencor/tree/master/src/plugins/sample/

.. |Simulation| replace:: **Simulation**
.. _Simulation: https://github.com/opencor/opencor/tree/master/src/plugins/simulation/

.. |Solver| replace:: **Solver**
.. _Solver: https://github.com/opencor/opencor/tree/master/src/plugins/solver/

.. |Support| replace:: **Support**
.. _Support: https://github.com/opencor/opencor/tree/master/src/plugins/support/

.. |Test| replace:: **Test**
.. _Test: https://github.com/opencor/opencor/tree/master/src/plugins/test/

.. |Third-party| replace:: **Third-party**
.. _Third-party: https://github.com/opencor/opencor/tree/master/src/plugins/thirdParty/

.. |Tools| replace:: **Tools**
.. _Tools: https://github.com/opencor/opencor/tree/master/src/plugins/tools/

.. |Widget| replace:: **Widget**
.. _Widget: https://github.com/opencor/opencor/tree/master/src/plugins/widget/

A category is used by OpenCOR to group plugins together to improve user experience.
From a developer's perspective, a category determines where a plugin's code should be located.
Thus, the different folders under |plugins|_ are for our different categories.
For example, |miscellaneousDirectory|_ contains the code of our different `Miscellaneous <https://github.com/opencor/opencor/tree/master/src/plugins/miscellaneous/>`_ plugins and |coreDirectory|_ that of the `Core <https://github.com/opencor/opencor/tree/master/src/plugins/miscellaneous/Core/>`_ plugin in particular.

.. |plugins| replace:: ``[OpenCOR]/src/plugins/``
.. _plugins: https://github.com/opencor/opencor/blob/master/src/plugins/

.. |miscellaneousDirectory| replace:: ``[OpenCOR]/src/plugins/miscellaneous/``
.. _miscellaneousDirectory: https://github.com/opencor/opencor/blob/master/src/plugins/miscellaneous/

.. |coreDirectory| replace:: ``[OpenCOR]/src/plugins/miscellaneous/Core/``
.. _coreDirectory: https://github.com/opencor/opencor/blob/master/src/plugins/miscellaneous/Core/

**Note:** the |Sample|_ and |Test|_ categories are special categories in that they are only available when building OpenCOR with the ``ENABLE_SAMPLE_PLUGINS`` and/or ``ENABLE_TEST_PLUGINS`` options set to ``ON``.
They should therefore only be used for plugins that are aimed at helping people who want to learn how to write plugins for OpenCOR, and/or for test plugins.

CMake project
-------------

OpenCOR is built and packaged using `CMake <https://www.cmake.org/>`_.
When it comes to plugins, this requires creating a ``CMakeLists.txt`` file in the plugin's root folder and calling the ``add_plugin()`` macro, which is defined in |common.cmake|_.
The ``add_plugin()`` macro uses information passed to it to build and package the plugin.
That information comes in the form of a series of parameters, some of which are keywords:

- ``SOURCES``: implementation files.
- ``HEADERS_MOC``: header files, which define at least one ``QObject``-based class.
- ``UIS``: user interface files.
- ``DEFINITIONS``: definitions needed to build the plugin.
- ``QT_MODULES``: Qt modules needed by the plugin.
- ``EXTERNAL_BINARIES_DIR``: location where external binaries needed by the plugin can be found.
- ``EXTERNAL_BINARIES``: external binaries needed by the plugin.
- ``EXTERNAL_DEST_DIR``: location where external dependencies are to be copied.
- ``EXTERNAL_SOURCE_DIR``: location where external dependencies can be found.
- ``SYSTEM_BINARIES``: system binaries needed by the plugin.
- ``DEPENDS_ON``: plugins on which the plugin depends.
- ``TESTS``: :ref:`tests <develop_tests>` for the plugin.

.. |common.cmake| replace:: ``[OpenCOR]/cmake/common.cmake``
.. _common.cmake: https://github.com/opencor/opencor/blob/master/cmake/common.cmake

Following those keywords are the parameters themselves, as can be seen in |CMakeLists.txt|_ for the `Core <https://github.com/opencor/opencor/tree/master/src/plugins/miscellaneous/Core/>`_ plugin.

.. |CMakeLists.txt| replace:: ``[OpenCOR]/src/plugins/miscellaneous/Core/CMakeLists.txt``
.. _CMakeLists.txt: https://github.com/opencor/opencor/blob/master/src/plugins/miscellaneous/Core/CMakeLists.txt

Plugin information
------------------

.. _develop_plugins_index_pluginClass:

Plugin class
""""""""""""
