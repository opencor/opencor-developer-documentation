.. _develop_plugins_index:

=========
 Plugins
=========

To help you get started, you might want to have a look at the following sample plugins.
They illustrate the basic concepts needed to develop plugins for OpenCOR:

- :ref:`develop_plugins_sample`
- :ref:`develop_plugins_sampleTools`
- :ref:`develop_plugins_sampleView`
- :ref:`develop_plugins_sampleWindow`

**Note:** these plugins only get built if the `CMake <https://www.cmake.org/>`__ ``ENABLE_SAMPLE_PLUGINS`` option is set to ``ON``.

.. _develop_plugins_index_categories:

Categories
----------

All plugins come under one of the following categories:

- |DataStoreCategory|_: plugins to store and manipulate data.
- |EditingCategory|_: plugins to edit files.
- |MiscellaneousCategory|_: plugins that do not fit in any other category.
- |OrganisationCategory|_: plugins to organise files.
- |SampleCategory|_: plugins that illustrate various plugin-related aspects.
- |SimulationCategory|_: plugins to simulate files.
- |SolverCategory|_: plugins to access various solvers.
- |SupportCategory|_: plugins to support various third-party libraries.
- |TestCategory|_: test plugins.
- |ThirdPartyCategory|_: plugins to access various third-party libraries.
- |ToolsCategory|_: plugins to access various tools.
- |WidgetCategory|_: plugins to access various ad hoc widgets.

.. |DataStoreCategory| replace:: **Data Store**
.. _DataStoreCategory: https://github.com/opencor/opencor/tree/master/src/plugins/dataStore/

.. |EditingCategory| replace:: **Editing**
.. _EditingCategory: https://github.com/opencor/opencor/tree/master/src/plugins/editing/

.. |MiscellaneousCategory| replace:: **Miscellaneous**
.. _MiscellaneousCategory: https://github.com/opencor/opencor/tree/master/src/plugins/miscellaneous/

.. |OrganisationCategory| replace:: **Organisation**
.. _OrganisationCategory: https://github.com/opencor/opencor/tree/master/src/plugins/organisation/

.. |SampleCategory| replace:: **Sample**
.. _SampleCategory: https://github.com/opencor/opencor/tree/master/src/plugins/sample/

.. |SimulationCategory| replace:: **Simulation**
.. _SimulationCategory: https://github.com/opencor/opencor/tree/master/src/plugins/simulation/

.. |SolverCategory| replace:: **Solver**
.. _SolverCategory: https://github.com/opencor/opencor/tree/master/src/plugins/solver/

.. |SupportCategory| replace:: **Support**
.. _SupportCategory: https://github.com/opencor/opencor/tree/master/src/plugins/support/

.. |TestCategory| replace:: **Test**
.. _TestCategory: https://github.com/opencor/opencor/tree/master/src/plugins/test/

.. |ThirdPartyCategory| replace:: **Third-party**
.. _ThirdPartyCategory: https://github.com/opencor/opencor/tree/master/src/plugins/thirdParty/

.. |ToolsCategory| replace:: **Tools**
.. _ToolsCategory: https://github.com/opencor/opencor/tree/master/src/plugins/tools/

.. |WidgetCategory| replace:: **Widget**
.. _WidgetCategory: https://github.com/opencor/opencor/tree/master/src/plugins/widget/

A category is used by OpenCOR to group plugins together to improve user experience.
From a developer's perspective, a category determines where a plugin's code should be located.
Thus, the different folders under |plugins|_ are for our different categories.
For example, |miscellaneousDirectory|_ contains the code of our different `Miscellaneous <https://github.com/opencor/opencor/tree/master/src/plugins/miscellaneous/>`__ plugins and |coreDirectory|_ that of the `Core <https://github.com/opencor/opencor/tree/master/src/plugins/miscellaneous/Core/>`__ plugin in particular.

.. |plugins| replace:: ``[OpenCOR]/src/plugins/``
.. _plugins: https://github.com/opencor/opencor/blob/master/src/plugins/

.. |miscellaneousDirectory| replace:: ``[OpenCOR]/src/plugins/miscellaneous/``
.. _miscellaneousDirectory: https://github.com/opencor/opencor/blob/master/src/plugins/miscellaneous/

.. |coreDirectory| replace:: ``[OpenCOR]/src/plugins/miscellaneous/Core/``
.. _coreDirectory: https://github.com/opencor/opencor/blob/master/src/plugins/miscellaneous/Core/

