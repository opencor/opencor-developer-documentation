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
For example, |miscellaneousDirectory|_ contains the code of our different `Miscellaneous <https://github.com/opencor/opencor/tree/master/src/plugins/miscellaneous/>`_ plugins and |coreDirectory|_ that of the `Core <https://github.com/opencor/opencor/tree/master/src/plugins/miscellaneous/Core/>`__ plugin in particular.

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

Following those keywords are the parameters themselves, as can be seen in |CMakeLists.txt|_ for the `Core <https://github.com/opencor/opencor/tree/master/src/plugins/miscellaneous/Core/>`__ plugin.

.. |CMakeLists.txt| replace:: ``[OpenCOR]/src/plugins/miscellaneous/Core/CMakeLists.txt``
.. _CMakeLists.txt: https://github.com/opencor/opencor/blob/master/src/plugins/miscellaneous/Core/CMakeLists.txt

Plugin information
------------------

For a plugin to be recognisable by OpenCOR, it must provide some :ref:`basic information <develop_plugins_index_basicInformation>` about itself, as well as define a :ref:`plugin class <develop_plugins_index_pluginClass>`.
For this, we need a ``.cpp``, ``.h`` and ``.json`` file, such as |coreplugin.cpp|_, |coreplugin.h|_ and |coreplugin.json|_ for the `Core <https://github.com/opencor/opencor/tree/master/src/plugins/miscellaneous/Core/>`__ plugin.

.. |coreplugin.cpp| replace:: ``[OpenCOR]/src/plugins/miscellaneous/Core/src/coreplugin.cpp``
.. _coreplugin.cpp: https://github.com/opencor/opencor/blob/master/src/plugins/miscellaneous/Core/src/coreplugin.cpp

.. |coreplugin.h| replace:: ``[OpenCOR]/src/plugins/miscellaneous/Core/src/coreplugin.h``
.. _coreplugin.h: https://github.com/opencor/opencor/blob/master/src/plugins/miscellaneous/Core/src/coreplugin.h

.. |coreplugin.json| replace:: ``[OpenCOR]/src/plugins/miscellaneous/Core/src/coreplugin.json``
.. _coreplugin.json: https://github.com/opencor/opencor/blob/master/src/plugins/miscellaneous/Core/src/coreplugin.json

``.json`` file
""""""""""""""

The ``.json`` file is a simple `JSON <http://www.json.org/>`_ file, which sole purpose is to reference the name of the plugin class.
In the case of the `Core <https://github.com/opencor/opencor/tree/master/src/plugins/miscellaneous/Core/>`__ plugin, the contents of that file is:

.. code-block:: json

   {
       "Keys": [ "CorePlugin" ]
   }

Namespace
"""""""""

The code for the :ref:`basic information <develop_plugins_index_basicInformation>` and :ref:`plugin class <develop_plugins_index_pluginClass>` must be in the plugin's own namespace within the ``OpenCOR`` namespace.
More generally, any plugin-related code should be within those two namespaces, this to ensure the integrity of the plugin's code.
Thus, in the case of the `Core <https://github.com/opencor/opencor/tree/master/src/plugins/miscellaneous/Core/>`__ plugin, we must have:

.. code-block:: c++

   ...
   namespace OpenCOR {
   namespace Core {
   ...
   }   // namespace Core
   }   // namespace OpenCOR
   ...

.. _develop_plugins_index_basicInformation:

Basic information
"""""""""""""""""

Plugins must provide the following basic information about themselves:

- **Category:** category under which the plugin is to be listed.
- **Selectable:** whether the plugin can be selected by the user (for loading upon starting OpenCOR).
- |CLI|_ **support:** whether the plugin works from the command line.
- **Dependencies:** plugins on which the plugin depends directly.
- **Descriptions:** description of the plugin in various languages.
- **Load before:** plugins before which the plugin should be loaded.

.. |CLI| replace:: **CLI**
.. _CLI: https://en.wikipedia.org/wiki/Command-line_interface

This information is made available to OpenCOR through a function, which in the case of the Core plugin has the following declaration:

.. code-block:: c++

   PLUGININFO_FUNC CorePluginInfo();

**Note:** to ensure the uniqueness of a plugin, OpenCOR uses the name of a plugin to determine the name of its function.
In other words, the name of the function is expected to be ``<PluginName>PluginInfo()``.
If it is not, OpenCOR will not be able to recognise the plugin.

In the case of the `Core <https://github.com/opencor/opencor/tree/master/src/plugins/miscellaneous/Core/>`__ plugin, the body of its function is:

.. code-block:: c++

   PLUGININFO_FUNC CorePluginInfo()
   {
       Descriptions descriptions;

       descriptions.insert("en", QString::fromUtf8("the core plugin."));
       descriptions.insert("fr", QString::fromUtf8("l'extension de base."));

       return new PluginInfo(PluginInfo::Miscellaneous, false, false,
                             QStringList(),
                             descriptions);
   }