**Note:** the |SampleCategory|_ and |TestCategory|_ categories are special categories in that they are only available when building OpenCOR with the ``ENABLE_SAMPLE_PLUGINS`` and/or ``ENABLE_TEST_PLUGINS`` options set to ``ON``.
They should therefore only be used for plugins that are aimed at helping people who want to learn how to write plugins for OpenCOR, and/or for test plugins.

.. _develop_plugins_index_interfaces:

Interfaces
----------

Plugins can implement different interfaces.
Those interfaces allow a plugin, through the implementation of various methods, to interact with OpenCOR.
Currently supported interfaces can be found under |plugins|_.
They are:

- |CLIInterface|_: to support command line execution.
- |CoreInterface|_: to control some of OpenCOR's core aspects.
- |DataStoreInterface|_: to let OpenCOR know about the name of a data store, as well as retrieve some data from it and provide an instance of its exporter.
- |FileHandlingInterface|_: to save a file, as well as to be told whenever a file has been opened, modified, closed, etc.
- |FileTypeInterface|_: to let OpenCOR know about supported file types and their description.
- |GUIInterface|_: to let OpenCOR know about the menus and menu actions that we want to see added to the `GUI <https://en.wikipedia.org/wiki/Graphical_user_interface>`__, as well as to be told whenever the `GUI <https://en.wikipedia.org/wiki/Graphical_user_interface>`__ needs updating.
- |InternationalisationInterface|_: to be told whenever we should retranslate ourselves.
- |PluginInterface|_: to initialise/finalise a plugin, load/save its settings, etc.
- |PreferencesInterface|_: to specify a plugin's default behaviour, settings, etc.
- |SolverInterface|_: to let OpenCOR know about the type, name and properties of a solver, as well as to provide OpenCOR with an instance of that solver.
- |ViewInterface|_: to let OpenCOR know about the name of a view, its mode, the MIME types it supports, whether we have a view for the current file, etc.
- |WindowInterface|_: to let OpenCOR know about the widget, action and default location of a window.

.. |CLIInterface| replace:: **CLI**
.. _CLIInterface: https://github.com/opencor/opencor/blob/master/src/plugins/cliinterface.inl

.. |CoreInterface| replace:: **Core**
.. _CoreInterface: https://github.com/opencor/opencor/blob/master/src/plugins/coreinterface.inl

.. |DataStoreInterface| replace:: **Data Store**
.. _DataStoreInterface: https://github.com/opencor/opencor/blob/master/src/plugins/datastoreinterface.inl

.. |FileHandlingInterface| replace:: **File Handling**
.. _FileHandlingInterface: https://github.com/opencor/opencor/blob/master/src/plugins/filehandlinginterface.inl

.. |FileTypeInterface| replace:: **File Type**
.. _FileTypeInterface: https://github.com/opencor/opencor/blob/master/src/plugins/filetypeinterface.inl

.. |GUIInterface| replace:: **GUI**
.. _GUIInterface: https://github.com/opencor/opencor/blob/master/src/plugins/guiinterface.inl

.. |InternationalisationInterface| replace:: **Internationalisation**
.. _InternationalisationInterface: https://github.com/opencor/opencor/blob/master/src/plugins/i18ninterface.inl

.. |PluginInterface| replace:: **Plugin**
.. _PluginInterface: https://github.com/opencor/opencor/blob/master/src/plugins/plugininterface.inl

.. |PreferencesInterface| replace:: **Preferences**
.. _PreferencesInterface: https://github.com/opencor/opencor/blob/master/src/plugins/preferencesinterface.inl

.. |SolverInterface| replace:: **Solver**
.. _SolverInterface: https://github.com/opencor/opencor/blob/master/src/plugins/solverinterface.inl

.. |ViewInterface| replace:: **View**
.. _ViewInterface: https://github.com/opencor/opencor/blob/master/src/plugins/viewinterface.inl

.. |WindowInterface| replace:: **Window**
.. _WindowInterface: https://github.com/opencor/opencor/blob/master/src/plugins/windowinterface.inl

Some plugins do not implement any interface (e.g. the `LLVM+Clang <https://github.com/opencor/opencor/tree/master/src/plugins/thirdParty/LLVMClang/>`__ plugin) while others may implement one or several interfaces (e.g. the `Core <https://github.com/opencor/opencor/tree/master/src/plugins/miscellaneous/Core/>`__ plugin implements the `Core <https://github.com/opencor/opencor/blob/master/src/plugins/coreinterface.inl>`__, `File Handling <https://github.com/opencor/opencor/blob/master/src/plugins/filehandlinginterface.inl>`__, `GUI <https://github.com/opencor/opencor/blob/master/src/plugins/guiinterface.inl>`__, `Internationalisation <https://github.com/opencor/opencor/blob/master/src/plugins/i18ninterface.inl>`__ and `Plugin <https://github.com/opencor/opencor/blob/master/src/plugins/plugininterface.inl>`__ interfaces).

**Note:** the `Core <https://github.com/opencor/opencor/blob/master/src/plugins/coreinterface.inl>`__ interface is a special interface in that it is only, and can only be, implemented by the `Core <https://github.com/opencor/opencor/tree/master/src/plugins/miscellaneous/Core/>`__ plugin.
Any plugin, besides the `Core <https://github.com/opencor/opencor/tree/master/src/plugins/miscellaneous/Core/>`__ plugin, that tries to implement the `Core <https://github.com/opencor/opencor/blob/master/src/plugins/coreinterface.inl>`__ interface will be reported by OpenCOR as being invalid.

.. _develop_plugins_index_cmakeProject:

CMake project
-------------

OpenCOR is built and packaged using `CMake <https://www.cmake.org/>`__.
When it comes to plugins, this requires creating a ``CMakeLists.txt`` file in the plugin's root folder and calling the ``add_plugin()`` macro, which is defined in |common.cmake|_.
The ``add_plugin()`` macro uses information passed to it to build and package the plugin.
That information comes in the form of a series of parameters, some of which are keywords:

- ``SOURCES``: implementation files.
- ``HEADERS_MOC``: header files, which define at least one ``QObject``-based class.
- ``UIS``: user interface files.
- ``DEFINITIONS``: definitions needed to build the plugin.
- ``PLUGINS``: plugins needed by the plugin.
- ``QT_MODULES``: Qt modules needed by the plugin.
- ``EXTERNAL_BINARIES_DIR``: location of external binaries needed by the plugin.
- ``EXTERNAL_BINARIES``: external binaries needed by the plugin.
- ``EXTERNAL_DESTINATION_DIR``: location where external dependencies are to be copied.
- ``EXTERNAL_SOURCE_DIR``: location of external dependencies.
- ``SYSTEM_BINARIES``: system binaries needed by the plugin.
- ``DEPENDS_ON``: CMake targets on which the plugin depends.
- ``TESTS``: :ref:`tests <develop_tests>` for the plugin.

.. |common.cmake| replace:: ``[OpenCOR]/cmake/common.cmake``
.. _common.cmake: https://github.com/opencor/opencor/blob/master/cmake/common.cmake

Following those keywords are the parameters themselves, as can be seen in |CMakeLists.txt|_ for the `Core <https://github.com/opencor/opencor/tree/master/src/plugins/miscellaneous/Core/>`__ plugin.

.. |CMakeLists.txt| replace:: ``[OpenCOR]/src/plugins/miscellaneous/Core/CMakeLists.txt``
.. _CMakeLists.txt: https://github.com/opencor/opencor/blob/master/src/plugins/miscellaneous/Core/CMakeLists.txt

.. _develop_plugins_index_pluginInformation:

Plugin information
------------------

For a plugin to be recognisable by OpenCOR, it must provide some :ref:`basic information <develop_plugins_index_basicInformation>` about itself, as well as define a :ref:`plugin class <develop_plugins_index_pluginClass>`.
For this, we need a ``.cpp``, a ``.h`` and a ``.json`` file, such as |coreplugin.cpp|_, |coreplugin.h|_ and |coreplugin.json|_ for the `Core <https://github.com/opencor/opencor/tree/master/src/plugins/miscellaneous/Core/>`__ plugin.

.. |coreplugin.cpp| replace:: ``[OpenCOR]/src/plugins/miscellaneous/Core/src/coreplugin.cpp``
.. _coreplugin.cpp: https://github.com/opencor/opencor/blob/master/src/plugins/miscellaneous/Core/src/coreplugin.cpp