**Note:** support for the internationalisation of a plugin's description would normally be done using `Qt <https://www.qt.io/>`_'s ``tr()`` function, but the C nature of the function means that it cannot be done.
So, instead, we use a ``QMap``-based approach.

.. _develop_plugins_index_pluginClass:

Plugin class
""""""""""""

We rely on `Qt <https://www.qt.io/>`_'s support for plugins, which means that plugins must define a specific class.
The class must inherit from ``QObject``, as well as from any interface the plugin implements.
For example, the `Core <https://github.com/opencor/opencor/tree/master/src/plugins/miscellaneous/Core/>`__ plugin implements the `Core <https://github.com/opencor/opencor/blob/master/src/plugins/coreinterface.inl>`_, `File Handling <https://github.com/opencor/opencor/blob/master/src/plugins/filehandlinginterface.inl>`_, `GUI <https://github.com/opencor/opencor/blob/master/src/plugins/guiinterface.inl>`_, `Internationalisation <https://github.com/opencor/opencor/blob/master/src/plugins/i18ninterface.inl>`_ and `Plugin <https://github.com/opencor/opencor/blob/master/src/plugins/plugininterface.inl>`_ interfaces, so its class definition is:

.. code-block:: c++

   ...
   class CorePlugin : public QObject, public CoreInterface,
                      public FileHandlingInterface, public GuiInterface,
                      public I18nInterface, public PluginInterface
   {
       Q_OBJECT

       Q_PLUGIN_METADATA(IID "OpenCOR.CorePlugin" FILE "coreplugin.json")

       Q_INTERFACES(OpenCOR::CoreInterface)
       Q_INTERFACES(OpenCOR::FileHandlingInterface)
       Q_INTERFACES(OpenCOR::GuiInterface)
       Q_INTERFACES(OpenCOR::I18nInterface)
       Q_INTERFACES(OpenCOR::PluginInterface)

   public:
   ...
   #include "coreinterface.inl"
   #include "filehandlinginterface.inl"
   #include "guiinterface.inl"
   #include "i18ninterface.inl"
   #include "plugininterface.inl"
   ...
   };
   ...

On the other hand, our `LLVM+Clang <https://github.com/opencor/opencor/tree/master/src/plugins/thirdParty/LLVMClang/>`_ plugin does not need to implement any interface since its sole purpose is to provide other plugins with access to `LLVM <http://www.llvm.org/>`_ and `Clang <http://clang.llvm.org/>`_.
Hence, its much simpler class definition:

.. code-block:: c++

   ...
   class LLVMClangPlugin : public QObject
   {
       Q_OBJECT

       Q_PLUGIN_METADATA(IID "OpenCOR.LLVMClangPlugin" FILE "llvmclangplugin.json")
   };
   ...

Global header file
""""""""""""""""""

There may be cases where a plugin declares a function or defines a class that we want to be able to use from another plugin.
On `Linux <https://en.wikipedia.org/wiki/Linux>`_ and `macOS <https://en.wikipedia.org/wiki/MacOS>`_, nothing special needs to be done, but on `Windows <https://en.wikipedia.org/wiki/Microsoft_Windows>`_, the function or class needs to be exported by the original plugin:

.. code-block:: c++

   void __declspec(dllexport) myFunction();
   class __declspec(dllexport) myClass;

and imported by the plugin that wants to use it:

.. code-block:: c++

   void __declspec(dllimport) myFunction();
   class __declspec(dllimport) myClass;

Each plugin that exports functions and/or classes therefore defines a macro that refers either to ``__declspec(dllexport)`` or to ``__declspec(dllimport)``, depending on how the plugin's code is to be compiled.
Thus, in the case of the `Compiler <https://github.com/opencor/opencor/tree/master/src/plugins/miscellaneous/Compiler/>`_ plugin, we have:

.. code-block:: c++

   ...
   #ifdef _WIN32
       #ifdef Compiler_PLUGIN
           #define COMPILER_EXPORT __declspec(dllexport)
       #else
           #define COMPILER_EXPORT __declspec(dllimport)
       #endif
   #else
       #define COMPILER_EXPORT
   #endif
   ...

``_WIN32`` and ``Compiler_PLUGIN`` (or, more generally, ``<PluginName>_PLUGIN``) are automatically defined, if at all, at build time, and are used to determine the value of ``COMPILER_EXPORT`` (or, more generally, the value of ``<PLUGINNAME>_EXPORT``), which can then be used as follows without having to worry whether the function or class should be imported or exported:

.. code-block:: c++

   void COMPILER_EXPORT myFunction();
   class COMPILER_EXPORT myClass;