.. |coreplugin.h| replace:: ``[OpenCOR]/src/plugins/miscellaneous/Core/src/coreplugin.h``
.. _coreplugin.h: https://github.com/opencor/opencor/blob/master/src/plugins/miscellaneous/Core/src/coreplugin.h

.. |coreplugin.json| replace:: ``[OpenCOR]/src/plugins/miscellaneous/Core/src/coreplugin.json``
.. _coreplugin.json: https://github.com/opencor/opencor/blob/master/src/plugins/miscellaneous/Core/src/coreplugin.json

.. _develop_plugins_index_jsonFile:

``.json`` file
""""""""""""""

The ``.json`` file is a simple `JSON <http://www.json.org/>`__ file, which sole purpose is to reference the name of the plugin class.
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

This information is made available to OpenCOR through a function, which in the case of the `Core <https://github.com/opencor/opencor/tree/master/src/plugins/miscellaneous/Core/>`__ plugin has the following declaration:

.. code-block:: c++

   PLUGININFO_FUNC CorePluginInfo();

**Note:** to ensure the uniqueness of a plugin, OpenCOR uses the name of a plugin to determine the name of its function.
In other words, the name of the function is expected to be ``<PluginName>PluginInfo()``.
If it is not, OpenCOR will not be able to recognise the plugin.

In the case of the `Core <https://github.com/opencor/opencor/tree/master/src/plugins/miscellaneous/Core/>`__ plugin, the body of that function is:

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

**Note:** support for the internationalisation of a plugin's description would normally be done using `Qt <https://www.qt.io/>`__'s ``tr()`` function, but the C nature of the function means that it cannot be done.
So, instead, we use a ``QMap``-based approach.

.. _develop_plugins_index_pluginClass:

Plugin class
""""""""""""

We rely on `Qt <https://www.qt.io/>`__'s support for plugins, which means that plugins must define a specific class.
The class must inherit from ``QObject``, as well as from any interface the plugin implements.
For example, the `Core <https://github.com/opencor/opencor/tree/master/src/plugins/miscellaneous/Core/>`__ plugin implements the `Core <https://github.com/opencor/opencor/blob/master/src/plugins/coreinterface.inl>`__, `File Handling <https://github.com/opencor/opencor/blob/master/src/plugins/filehandlinginterface.inl>`__, `GUI <https://github.com/opencor/opencor/blob/master/src/plugins/guiinterface.inl>`__, `Internationalisation <https://github.com/opencor/opencor/blob/master/src/plugins/i18ninterface.inl>`__ and `Plugin <https://github.com/opencor/opencor/blob/master/src/plugins/plugininterface.inl>`__ interfaces, so its class definition is:

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

On the other hand, our `LLVM+Clang <https://github.com/opencor/opencor/tree/master/src/plugins/thirdParty/LLVMClang/>`__ plugin does not need to implement any interface since its sole purpose is to provide other plugins with access to `LLVM <http://www.llvm.org/>`__ and `Clang <http://clang.llvm.org/>`__.
Hence, its much simpler class definition:

.. code-block:: c++

   ...
   class LLVMClangPlugin : public QObject
   {
       Q_OBJECT

       Q_PLUGIN_METADATA(IID "OpenCOR.LLVMClangPlugin" FILE "llvmclangplugin.json")
   };
   ...

.. _develop_plugins_index_globalHeaderInformation:

Global header file
""""""""""""""""""

There may be cases where a plugin declares a function or defines a class that we want to be able to use from another plugin.
On `Linux <https://en.wikipedia.org/wiki/Linux>`__ and `macOS <https://en.wikipedia.org/wiki/MacOS>`__, nothing special needs to be done, but on `Windows <https://en.wikipedia.org/wiki/Microsoft_Windows>`__, the function or class needs to be exported by the original plugin:

.. code-block:: c++

   void __declspec(dllexport) myFunction();
   class __declspec(dllexport) myClass;

and imported by the plugin that wants to use it:

.. code-block:: c++

   void __declspec(dllimport) myFunction();
   class __declspec(dllimport) myClass;

Each plugin that exports functions and/or classes must therefore define a macro that refers either to ``__declspec(dllexport)`` or to ``__declspec(dllimport)``, depending on how the plugin's code is to be compiled.
Thus, in the case of the `Compiler <https://github.com/opencor/opencor/tree/master/src/plugins/miscellaneous/Compiler/>`__ plugin, we have:

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
